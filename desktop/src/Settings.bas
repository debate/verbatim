Attribute VB_Name = "Settings"
Option Explicit

Sub UnverbatimizeNormal()
' Deprecated except to uninstall old versions
    
    ' Delete module from normal template - turn off error checking in case it doesn't exist
    On Error Resume Next
    Application.OrganizerDelete source:=Application.NormalTemplate.FullName, Name:="AttachVerbatim", Object:=wdOrganizerObjectProjectItems

    ' Delete CustomUI if it exists
    #If Mac Then
        ' Do Nothing
    #Else
        Dim FSO As Scripting.FileSystemObject
        Set FSO = New Scripting.FileSystemObject
        On Error GoTo Handler
        If FSO.FileExists(CStr(Environ("USERPROFILE")) & "\AppData\Local\Microsoft\Office\Word.officeUI") = True Then
            Kill CStr(Environ("USERPROFILE")) & "\AppData\Local\Microsoft\Office\Word.officeUI"
        End If
    
        Set FSO = Nothing
    #End If
    
    MsgBox "Normal template successfully un-verbatimized!"
    
    Exit Sub
    
Handler:
    MsgBox "Error " & Err.Number & ": " & Err.Description
End Sub

'*************************************************************************************
'* IMPORT/EXPORT FUNCTIONS                                                           *
'*************************************************************************************

Sub ImportCustomCode(Optional Notify As Boolean)
    Dim p As Object

    ' Turn on Error Handling
    On Error GoTo Handler

    ' Set registry setting to avoid repeatedly trying to import code
    SaveSetting "Verbatim", "Admin", "ImportCustomCode", False

    ' Check if Access to VBOM allowed
    #If Mac Then
    #Else
        If RegKeyRead("HKEY_CURRENT_USER\Software\Microsoft\Office\" & Application.Version & "\Word\Security\AccessVBOM") <> 1 Then
            If Notify = True Then MsgBox "Importing custom code requires you to enable ""Trust Access to the VBA project object model"" in your Macro security settings. You can do this manually, or run the Verbatim troubleshooter."
            Exit Sub
        End If
    #End If

    ' Make sure custom code file exists
    #If Mac Then
        If Filesystem.FileExists(Application.AttachedTemplate.Path & Application.PathSeparator & "VerbatimCustomCode.bas") = False Then
    #Else
        Dim FSO As Scripting.FileSystemObject
        Set FSO = New Scripting.FileSystemObject
        If FSO.FileExists(Application.NormalTemplate.Path & "\VerbatimCustomCode.bas") = False Then
    #End If
            If Notify = True Then MsgBox "No custom code module found in your Templates folder. It must be named ""VerbatimCustomCode.bas"" to import."
            Exit Sub
        End If
    
    ' Warn user
    If MsgBox("Attemping to import custom code - this will overwrite your current custom code module. Proceed?", vbOKCancel) = vbCancel Then Exit Sub
    
    ' Delete current Custom code module - turn off error checking temporarily in case it doesn't exist
    On Error Resume Next
    Application.OrganizerDelete source:=ActiveDocument.AttachedTemplate.FullName, Name:="Custom", Object:=wdOrganizerObjectProjectItems
    On Error GoTo Handler
    
    ' Import the module and delete the file
    #If Mac Then
        Set p = FindVBProject(ActiveDocument.AttachedTemplate.Path & Application.PathSeparator & ActiveDocument.AttachedTemplate)
    #Else
        Set p = ActiveDocument.AttachedTemplate.VBProject
    #End If
    If p Is Nothing Then
        MsgBox "Failed to import custom code."
        Exit Sub
    End If
    p.VBComponents.Import (Application.NormalTemplate.Path & Application.PathSeparator & "VerbatimCustomCode.bas")
    Filesystem.DeleteFile Application.NormalTemplate.Path & Application.PathSeparator & "VerbatimCustomCode.bas"
    

    If Notify = True Then MsgBox "Custom code successfully imported!"

    #If Mac Then
        ' Do Nothing
    #Else
        Set FSO = Nothing
    #End If
    Set p = Nothing

    Exit Sub

Handler:
    #If Mac Then
        ' Do Nothing
    #Else
        Set FSO = Nothing
    #End If
    Set p = Nothing
    MsgBox "Error " & Err.Number & ": " & Err.Description

End Sub

Sub ExportCustomCode(Optional Notify As Boolean)
    Dim p As Object
    Dim Module As Object
    
    'Turn on Error Handling
    On Error GoTo Handler
  
    #If Mac Then
        Set p = FindVBProject(ActiveDocument.AttachedTemplate.Path & Application.PathSeparator & ActiveDocument.AttachedTemplate)
        If p Is Nothing Then
            MsgBox "Failed to find the Custom code module."
            Exit Sub
        End If
    
        Set Module = p.VBComponents("Custom")
        If Module.CodeModule.CountOfLines <= 1 Then
            If Notify = True Then MsgBox "No custom code found."
            Exit Sub
        End If
    #Else
        If RegKeyRead("HKEY_CURRENT_USER\Software\Microsoft\Office\" & Application.Version & "\Word\Security\AccessVBOM") <> 1 Then
            If Notify = True Then MsgBox "Exporting custom code requires you to enable ""Trust Access to the VBA project object model"" in your Macro security settings. You can do this manually, or run the Verbatim troubleshooter."
            Exit Sub
        End If
    #End If

    'Export the Custom module
    Set Module = ActiveDocument.AttachedTemplate.VBProject.VBComponents("Custom")
    If Module.CodeModule.CountOfLines <= 1 Then
        If Notify = True Then MsgBox "No custom code found."
        Exit Sub
    End If
    
    Module.Export Application.NormalTemplate.Path & Application.PathSeparator & "VerbatimCustomCode.bas"
     
    'Set registry for automatic import on startup
    SaveSetting "Verbatim", "Admin", "ImportCustomCode", True
    
    If Notify = True Then MsgBox "Custom code exported as VerbatimCustomCode.bas to your Templates folder."
   
    Set p = Nothing
    Set Module = Nothing
    
    Exit Sub

Handler:
    Set p = Nothing
    Set Module = Nothing
    MsgBox "Error " & Err.Number & ": " & Err.Description

End Sub

#If Mac Then
Private Function FindVBProject(d As String) As Object
    
    Dim p As Object
    
    On Error Resume Next
    
    For Each p In Application.VBE.VBProjects
        If (p.FileName = d) Then
            Set FindVBProject = p
            Exit Function
        End If
    Next
    
End Function
#End If

' *************************************************************************************
' * UPDATE FUNCTIONS                                                                  *
' *************************************************************************************

Sub UpdateCheck(Optional Notify As Boolean)
    ' Turn on error checking
    On Error GoTo Handler

    Application.StatusBar = "Checking for Verbatim updates..."

    ' Create and send HttpReq
    Dim Response
    Set Response = HTTP.GetReq(Globals.PAPERLESSDEBATE_URL & "/updates")
    
    ' Exit if the request fails
    If Response Is Nothing Or Response("status") <> 200 Then
        Application.StatusBar = "Update Check Failed"
        SaveSetting "Verbatim", "Profile", "LastUpdateCheck", Now
        If Notify = True Then MsgBox "Update Check Failed."
        Exit Sub
    End If
    
    ' Set LastUpdateCheck
    SaveSetting "Verbatim", "Profile", "LastUpdateCheck", Now
    
    ' If newer version is found
    Dim UpdatedVersion As String
    UpdatedVersion = Response("body")("version")
    
    If Settings.NewerVersion(UpdatedVersion, Settings.GetVersion) Then
    
        ' Prompt to launch website - no longer download automatically because it tends to trip antivirus heuristics
        If MsgBox("There is a newer version of Verbatim available. Download now?", vbYesNo) = vbNo Then Exit Sub
            
        Settings.LaunchWebsite Globals.PAPERLESSDEBATE_URL
    Else
        Application.StatusBar = "No Verbatim updates found."
        If Notify = True Then MsgBox "No Verbatim updates found."
    End If
         
    Exit Sub

Handler:
    Application.StatusBar = "Update Check Failed. Error " & Err.Number & ": " & Err.Description
    If Notify = True Then MsgBox "Update Check Failed. Error " & Err.Number & ": " & Err.Description

End Sub

' *************************************************************************************
' * KEYBOARD FUNCTIONS                                                                  *
' *************************************************************************************

Sub ChangeKeyboardShortcut(KeyName As WdKey, MacroName As String)
    ' Change keyboard shortcuts in template
    Application.CustomizationContext = ActiveDocument.AttachedTemplate
    
    Select Case MacroName
        Case Is = "Paste"
            KeyBindings.Add wdKeyCategoryMacro, "Formatting.PasteText", BuildKeyCode(KeyName)
        Case Is = "Condense"
            KeyBindings.Add wdKeyCategoryMacro, "Formatting.Condense", BuildKeyCode(KeyName)
        Case Is = "Pocket"
            KeyBindings.Add wdKeyCategoryStyle, "Pocket", BuildKeyCode(KeyName)
        Case Is = "Hat"
            KeyBindings.Add wdKeyCategoryStyle, "Hat", BuildKeyCode(KeyName)
        Case Is = "Block"
            KeyBindings.Add wdKeyCategoryStyle, "Block", BuildKeyCode(KeyName)
        Case Is = "Tag"
            KeyBindings.Add wdKeyCategoryStyle, "Tag", BuildKeyCode(KeyName)
        Case Is = "Cite"
            KeyBindings.Add wdKeyCategoryStyle, "Cite", BuildKeyCode(KeyName)
        Case Is = "Underline"
            KeyBindings.Add wdKeyCategoryMacro, "Formatting.ToggleUnderline", BuildKeyCode(KeyName)
        Case Is = "Emphasis"
            KeyBindings.Add wdKeyCategoryStyle, "Emphasis", BuildKeyCode(KeyName)
        Case Is = "Highlight"
            KeyBindings.Add wdKeyCategoryMacro, "Formatting.Highlight", BuildKeyCode(KeyName)
        Case Is = "Clear"
            KeyBindings.Add wdKeyCategoryMacro, "Formatting.ClearToNormal", BuildKeyCode(KeyName)
        Case Is = "Shrink Text"
            KeyBindings.Add wdKeyCategoryMacro, "Formatting.ShrinkText", BuildKeyCode(KeyName)
        Case Is = "Select Similar"
            KeyBindings.Add wdKeyCategoryMacro, "Formatting.SelectSimilar", BuildKeyCode(KeyName)
        Case Else
            ' Nothing
        
    End Select
    
    Application.CustomizationContext = ThisDocument
End Sub

Sub ResetKeyboardShortcuts()
      
    On Error Resume Next
    
    ' Clear old keybindings
    Settings.RemoveKeyBindings
    
    ' Save defaults to registry
    SaveSetting "Verbatim", "Keyboard", "F2Shortcut", "Paste"
    SaveSetting "Verbatim", "Keyboard", "F3Shortcut", "Condense"
    SaveSetting "Verbatim", "Keyboard", "F4Shortcut", "Pocket"
    SaveSetting "Verbatim", "Keyboard", "F5Shortcut", "Hat"
    SaveSetting "Verbatim", "Keyboard", "F6Shortcut", "Block"
    SaveSetting "Verbatim", "Keyboard", "F7Shortcut", "Tag"
    SaveSetting "Verbatim", "Keyboard", "F8Shortcut", "Cite"
    SaveSetting "Verbatim", "Keyboard", "F9Shortcut", "Underline"
    SaveSetting "Verbatim", "Keyboard", "F10Shortcut", "Emphasis"
    SaveSetting "Verbatim", "Keyboard", "F11Shortcut", "Highlight"
    SaveSetting "Verbatim", "Keyboard", "F12Shortcut", "Clear"

    ' Save shortcuts in the template
    Application.CustomizationContext = ActiveDocument.AttachedTemplate

    ' Set keyboard shortcuts
    KeyBindings.Add wdKeyCategoryMacro, "Settings.ShowVerbatimHelp", BuildKeyCode(wdKeyF1)
    KeyBindings.Add wdKeyCategoryMacro, "Formatting.PasteText", BuildKeyCode(wdKeyF2)
    KeyBindings.Add wdKeyCategoryMacro, "Formatting.Condense", BuildKeyCode(wdKeyF3)
    KeyBindings.Add wdKeyCategoryStyle, "Pocket", BuildKeyCode(wdKeyF4)
    KeyBindings.Add wdKeyCategoryStyle, "Hat", BuildKeyCode(wdKeyF5)
    KeyBindings.Add wdKeyCategoryStyle, "Block", BuildKeyCode(wdKeyF6)
    KeyBindings.Add wdKeyCategoryStyle, "Tag", BuildKeyCode(wdKeyF7)
    KeyBindings.Add wdKeyCategoryStyle, "Cite", BuildKeyCode(wdKeyF8)
    KeyBindings.Add wdKeyCategoryMacro, "Formatting.ToggleUnderline", BuildKeyCode(wdKeyF9)
    KeyBindings.Add wdKeyCategoryStyle, "Emphasis", BuildKeyCode(wdKeyF10)
    KeyBindings.Add wdKeyCategoryMacro, "Formatting.Highlight", BuildKeyCode(wdKeyF11)
    KeyBindings.Add wdKeyCategoryMacro, "Formatting.ClearToNormal", BuildKeyCode(wdKeyF12)
    
    KeyBindings.Add wdKeyCategoryMacro, "View.SwitchWindows", BuildKeyCode(wdKeyControl, wdKeyTab)
    KeyBindings.Add wdKeyCategoryMacro, "Settings.ShowSettingsForm", BuildKeyCode(wdKeyAlt, wdKeyF1)
    KeyBindings.Add wdKeyCategoryMacro, "Formatting.GetFromCiteMaker", BuildKeyCode(wdKeyAlt, wdKeyF2)
    KeyBindings.Add wdKeyCategoryMacro, "Formatting.SelectSimilar", BuildKeyCode(wdKeyControl, wdKeyF2)
    KeyBindings.Add wdKeyCategoryMacro, "Formatting.CondenseNoPilcrows", BuildKeyCode(wdKeyControl, wdKeyF3)
    KeyBindings.Add wdKeyCategoryMacro, "Formatting.ShrinkText", BuildKeyCode(wdKeyAlt, wdKeyF3)
    KeyBindings.Add wdKeyCategoryMacro, "Formatting.ShrinkText", BuildKeyCode(wdKeyControl, wdKey8)
    KeyBindings.Add wdKeyCategoryMacro, "Formatting.AutoFormatCite", BuildKeyCode(wdKeyControl, wdKeyF8)
    KeyBindings.Add wdKeyCategoryMacro, "Formatting.CopyPreviousCite", BuildKeyCode(wdKeyAlt, wdKeyF8)
    KeyBindings.Add wdKeyCategoryMacro, "Formatting.AutoUnderline", BuildKeyCode(wdKeyAlt, wdKeyF9)
    KeyBindings.Add wdKeyCategoryMacro, "Formatting.RemoveEmphasis", BuildKeyCode(wdKeyControl, wdKeyShift, wdKeyF10)
    KeyBindings.Add wdKeyCategoryMacro, "Formatting.UpdateStyles", BuildKeyCode(wdKeyControl, wdKeyF12)
    KeyBindings.Add wdKeyCategoryMacro, "Formatting.AutoNumberTags", BuildKeyCode(wdKeyControl, wdKeyShift, wdKey3)
    
    KeyBindings.Add wdKeyCategoryMacro, "Paperless.MoveUp", BuildKeyCode(wdKeyAlt, vbKeyUp)
    KeyBindings.Add wdKeyCategoryMacro, "Paperless.MoveDown", BuildKeyCode(wdKeyAlt, vbKeyDown)
    KeyBindings.Add wdKeyCategoryMacro, "Paperless.DeleteHeading", BuildKeyCode(wdKeyAlt, vbKeyLeft)
    KeyBindings.Add wdKeyCategoryMacro, "Paperless.SendToSpeech", BuildKeyCode(wdKeyAlt, vbKeyRight)
    
    KeyBindings.Add wdKeyCategoryMacro, "Email.ShowEmailForm", BuildKeyCode(wdKeyControl, wdKeyShift, wdKeyE)
    KeyBindings.Add wdKeyCategoryMacro, "Paperless.CopyToUSB", BuildKeyCode(wdKeyControl, wdKeyShift, wdKeyS)
    KeyBindings.Add wdKeyCategoryMacro, "PaDS.PaDSPublic", BuildKeyCode(wdKeyControl, wdKeyShift, wdKeyW)
    KeyBindings.Add wdKeyCategoryMacro, "PaDS.UploadToPaDSDummy", BuildKeyCode(wdKeyControl, wdKeyAlt, wdKeyS)
    KeyBindings.Add wdKeyCategoryMacro, "PaDS.OpenFromPaDSDummy", BuildKeyCode(wdKeyControl, wdKeyAlt, wdKeyO)
    KeyBindings.Add wdKeyCategoryMacro, "View.ArrangeWindows", BuildKeyCode(wdKeyControl, wdKeyShift, wdKeyTab)
    KeyBindings.Add wdKeyCategoryMacro, "Paperless.StartTimer", BuildKeyCode(wdKeyControl, wdKeyShift, wdKeyT)
    KeyBindings.Add wdKeyCategoryMacro, "Caselist.CiteRequest", BuildKeyCode(wdKeyControl, wdKeyShift, wdKeyQ)
    KeyBindings.Add wdKeyCategoryMacro, "Stats.ShowStatsForm", BuildKeyCode(wdKeyControl, wdKeyShift, wdKeyI)
    KeyBindings.Add wdKeyCategoryMacro, "View.InvisibilityOff", BuildKeyCode(wdKeyControl, wdKeyShift, wdKeyV)
    KeyBindings.Add wdKeyCategoryMacro, "Paperless.NewSpeech", BuildKeyCode(wdKeyControl, wdKeyShift, wdKeyN)
    KeyBindings.Add wdKeyCategoryMacro, "View.ToggleReadingView", BuildKeyCode(wdKeyControl, wdKeyAlt, wdKeyR)
    
    #If Mac Then
        ' Do Nothing
    #Else
        Troubleshooting.FixTilde
    #End If
    
    ' Save template
    ActiveDocument.AttachedTemplate.Save

    ' Reset customization context
    Application.CustomizationContext = ThisDocument
End Sub

Sub RemoveKeyBindings()
    Dim k As KeyBinding
    
    For Each k In Application.KeyBindings
        k.Clear
    Next k
End Sub

' *************************************************************************************
' * MISC FUNCTIONS                                                                    *
' *************************************************************************************

Sub LaunchWebsite(URL As String)
    On Error GoTo Handler
    
    #If Mac Then
        AppleScriptTask "Verbatim.scpt", "LaunchWebsite", URL
    #Else
        ActiveDocument.FollowHyperlink (URL)
    #End If
    
    Exit Sub
   
Handler:
    If Err.Number = 4198 Then
        MsgBox "Opening website failed. Check your internet connection."
    Else
        MsgBox "Error " & Err.Number & ": " & Err.Description
    End If

End Sub

Sub OpenWordHelp()
    #If Mac Then
        Help wdHelp
    #Else
        CommandBars.FindControl(ID:=984).Execute
    #End If
End Sub

Sub OpenTemplatesFolder()
    #If Mac Then
        Dim FolderPath As String
        FolderPath = MacScript("return POSIX path of (path to library folder from user domain) as string")
        FolderPath = FolderPath & "Application Support/Microsoft/Office/User Templates/My Templates"
    
        AppleScriptTask "Verbatim.scpt", "OpenFolder", Application.NormalTemplate.Path
    #Else
        Shell "explorer.exe " & CStr(Environ("USERPROFILE")) & "\AppData\Roaming\Microsoft\Templates", vbNormalFocus
    #End If
End Sub

Sub QuitWord()
    Application.Quit wdPromptToSaveChanges
End Sub

Function GetVersion() As String
    GetVersion = ActiveDocument.AttachedTemplate.BuiltInDocumentProperties(wdPropertyKeywords)
End Function

Sub EditStyle(StyleToEdit As String)
    Dim SelStart As Long
    Dim SelEnd As Long
    
    ' Save selection
    SelStart = Selection.Start
    SelEnd = Selection.End

    ' Add a dummy paragraph in the style, then launch dialog with SendKeys
    ActiveDocument.Range.InsertAfter vbCrLf
    Selection.Start = ActiveDocument.Range.End
    Selection.Collapse
    Selection.Style = StyleToEdit
    SendKeys "%d", True
    SendKeys "{RIGHT}", True
    Dialogs(1347).Show
    
    ' Delete dummy paragraph and restore selection
    Selection.ClearFormatting
    Selection.TypeBackspace
    Selection.Start = SelStart
    Selection.End = SelEnd
End Sub

Public Function NewerVersion(Version1 As String, Version2 As String) As Boolean
' Adapted from https://forum.ozgrid.com/forum/index.php?thread%2F52830-compare-version-number-strings%2F=
' Returns true if Version1 is newer
    Dim i As Integer
    Dim Version1Array() As String
    Dim Version2Array() As String
    Version1Array = Split(Version1, ".")
    Version2Array = Split(Version2, ".")
    Dim k As Integer
    
    k = UBound(Version1Array)
    If UBound(Version2Array) < k Then k = UBound(Version2Array)
    
    For i = 0 To k
        If Version1Array(i) > Version2Array(i) Then
            NewerVersion = True
            Exit For
        ElseIf Version1Array(i) < Version2Array(i) Then
            NewerVersion = False
            Exit For
        Else
            If UBound(Version1Array) = UBound(Version2Array) Then
                NewerVersion = False
            ElseIf UBound(Version1Array) > UBound(Version2Array) Then
                NewerVersion = True
            Else
                NewerVersion = False
            End If
        End If
    Next i
End Function

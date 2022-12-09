Attribute VB_Name = "UI"
Option Explicit

Public Sub ShowForm(FormName As String)
    Dim Form As Object
    
    Select Case FormName
        Case "Caselist"
            Set Form = New frmCaselist
        Case "CheatSheet"
            Set Form = New frmCheatSheet
        Case "ChooseSpeechDoc"
            Set Form = New frmChooseSpeechDoc
        Case "CombineDocs"
            Set Form = New frmCombineDocs
        Case "Help"
            Set Form = New frmHelp
        Case "Login"
            Set Form = New frmLogin
        Case "Progress"
            Set Form = New frmProgress
        Case "Settings"
            Set Form = New frmSettings
        Case "Setup"
            Set Form = New frmSetupWizard
        Case "Share"
            Set Form = New frmShare
        Case "Stats"
            If Globals.InvisibilityToggle = True Then
                MsgBox "Stats form cannot be opened while in Invisibility Mode. Please turn off Invisibility Mode and try again."
                Exit Sub
            End If
            Set Form = New frmStats
        Case "QuickCards"
            Set Form = New frmQuickCards
        Case "Troubleshooter"
            Set Form = New frmTroubleshooter
        Case "Tutorial"
            Set Form = New frmTutorial
        Case Else
            ' Do nothing
            Exit Sub
    End Select

    Form.Show
End Sub

Public Sub ResizeUserForm(frm As Object, Optional dResizeFactor As Double = 0#)
' From https://peltiertech.com/userforms-for-mac-and-windows/
    ' TODO - change ctrl to a Control after moving to late binding
    Dim ctrl As Object
    Dim sColWidths As String
    Dim vColWidths As Variant
    Dim iCol As Long

    If dResizeFactor = 0 Then dResizeFactor = USER_FORM_RESIZE_FACTOR
    With frm
        .Height = .Height * dResizeFactor
        .Width = .Width * dResizeFactor

        For Each ctrl In frm.Controls
            With ctrl
                .Height = .Height * dResizeFactor
                .Width = .Width * dResizeFactor
                .Left = .Left * dResizeFactor
                .Top = .Top * dResizeFactor
                On Error Resume Next
                .Font.Size = .Font.Size * dResizeFactor
                On Error GoTo 0

                ' Multi column listboxes, comboboxes
                Select Case TypeName(ctrl)
                    Case "ListBox", "ComboBox"
                        If ctrl.ColumnCount > 1 Then
                            sColWidths = ctrl.ColumnWidths
                            vColWidths = Split(sColWidths, ";")
                            For iCol = LBound(vColWidths) To UBound(vColWidths)
                                vColWidths(iCol) = Val(vColWidths(iCol)) * dResizeFactor
                            Next
                            sColWidths = Join(vColWidths, ";")
                            ctrl.ColumnWidths = sColWidths
                        End If
                End Select
            End With
        Next
    End With
End Sub

Public Sub PopulateComboBoxFromJSON(URL As String, DisplayKey As String, ValueKey As String, c As Object)
    ' TODO - switch c parameter declaration back to Control after moving everything to late binding
    On Error GoTo Handler

    System.Cursor = wdCursorWait

    Dim Response As Dictionary
    Set Response = HTTP.GetReq(URL)

    Dim Item
    For Each Item In Response("body")
        c.AddItem
        c.List(c.ListCount - 1, 0) = Item(DisplayKey)
        c.List(c.ListCount - 1, 1) = Item(ValueKey)
    Next Item

    System.Cursor = wdCursorNormal
    Set Response = Nothing
    Exit Sub

Handler:
    Set Response = Nothing
    System.Cursor = wdCursorNormal
    MsgBox "Error " & Err.Number & ": " & Err.Description
End Sub

Public Function GetFileFromDialog(FilterName As String, FilterExtension As String, Title As String, ButtonText As String) As String
    On Error GoTo Handler

    #If Mac Then
        GetFileFromDialog = AppleScriptTask("Verbatim.scpt", "GetFileFromDialog", "")
    #Else
        ' Show the built-in file picker, only allow picking 1 file at a time
        Application.FileDialog(msoFileDialogOpen).AllowMultiSelect = False
        Application.FileDialog(msoFileDialogOpen).Filters.Clear
        Application.FileDialog(msoFileDialogOpen).Filters.Add FilterName, FilterExtension
        Application.FileDialog(msoFileDialogOpen).Title = Title
        Application.FileDialog(msoFileDialogOpen).ButtonName = ButtonText
        If Application.FileDialog(msoFileDialogOpen).Show = 0 Then ' Error trap cancel button
            UI.ResetFileDialog msoFileDialogOpen
            Exit Function
        End If
        
        ' Return the first selected filename
        GetFileFromDialog = Application.FileDialog(msoFileDialogOpen).SelectedItems(1)
        
        ' Reset the dialog
        UI.ResetFileDialog msoFileDialogOpen
    #End If
    Exit Function

Handler:
    MsgBox "Error " & Err.Number & ": " & Err.Description
End Function

Public Function GetFolderFromDialog(Title As String, ButtonName As String) As String
    On Error GoTo Handler
    
    #If Mac Then
        GetFolderFromDialog = AppleScriptTask("Verbatim.scpt", "GetFolderFromDialog", "")
    #Else
        ' Show the built-in folder picker, only allow picking 1 folder at a time
        Application.FileDialog(msoFileDialogFolderPicker).AllowMultiSelect = False
        Application.FileDialog(msoFileDialogFolderPicker).Title = Title
        Application.FileDialog(msoFileDialogFolderPicker).ButtonName = ButtonName
        If Application.FileDialog(msoFileDialogFolderPicker).Show = 0 Then 'Error trap cancel button
            UI.ResetFileDialog msoFileDialogFolderPicker
            Exit Function
        End If
        
        ' Return the first selected folder
        GetFolderFromDialog = Application.FileDialog(msoFileDialogFolderPicker).SelectedItems(1)
        
        ' Reset the dialog
        UI.ResetFileDialog msoFileDialogFolderPicker
    #End If
    
    Exit Function

Handler:
    MsgBox "Error " & Err.Number & ": " & Err.Description
End Function

Sub ResetFileDialog(FD As Byte)
    ' Resets a built-in FileDialog - can pass in a Word constant, also works for folder dialog
    Application.FileDialog(FD).AllowMultiSelect = False
    Application.FileDialog(FD).Filters.Clear
    Application.FileDialog(FD).Title = ""
    Application.FileDialog(FD).ButtonName = ""
    Application.FileDialog(FD).InitialFileName = ""
End Sub

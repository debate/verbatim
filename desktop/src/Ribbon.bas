Attribute VB_Name = "Ribbon"
Option Explicit

Sub OnLoad(Ribbon As IRibbonUI)
    Dim SavedState As Boolean
    Set DebateRibbon = Ribbon
    
    'Save a pointer to the Ribbon in case it gets lost
    SavedState = ActiveDocument.Saved
    ActiveDocument.Variables("RibbonPointer") = ObjPtr(Ribbon)
    ActiveDocument.Saved = SavedState
    
End Sub

Function GetRibbon(ByVal lRibbonPointer As LongPtr) As Object
    Dim objRibbon As Object
    CopyMemory objRibbon, lRibbonPointer, LenB(lRibbonPointer)
    Set GetRibbon = objRibbon
    Set objRibbon = Nothing
End Function

Public Sub RefreshRibbon()
    If DebateRibbon Is Nothing Then
        Set DebateRibbon = GetRibbon(ActiveDocument.Variables("RibbonPointer"))
        DebateRibbon.Invalidate
    Else
        DebateRibbon.Invalidate
    End If
End Sub

Sub RibbonMain(ByVal control As IRibbonControl)
    'Set Customization context so FindKey returns correct shortcuts
    CustomizationContext = ActiveDocument.AttachedTemplate

    Select Case control.ID
   
    'Paperless Group
    Case Is = "SendToSpeech"
        Paperless.SendToSpeech
    Case Is = "ChooseSpeechDoc"
        UI.ShowForm "ChooseSpeechDoc"
    Case Is = "WindowArranger"
        View.ArrangeWindows
    
    Case Is = "NewSpeech"
        Paperless.NewSpeech
    Case Is = "NewDocument"
        Paperless.NewDocument
    Case Is = "CombineDocs"
        UI.ShowForm "CombineDocs"
        
    Case Is = "NewWarrant", "NewWarrant1"
        Paperless.NewWarrant
    Case Is = "DeleteAllWarrants"
        Paperless.DeleteAllWarrants
         
    'Share Group
    Case Is = "CopyToUSB"
        Paperless.CopyToUSB
    
    'Tools Group
    Case Is = "StartTimer"
        Paperless.StartTimer
    Case Is = "DocumentStats"
        UI.ShowForm "Stats"
        
    'View Group
    Case Is = "DefaultView"
        View.DefaultView
    Case Is = "NavPaneCycle"
        View.NavPaneCycle
                
    'Format Group
    Case Is = "F2Button"
        FindKey(wdKeyF2).Execute
    Case Is = "F3Button"
        FindKey(wdKeyF3).Execute
    Case Is = "F4Button"
        FindKey(wdKeyF4).Execute
    Case Is = "F5Button"
        FindKey(wdKeyF5).Execute
    Case Is = "F6Button"
        FindKey(wdKeyF6).Execute
    Case Is = "F7Button"
        FindKey(wdKeyF7).Execute
    Case Is = "F8Button"
        FindKey(wdKeyF8).Execute
    Case Is = "F9Button"
        FindKey(wdKeyF9).Execute
    Case Is = "F10Button"
        FindKey(wdKeyF10).Execute
    Case Is = "F11Button"
        FindKey(wdKeyF11).Execute
    Case Is = "F12Button"
        FindKey(wdKeyF12).Execute
        
    Case Is = "ShrinkText"
        Formatting.ShrinkText
    Case Is = "AutoUnderline"
        Formatting.AutoUnderline
    Case Is = "PasteOCR"
        ' OCR.PasteOCR
        
    Case Is = "UpdateStyles"
        Formatting.UpdateStyles
    Case Is = "SelectSimilar"
        Formatting.SelectSimilar
    Case Is = "ShrinkAll"
        Formatting.ShrinkAll
    Case Is = "ShrinkPilcrows"
        Formatting.ShrinkPilcrows
    Case Is = "RemovePilcrows"
        Formatting.RemovePilcrows
    Case Is = "RemoveBlanks"
        Formatting.RemoveBlanks
    Case Is = "RemoveHyperlinks"
        Formatting.RemoveHyperlinks
    Case Is = "RemoveBookmarks"
        VirtualTub.RemoveBookmarks
    Case Is = "RemoveEmphasis"
        Formatting.RemoveEmphasis
    Case Is = "FixFakeTags"
        Formatting.FixFakeTags
    Case Is = "UniHighlight"
        Formatting.UniHighlight
    Case Is = "InsertHeader"
        Formatting.InsertHeader

    Case Is = "DuplicateCite"
        Formatting.CopyPreviousCite
    Case Is = "AutoFormatCite"
        Formatting.AutoFormatCite
    Case Is = "AutoNumberTags"
        Formatting.AutoNumberTags
    Case Is = "DeNumberTags"
        Formatting.DeNumberTags
    Case Is = "GetFromCiteMaker"
        Formatting.GetFromCiteMaker
        
    'Caselist Group
    Case Is = "CaselistWizard"
        UI.ShowForm "Caselist"
    Case Is = "ConvertToWiki"
        'Caselist.Word2Markdown
    Case Is = "CiteRequestDoc"
        Caselist.CiteRequestDoc
    Case Is = "CiteRequest"
        Caselist.CiteRequest
    
    'Settings Group
    Case Is = "LaunchWebsite"
        Settings.LaunchWebsite ("https://paperlessdebate.com")
    Case Is = "VerbatimHelp"
        UI.ShowForm "Help"
    Case Is = "CheatSheet"
        UI.ShowForm "CheatSheet"
    Case Is = "VerbatimSettings", "VerbatimSettings1", "VerbatimSettings2"
        UI.ShowForm "Settings"
        
    Case Else
        'Do Nothing

    End Select

    'Reset Customization Context
    CustomizationContext = ActiveDocument

End Sub

Sub GetRibbonLabels(control As IRibbonControl, ByRef label)
'Assign labels to F key controls from registry

    Select Case control.ID
    
    Case Is = "F2Button"
        label = "F2 " & GetSetting("Verbatim", "Keyboard", "F2Shortcut", "Paste")
    Case Is = "F3Button"
        label = "F3 " & GetSetting("Verbatim", "Keyboard", "F3Shortcut", "Condense")
    Case Is = "F4Button"
        label = "F4 " & GetSetting("Verbatim", "Keyboard", "F4Shortcut", "Pocket")
    Case Is = "F5Button"
        label = "F5 " & GetSetting("Verbatim", "Keyboard", "F5Shortcut", "Hat")
    Case Is = "F6Button"
        label = "F6 " & GetSetting("Verbatim", "Keyboard", "F6Shortcut", "Block")
    Case Is = "F7Button"
        label = "F7 " & GetSetting("Verbatim", "Keyboard", "F7Shortcut", "Tag")
    Case Is = "F8Button"
        label = "F8 " & GetSetting("Verbatim", "Keyboard", "F8Shortcut", "Cite")
    Case Is = "F9Button"
        label = "F9 " & GetSetting("Verbatim", "Keyboard", "F9Shortcut", "Underline")
    Case Is = "F10Button"
        label = "F10 " & GetSetting("Verbatim", "Keyboard", "F10Shortcut", "Emphasis")
    Case Is = "F11Button"
        label = "F11 " & GetSetting("Verbatim", "Keyboard", "F11Shortcut", "Highlight")
    Case Is = "F12Button"
        label = "F12 " & GetSetting("Verbatim", "Keyboard", "F12Shortcut", "Clear")
    
    Case Is = "DefaultView"
        If GetSetting("Verbatim", "View", "DefaultView", Globals.DefaultView) = "Web" Then
            label = "Web"
        Else
            label = "Draft"
        End If
    
    Case Else
        label = "Undefined"
    
    End Select

End Sub

Sub GetRibbonImages(control As IRibbonControl, ByRef returnedBitmap)
'Get image for Default View

    Select Case control.ID
    
        Case Is = "DefaultView"
            If GetSetting("Verbatim", "View", "DefaultView", Globals.DefaultView) = "Web" Then
                returnedBitmap = "ViewWebLayoutView"
            Else
                returnedBitmap = "ViewDraftView"
            End If
            
        Case Else
            returnedBitmap = ""
    
    End Select

End Sub

Sub GetRibbonToggles(control As IRibbonControl, ByRef state)
    Select Case control.ID
        
    Case Is = "AutoOpenFolder"
        state = Globals.AutoOpenFolderToggle
        
    Case Is = "AutoCoauthoringUpdates"
        state = Globals.AutoCoauthoringToggle
        
    Case Is = "RecordAudio"
        state = Globals.RecordAudioToggle
        
    Case Is = "InvisibilityMode"
        state = Globals.InvisibilityToggle
        
    Case Is = "AutoUnderline"
        state = Globals.UnderlineModeToggle
        
    Case Else
        state = False
        
    End Select

End Sub
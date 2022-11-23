VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} frmSetupWizard 
   Caption         =   "Verbatim Setup Wizard"
   ClientHeight    =   6210
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   7515
   OleObjectBlob   =   "frmSetupWizard.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "frmSetupWizard"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub UserForm_Initialize()

    On Error GoTo Handler
    
    ' Run install checks
    ' TODO - get correct setting name
    If GetSetting("Verbatim", "Admin", "SkipInstallChecks", False) = False Then
        If Troubleshooting.InstallCheckTemplateName = True Then
            MsgBox "WARNING - Verbatim appears to be installed incorrectly as " & ActiveDocument.AttachedTemplate.Name & " - Verbatim should always be named ""Debate.dotm"" or many features will not work correctly. It is strongly recommended you change the file name back." & vbCrLf & vbCrLf & "Please close Verbatim and install correctly before proceeding."
            Unload Me
            'ActiveDocument.Close
            Exit Sub
        ElseIf Troubleshooting.InstallCheckTemplateLocation = True Then
            MsgBox "WARNING - Verbatim appears to be installed in the wrong location. The Verbatim template file (Debate.dotm) should be located in your Word Templates folder, usually located at: c:\Users\<yourname>\AppData\Roaming\Microsoft\Templates. Using it from a different location will break many features." & vbCrLf & vbCrLf & "Please close Verbatim and install correctly before proceeding."
            Unload Me
            'ActiveDocument.Close
            Exit Sub
        End If
    End If
    
    ' Set defaults
    If GetSetting("Verbatim", "Admin", "AlwaysOn", True) = False Then
        Me.chkAlwaysOn = False
    Else
        Me.chkAlwaysOn.Value = True
    End If
    
    If GetSetting("Verbatim", "Main", "CollegeHS", "College") = "College" Then
        Me.optCollege.Value = True
    Else
        Me.optK12.Value = True
    End If
    
    Me.optCX.Value = True
    
    Me.chkTutorial.Value = True
    
    Exit Sub
    
Handler:
    MsgBox "Error " & Err.Number & ": " & Err.Description
End Sub

Private Sub btnOK_Click()

    On Error Resume Next
    
    SaveSetting "Verbatim", "Admin", "AlwaysOn", Me.chkAlwaysOn.Value
        
    If Me.optCollege.Value = True Then
        SaveSetting "Verbatim", "Main", "CollegeHS", "College"
    Else
        SaveSetting "Verbatim", "Main", "CollegeHS", "K12"
    End If
    
    If Me.optCX.Value = True Then
        SaveSetting "Verbatim", "Main", "Event", "CX"
    ElseIf Me.optLD.Value = True Then
        SaveSetting "Verbatim", "Main", "Event", "LD"
    ElseIf Me.optPF.Value = True Then
        SaveSetting "Verbatim", "Main", "Event", "PF"
    Else
        SaveSetting "Verbatim", "Main", "Event", "CX"
    End If
    
    Unload Me
        
    If Me.chkTutorial.Value = True Then UI.ShowForm "Tutorial"
           
    Exit Sub

Handler:
    MsgBox "Error " & Err.Number & ": " & Err.Description
    
End Sub

Private Sub btnCancel_Click()
    If MsgBox("Are you sure you want to exit without completing the Setup Wizard?", vbYesNo) = vbYes Then Unload Me
End Sub
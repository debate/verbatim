VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} frmChooseSpeechDoc 
   Caption         =   "Choose Speech Doc"
   ClientHeight    =   3735
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   6285
   OleObjectBlob   =   "frmChooseSpeechDoc.frx":0000
End
Attribute VB_Name = "frmChooseSpeechDoc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub UserForm_Initialize()
    Dim w As Window
    Dim i As Integer
    
    On Error GoTo Handler
    
    Globals.InitializeGlobals
    
    #If Mac Then
        UI.ResizeUserForm Me
        Me.btnChooseSpeechDoc.ForeColor = Globals.BLUE
    #End If
        
    ' Loop through open Windows - use Windows because Application.Documents collection gets corrupted
    For Each w In Application.Windows
        If InStr(LCase(w.Document.Name), "speech") Then
            Me.lboxDocuments.AddItem w.Document.Name, 0
        Else
            Me.lboxDocuments.AddItem w.Document.Name
        End If
    Next w
    
    ' Select the active speech doc
    For i = 0 To Me.lboxDocuments.ListCount - 1
        If Me.lboxDocuments.List(i) = Globals.ActiveSpeechDoc Then
            Me.lboxDocuments.Selected(i) = True
        End If
    Next i

    Exit Sub
    
Handler:
    ' Periodic inexplicable runtime error
    If Err.Number = 5097 Then
        MsgBox "Your Word interface has been corrupted, probably because of the Windows Explorer Preview Pane. Try running the Verbatim Setup Tool to solve this. You can also try closing any open Explorer windows, opening a new document, or restarting Word to fix it."
    Else
        MsgBox "Error " & Err.Number & ": " & Err.Description
    End If
End Sub

Private Sub btnChooseSpeechDoc_Click()
    Dim i As Integer
    Dim DocSelected As Boolean

    ' Make sure a document is selected
    For i = 0 To Me.lboxDocuments.ListCount - 1
        If Me.lboxDocuments.Selected(i) = True Then DocSelected = True
    Next i

    If DocSelected = False Then
        MsgBox "You must select a document first."
    Else
        Globals.ActiveSpeechDoc = Me.lboxDocuments.Value
        Unload Me
    End If
End Sub

#If Mac Then
    ' Ignore button colors
#Else
Sub btnChooseSpeechDoc_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal x As Single, ByVal Y As Single)
    btnChooseSpeechDoc.BackColor = Globals.LIGHT_BLUE
End Sub
Sub Userform_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal x As Single, ByVal Y As Single)
    btnChooseSpeechDoc.BackColor = Globals.BLUE
End Sub
#End If

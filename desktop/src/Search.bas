Attribute VB_Name = "Search"
Option Explicit

Public SearchText As String

Sub SearchChanged(control As IRibbonControl, strText As String)
    
    'Set the search text, the refresh ribbon
    SearchText = strText
    Call Ribbon.RefreshRibbon
    
    'Active the search box
    WordBasic.SendKeys "%d%s%r"
    
End Sub

Sub GetSearchResultsContent(control As IRibbonControl, ByRef returnedVal)
    
    Dim objConnection As ADODB.Connection
    Dim objRecordset As ADODB.Recordset
    
    Dim x As Long
    Dim xml As String
    Dim SearchDir As String
    
    On Error GoTo Handler
    
    'Initialize XML
    xml = "<menu xmlns=""http://schemas.microsoft.com/office/2006/01/customui"">"
    
    'If no search string, add a button with instructions
    If SearchText = "" Then
        xml = xml & "<button id=""SearchButton1"" label=""Press Enter to search."" />"
    Else
    
        'Open ADO
        Set objConnection = CreateObject("ADODB.Connection")
        Set objRecordset = CreateObject("ADODB.Recordset")
        
        'Construct SearchDir parameter - Use the UserProfile directory by default
        SearchDir = GetSetting("Verbatim", "Paperless", "SearchDir", CStr(Environ("USERPROFILE")))
        If SearchDir = "" Then SearchDir = CStr(Environ("USERPROFILE"))
        If Right(SearchDir, 1) <> "\" Then SearchDir = SearchDir & "\"
        SearchDir = "file:" & Replace(GetSetting("Verbatim", "Paperless", "SearchDir", CStr(Environ("USERPROFILE"))), "\", "/")
        
        'Set search string and open connection
        objConnection.Open "Provider=Search.CollatorDSO;Extended Properties='Application=Windows';"
        objRecordset.Open "SELECT Top 25 System.ItemName, System.ItemPathDisplay, System.ItemFolderPathDisplayNarrow, System.DateModified, System.Size FROM SystemIndex WHERE contains(System.Search.Contents, '""" & SearchText & """') and SCOPE='" & SearchDir & "'", objConnection

        If objRecordset.EOF = True Then
            xml = xml & "<button id=""SearchButton1"" label=""No results found."" />"
        Else
            objRecordset.MoveFirst
            
            'Loop returned records
            x = 0
            Do Until objRecordset.EOF
                'Add a button for each returned result
                xml = xml & "<button id=""SearchButton" & x & """ label=""" & objRecordset.Fields.Item("System.ItemName") & """ "
                xml = xml & "supertip=""" & objRecordset.Fields.Item("System.ItemFolderPathDisplayNarrow") & "&#10; &#10;" & _
                "Date Modified:&#10;" & objRecordset.Fields.Item("System.DateModified") & "&#10; &#10;" & _
                "Size:&#10;" & Round(objRecordset.Fields.Item("System.Size") / 1024) & "KB" & "&#10; &#10;" & """ "
                If Right(objRecordset.Fields.Item("System.ItemName"), 4) = "docx" Or _
                    Right(objRecordset.Fields.Item("System.ItemName"), 3) = "doc" Or _
                    Right(objRecordset.Fields.Item("System.ItemName"), 3) = "rtf" Then
                        xml = xml & "imageMso=""FileSaveAsWordDocx"" "
                End If
                
                xml = xml & "tag=""" & objRecordset.Fields.Item("System.ItemPathDisplay") & """ "
                xml = xml & "onAction=""Search.OpenSearchResult"" />"

                objRecordset.MoveNext
                x = x + 1
            Loop
        End If
        
        'Clean up ADO
        objRecordset.Close
        Set objRecordset = Nothing
        objConnection.Close
        Set objConnection = Nothing
    
        'Add a "more results" button
        xml = xml & "<button id=""MoreResults"" label=""More results..."" supertip=""Opens your search in an explorer window"" onAction=""Search.ExplorerSearch"" />"
        
    End If
    
    'Close XML
    xml = xml & "</menu>"
    
    returnedVal = xml
    
    Exit Sub
    
Handler:
    Set objRecordset = Nothing
    Set objConnection = Nothing
    MsgBox "Error " & Err.Number & ": " & Err.Description

End Sub

Sub OpenSearchResult(control As IRibbonControl)

    Dim s As Shell
    
    'Test for file extension, only open doc, docx, rtf - otherwise call shell
    If Right(control.Tag, 4) = "docx" Or Right(control.Tag, 3) = "doc" Or Right(control.Tag, 3) = "rtf" Then
        Documents.Open control.Tag
    Else
        Set s = New Shell
        s.Open (control.Tag)
        Set s = Nothing
    End If
    
End Sub

Sub ExplorerSearch(control As IRibbonControl)

    Dim SearchDir As String
    
    'Construct SearchDir, then pass it to the shell
    SearchDir = GetSetting("Verbatim", "Paperless", "SearchDir", CStr(Environ("USERPROFILE")))
    If SearchDir = "" Then SearchDir = CStr(Environ("USERPROFILE"))
    If Right(SearchDir, 1) <> "\" Then SearchDir = SearchDir & "\"
    
    Call Shell("explorer ""search-ms://query=" & SearchText & "&crumb=location:" & SearchDir & """", vbNormalFocus)
End Sub




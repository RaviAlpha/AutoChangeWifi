#Persistent
SetTimer, CheckWebsite, 5000 ; Check every 5 seconds
Return

; Variable to track the current network state
currentNetwork := ""

CheckWebsite:
    ; Check if the active window is Edge or Chrome
    IfWinActive, ahk_class Chrome_WidgetWin_1  ; Works for both Chrome and Edge
    {
        ; Get the active window title
        WinGetTitle, title, A

        ; Check if the website have the text below (eg: "YouTube") 
        if (InStr(title, "YouTube"))  
        {
            ; Only switch to wifi1 if it's not already connected
            if (currentNetwork != "Name of the wifi1") 
            {
                Run, powershell.exe -ExecutionPolicy Bypass -File "C:\path\to\Network1.ps1"
                currentNetwork := "Name of the wifi1"  ; Update the network state to wifi1
            }
        }
        else
        {
            ; Only switch to wifi2 if it's not already connected
            if (currentNetwork != "Name of the wifi2") 
            {
                Run, powershell.exe -ExecutionPolicy Bypass -File "C:\path\to\Network2.ps1"
                currentNetwork := "Name of the wifi2"  ; Update the network state to wifi2
            }
        }
    }
Return

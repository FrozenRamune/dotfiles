export WIN_USERNAME=$("/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe" '$env:USERNAME' | sed -e 's/\r//g')

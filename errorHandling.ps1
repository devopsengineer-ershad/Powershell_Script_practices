#try , catch , finally
try {
    Get-Service 
}
catch {
    Write-Host "An error occurred while trying to get the services."
}
finally {
    Write-Host "Execution of the try-catch block is complete."
}

# example

try {
    get-content -Path "D:\Powershell_script_directory\powershell_directory\myfile.txt"
}
catch {
    Write-Host "File not found. Please check the file path."
}
finally {
    get-content -path "D:\powershell_script_practices2\newfile.txt"
}
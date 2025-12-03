# continious integration(CI) artifacts gets deployed to various environments using continious deployment(CD) pipeline.
# output of command is used as input to another command in pipeline.
# | is used to represent pipeline in powershell

"Hello World" | foreach-object { $_.ToUpper() }

# $_ represents left side output in the pipeline
#  . (dot) is used to access methods and properties of an object

Get-Service | where-object { $_.Status -eq "Running" }

Get-Service | where-object { $_.Status -eq "Stopped" }

Get-Service | Where-Object { $_.Status -eq "Running" } | Select-Object -Property Name, Status

#To check specific service status running or stopped

$AppName = "WebClient"

Get-Service | Where-Object { $_.Name -eq $AppName } | Select-Object  Status

# To filter files in size(MB,GB) from Documents folder

Get-ChildItem -Path "D:\Documents" | Where-Object {$_.Length -lt 1MB}

# Writing output to a file using pipeline
"hello world" | Set-Content -Path "D:\Powershell_script_directory\powershell_directory\myfile.txt"

Conditional Statements in Powershell

if/elseif/else

if (*$condition1*) {
    *action performed when condition1 is true*
} elseif (*$condition2*) {
    # code to execute if condition2 is true
} else {
    # code to execute if none of the conditions are true
}

# Example of if/elseif/else

$fruit = "Guava"

if ($fruit -eq "Apple") {
    Write-Host "This is an Apple"
} elseif ($fruit -eq "Banana") {
   Write-Host "This is a Banana"
} else {
    Write-Host "This is not an Apple or Banana"
}

$age = 25
if ($age -lt 18) {
    Write-Host "You are a minor."
} elseif ($age -ge 18 -and $age -lt 65) {
    Write-Host "You are an adult."
} else {
    Write-Host "You are a senior citizen."
}

# Devops example
$status = "Success"
if ($status -eq "Success") {
   throw "Deployment succeeded. Proceeding to the next stage."
} elseif ($status -eq "Failure") {
    throw "Deployment failed. Halting the pipeline."
} else {
    throw "Deployment status unknown. Please check the logs."
}

$status = "Failure"
if ($status -eq "Success") {
   Write-Host "Deployment succeeded. Proceeding to the next stage."
} elseif ($status -eq "Failure") {
    Write-Host "Deployment failed. Halting the pipeline."
} else {
    Write-Host "Deployment status unknown. Please check the logs."
}

# Azure DevOps, GitHub Actions, Jenkins sabme:

# exit 0 → ✔ Deployment Successful

# exit 1 → ❌ Deployment Failed

# Non-zero exit code dete hi pipeline RED ho jata hai

$signal = "Green"   # Green / Red / Yellow — change karke test karo

if ($signal -eq "Green") {
    Write-Host "🟢 Signal is GREEN → You are allowed to move forward safely. Proceed to the next step of pipeline or execution. 🚗💨"
}
elseif ($signal -eq "Red") {
    Write-Error "🔴 Signal is RED → Movement restricted for safety reasons. Pipeline execution will now stop to avoid failure. ⛔"
    exit 1
}
elseif ($signal -eq "Yellow") {
    Write-Warning "🟡 Signal is YELLOW → Please slow down and be prepared. The next pipeline stage may require manual verification. ⚠️"
}
else {
    Write-Warning "⚪ Unknown signal detected → Unable to determine safe action. Please check your input and logs immediately. ❓"
    exit 1
}



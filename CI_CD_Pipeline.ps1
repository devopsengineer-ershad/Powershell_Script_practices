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

Write-Output I am dhondhu | set-content -Path "D:\Powershell_script_directory\powershell_directory\myfile.txt"

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

$status = "failed"

if ($status -ne "success") {
   Write-Host "Deployment failed, Pipeline Halting."
   write-Error "Refer logs for more information."
}else {
    Write-Host "Deployment succeeded, Proceeding to next stage."
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

$status = "failed"

if ($status -eq "success") {
   Write-Host "Deployment succeeded, Proceeding to next stage."

}elseif ($status -eq "failed") {
    Write-Host "Deployment failed, Pipeline Halting."
    return # Exit from the current scope without terminating the entire script
    Write-Host "This line will not be executed."
}else {
    Write-Host "Deployment status unknown, Please check logs."
}

$status = "failed"

if ($status -eq "success") {
   Write-Host "Deployment succeeded, Proceeding to next stage."

}elseif ($status -eq "failed") {
    Write-Host "Deployment failed, Pipeline Halting."
    Write-Host "This line will not be executed."
    return # Exit from the current scope without terminating the entire script
}else {
    Write-Host "Deployment status unknown, Please check logs."
}

    
   

*SWITCH

switch ($Variable) {

conditions {}

Default {}
}

# Example of SWITCH

$day = "Tuesday"

switch ($day) {
    "Monday" { Write-Host "It's Monday, the start of the week!" }
    "Tuesday" { Write-Host "It's Tuesday, second day of the week!" }
    "Wednesday" { Write-Host "It's Wednesday, midweek already!" }
    "Thursday" { Write-Host "It's Thursday, almost the weekend!" }
    "Friday" { Write-Host "It's Friday, last working day!" }
    "Saturday" { Write-Host "It's Saturday, time to relax!" }
    "Sunday" { Write-Host "It's Sunday, prepare for the week ahead!" }
    Default { Write-Host "Invalid day!" }
}

$number = 20  #ages
switch ($number) {
    {$_ -lt 13} { Write-Host "Child" }
    {$_ -ge 13 -and $_ -lt 20} { Write-Host "Teenager" }
    {$_ -ge 20 -and $_ -lt 65} { Write-Host "Adult" }
    {$_ -ge 65} { Write-Host "Senior Citizen" }
    Default { Write-Host "Invalid age!" }
}

# Devops Example
#if condition passes then only action will work
$numbers = @(12,17, 19, 24, 30, 45, 50, 67, 80) #ages
switch ($numbers) {
    {$_ -lt 18} { Write-Host "Person is a Minor." }
    {$_ -ge 18 -and $_ -lt 65} { Write-Host "person is an Adult." }
    {$_ -ge 65} { Write-Host "person is a Senior Citizen." }
    Default { Write-Host "Invalid age!" }
}


$numbers = @(12,17, 19, 24, 30, 45, 50, 67, 80) #ages

foreach ($i in $numbers) {
    if ($i -lt 18) {
        Write-Host "Person is a Minor, Age is $i"
    } elseif ($i -ge 18 -and $i -lt 65) {
        Write-Host "person is an Adult, Age is $i."
    } elseif ($i -ge 65) {
        Write-Host "person is a Senior Citizen, Age is $i."
    } else {
        Write-Host "Invalid age!"
    }
}

$numbers = @(12,17, 19, 24, 30, 45, 50, 67, 80) #ages
foreach ($i in $numbers) {
    switch ($i) {
        {$_ -lt 18} { Write-Host "Person is a Minor, Age is $i" }
        {$_ -ge 18 -and $_ -lt 65} { Write-Host "person is an Adult, Age is $i." }
        {$_ -ge 65} { Write-Host "person is a Senior Citizen, Age is $i." }
        Default { Write-Host "Invalid age!" }
    }
}

$numbers = @(17,19, 24, 80)

foreach ($i in $numbers) {
    switch ($i) {
        {$_ -lt 18 -or $_ -eq 17} { 
            Write-Host "Person is a Minor, Age is $i" 
        }
        {$_ -ge 18 -and $_ -lt 80} { 
            Write-Host "person is an Adult, Age is $i." 
        }
        {$_ -ge 65 -or $_ -eq 80} { 
            Write-Host "person is a Senior Citizen, Age is $i." 
        }
        Default { Write-Host "Invalid age!" }
    }
}










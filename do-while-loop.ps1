Do-while loop ---> A loop that will always execute at least once, 
and then continue to execute as long as a specified condition is true.

do {
    # Code to execute
} while (condition)

# Example of do-while 

$count = 1

do {
    Write-Host "$count"
    $count++
} while ($count -le 5)

# $count = $count + 1	----> Manually increase value ---->	Agar $count = 5 → result 6
# $count++            ----> Same ka short form      ---->	Agar $count = 5 → result 6
# $count += 1       ----> Same ka short form      ---->	Agar $count = 5 → result 6  

# Devops example
$deploymentStatus = "InProgress"
$attempt = 1
do {
    Write-Host "Checking deployment status... Attempt #$attempt"
    
    # Simulate checking deployment status
    if ($attempt -eq 3) {
        $deploymentStatus = "Success"
    } else {
        $deploymentStatus = "InProgress"
    }
    
    $attempt++
    Start-Sleep -Seconds 2
} while ($deploymentStatus -eq "InProgress")




$age = 20
do {
    if ($age -lt 18) {
        Write-Host "You are a minor, Age is $age."
    } elseif ($age -ge 18 -and $age -lt 65) {
        Write-Host "You are an adult, Age is $age."
    } else {
        Write-Host "You are a senior citizen, Age is $age."
    }
    
    $age += 10  #$age += 10   # 20 → 30 → 40 → 50 → 60 → 70 → 80

} while ($age -le 80)

# Another example
$age = 20

do{
    Write-Host "person is adult, Age is $age."
    $age ++
} while ($age -le 30)


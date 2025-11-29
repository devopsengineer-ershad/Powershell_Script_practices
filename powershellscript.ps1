#Naming Conventions
pascalcase - MyVariable # first letter of each word is capitalized
camelcase - myVariable  # first letter of the first word is lowercase, subsequent words have their first letter capitalized
snakecase - my_variable  # words are separated by underscores, all letters are lowercase



$myVariable = "Hello, World!"
$myVariable

#arithmetic operations + - * /
$a = 10
$b = 5

$c = $a + $b
$c
$d = $a - $b
$d
$e = $a * $b
$e
$f = $a / $b
$f

# comparison operators -eq(equal to), -ne(not equal to), -gt(greater than), -lt(less than), -ge(greater than or equal to), -le(less than or equal to)
$a = 10
$b = 5

$a -eq $b
$a -ne $b
$a -gt $b
$a -lt $b
$a -ge $b
$a -le $b

# array operations
$array = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
#  0, 1, 2, 3, 4, 5, 6, 7, 8, 9 - index positions
$array[2]
$array[0..4]


#looping through an array
foreach ($item in $array) {
    $item
}

$array = 1, 2, 3, 4, 5
foreach ($item in $array) {
    $item * 2
}

$myVariable = "Goodbye, World!"  

$myVariable.GetType()  # Get the type of the variable

$myVariable.Length    # Get the length of the string

$myVariable.ToUpper()  # Convert the string to uppercase

$myVariable.ToLower()  # Convert the string to lowercase

$myVariable.Contains("World")  # Check if the string contains "World"

$myVariable.Replace("Goodbye", "Hello")  # Replace "Goodbye" with "Hello"

HASH-TABLE
# Hash-table operations
it is dictionary which contains multiple key-value pairs
hash table does not allow duplicate keys
# hash table does not visible in pipeline logs
$myHashTable = @{}
   
$devopsEngineer = @{
    "Name"       = "Alice"
    "Role"       = "DevOps Engineer"
    "Experience" = "5 years"
    "Address"    = "new york"
}

$devopsEngineer["Role"]          # Accessing value using key

foreach ($Name in $devopsEngineer) {
    $Name 
}

Custom-Object
# Custom-Object operations
it is similar to hash-table but it allows duplicate keys
it consists multiple properties - information about an entity

$toDo = [PSCustomObject]@{
    AppName = "todo app"
    Version = "1.0.0"
    Owner  = "John Doe"

}
$toDo.AppName          # Accessing property using dot notation
$toDo.GetType()        # Get the type of the custom object


# List of PS Custom-Object methods
$apps = [PSCustomObject]@{ AppName = "todo app"; Version = "1.0.0"; Owner  = "John Doe" }

#multiple lists of PS Custom-Object
# it consists multiple prooperties of multiple entities
$apps = @(
    [PSCustomObject]@{ AppName = "todo app"; Version = "1.0.0"; Owner  = "John Doe" }
    [PSCustomObject]@{ AppName = "calendar app"; Version = "2.1.0"; Owner  = "Jane Smith" }
    [PSCustomObject]@{ AppName = "notes app"; Version = "3.3.5"; Owner  = "Alice Johnson" }
)

$apps.AppName
$apps[0..2]
$apps[0]
$apps.Version
foreach ($i in $apps) {
    $i
    $i.Owner , $i.AppName , $i.Version

}
    
#Create a Ditectory

New-Item -Path "D:\Powershell_script_directory" -ItemType Directory
                    #in D: drive create a new directory named Powershell_script_directory

#Remove a Directory
Remove-Item -Path "D:\Powershell_script_directory" -Recurse -Force -Confirm
                    
# To make directory under same directory   
New-Item -Path "D:\Powershell_script_directory\powershell_directory" -ItemType Directory 

#Create a File
New-Item -Path "D:\Powershell_script_directory\powershell_directory\myfile.txt" -ItemType File

#Remove a File

Remove-Item -Path "D:\Powershell_script_directory\powershell_directory\myfile.txt" -Recurse -Force -Confirm

Add-Content -Path "D:\Powershell_script_directory\powershell_directory\myfile.txt" -Value "Hello Ershad ,This is your first file."

#add-content appends the content to the existing file

Set-Content -Path "D:\Powershell_script_directory\powershell_directory\myfile.txt" -Value "Hello Ershad ,This is your updated file."
#set-content overwrites the existing content with new content

Get-Content -Path "D:\Powershell_script_directory\powershell_directory\myfile.txt"
#Get-Content reads the content of the file

# Define the list of users
$upns = "user@domain.com"
$match = ""


# Loop through each user
foreach ($upn in $upns) {
    # Get the user
    $user = Get-ADUser -Filter "UserPrincipalName -eq '$upn'"

    # Get the groups the user is a member of
    $groups = Get-ADPrincipalGroupMembership -Identity $user | Select-Object -ExpandProperty Name
   if ($match) {
    $groups= $groups | Where-Object { $_ -like "*$match*" }
   } 

   $groups = $groups -join "`n    "
    # Output the user and their groups
    Write-Output "User: $upn"
    Write-Output "Groups: |-
    $groups"
}
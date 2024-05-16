function Test-ADCredentials {
    param (
        [string]$username,
        [string]$password,
        [string]$domain
    )

    Add-Type -AssemblyName System.DirectoryServices.AccountManagement
    $principalContext = New-Object System.DirectoryServices.AccountManagement.PrincipalContext([System.DirectoryServices.AccountManagement.ContextType]::Domain, $domain)

    try {
        $isValid = $principalContext.ValidateCredentials($username, $password)
        if ($isValid) {
            Write-Output "Credentials are valid."
        } else {
            Write-Output "Credentials are not valid."
        }
    } catch {
        Write-Error "An error occurred: $_"
    }
}

# Usage
Test-ADCredentials -username "username" -password "password" -domain "domain.intra.corp"
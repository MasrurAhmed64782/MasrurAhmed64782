<#
.SYNOPSIS
    This PowerShell script enforces the Windows 11 STIG requirement to rename the built-in Guest account, ensuring it is not set to the default name "Guest".

.NOTES
    Author          : Masrur Ahmed
    LinkedIn        : http://www.linkedin.com/in/masrur-ahmed-b21a23378
    GitHub          : https://github.com/MasrurAhmed64782
    Date Created    : 2026-04-08
    Last Modified   : 2026-04-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000025

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-SO-000025).ps1 
#>

# Set your compliant name (anything except "Guest")
$NewGuestName = "DisabledGuest"

# Find the built-in Guest account via SID (-501)
$GuestAccount = Get-LocalUser | Where-Object { $_.SID -like "*-501" }

if ($GuestAccount) {
    if ($GuestAccount.Name -ne $NewGuestName) {
        Rename-LocalUser -Name $GuestAccount.Name -NewName $NewGuestName
        Write-Output "Guest account renamed to '$NewGuestName'."
    } else {
        Write-Output "Guest account already compliant."
    }
} else {
    Write-Output "Guest account not found."
}

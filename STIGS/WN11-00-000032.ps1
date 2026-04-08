<#
.SYNOPSIS
    |


.NOTES
    Author          : Masrur Ahmed 
    LinkedIn        : http://www.linkedin.com/in/masrur-ahmed-b21a23378
    GitHub          : https://github.com/MasrurAhmed64782
    Date Created    : 
    Last Modified   : 
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-).ps1 
#>


# Enforce minimum BitLocker PIN length (STIG compliant)

$Path = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"
$Name = "MinimumPIN"
$Value = 6

if (-not (Test-Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
}

New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType DWord -Force | Out-Null

Write-Output "MinimumPIN set to $Value (compliant)."

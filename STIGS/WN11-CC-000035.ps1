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


# Disable NetBIOS name release requests (STIG compliant)

$Path = "HKLM:\SYSTEM\CurrentControlSet\Services\Netbt\Parameters"
$Name = "NoNameReleaseOnDemand"
$Value = 1

if (-not (Test-Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
}

New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType DWord -Force | Out-Null

Write-Output "NoNameReleaseOnDemand set to 1 (compliant)."

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
    PS C:\> .\__remediation_template(STIG-ID-HERE!!!).ps1 
#>


# Enforce strong Kerberos encryption types (STIG compliant)

$Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters"
$Name = "SupportedEncryptionTypes"
$Value = 0x7FFFFFF8  # Decimal: 2147483640

# Create the registry path if it doesn't exist
if (-not (Test-Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType DWord -Force | Out-Null

Write-Output "SupportedEncryptionTypes set to 0x7FFFFFF8 (compliant)."

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


# Disable or uninstall Internet Explorer 11 (STIG compliant)

# Check if IE11 feature exists
$IEFeature = Get-WindowsOptionalFeature -Online -FeatureName "Internet-Explorer-Optional-amd64" -ErrorAction SilentlyContinue

if ($IEFeature -and $IEFeature.State -ne "Disabled") {
    # Disable IE11
    Disable-WindowsOptionalFeature -Online -FeatureName "Internet-Explorer-Optional-amd64" -NoRestart -ErrorAction Stop
    Write-Output "Internet Explorer 11 has been disabled."
} else {
    Write-Output "Internet Explorer 11 is already disabled or not installed."
}

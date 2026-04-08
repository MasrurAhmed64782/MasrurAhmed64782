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


# Disable camera on Lock Screen (STIG compliant)

$Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
$Name = "NoLockScreenCamera"
$Value = 1  # 1 = Disabled

# Skip if device has no camera
$HasCamera = Get-PnpDevice -Class Camera -ErrorAction SilentlyContinue | Where-Object { $_.Status -eq "OK" }
if (-not $HasCamera) {
    Write-Output "No camera detected. Setting is not applicable (NA)."
    return
}

# Create the registry path if it doesn't exist
if (-not (Test-Path $Path)) {
    New-Item -Path $Path -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $Path -Name $Name -Value $Value -PropertyType DWord -Force | Out-Null

Write-Output "Camera on Lock Screen disabled (NoLockScreenCamera = 1)."

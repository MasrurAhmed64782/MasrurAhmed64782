<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Masrur Ahmed
    LinkedIn        : http://www.linkedin.com/in/masrur-ahmed-b21a23378
    GitHub          : https://github.com/MasrurAhmed64782
    Date Created    : 2026-04-07
    Last Modified   : 2026-04-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-AU-000500).ps1 
#>

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$name = "MaxSize"
$value = 0x00008001  # 32769 in decimal

# Ensure the registry key exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Check if the value exists
$currentValue = Get-ItemProperty -Path $registryPath -Name $name -ErrorAction SilentlyContinue

if ($null -eq $currentValue) {
    # Create the DWORD value
    New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWord -Force | Out-Null
} else {
    # Update the existing value
    Set-ItemProperty -Path $registryPath -Name $name -Value $value
}

Write-Host "Registry setting applied successfully."

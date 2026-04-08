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


# Enable "Audit: Force audit policy subcategory settings to override category settings"
$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Policies\Microsoft\Windows\System"
$RegName = "AuditAuditPolicy"
$RegValue = 1  # 1 = Enabled

# Create or set the registry value
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}
New-ItemProperty -Path $RegPath -Name $RegName -Value $RegValue -PropertyType DWord -Force | Out-Null
Write-Output "Audit: Force audit policy subcategory settings enabled."

# Enable auditing for "Process Creation" (Success)
$SubCategory = "Process Creation"

Start-Process -FilePath "auditpol.exe" -ArgumentList "/set /subcategory:`"$SubCategory`" /success:enable" -Verb RunAs -Wait

Write-Output "Audit Policy for '$SubCategory' set to audit Success."

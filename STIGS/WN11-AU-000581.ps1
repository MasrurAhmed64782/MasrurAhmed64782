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


# Enable File System auditing for Failure events (STIG compliant)
$SubCategory = "File System"

# Configure audit policy
Start-Process -FilePath "auditpol.exe" `
    -ArgumentList "/set /subcategory:`"$SubCategory`" /failure:enable" `
    -Verb RunAs -Wait

Write-Output "'Audit File System' configured to audit Failure events."

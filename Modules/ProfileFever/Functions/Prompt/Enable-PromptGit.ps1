
<#
    .SYNOPSIS
    Enable the git repository status in the prompt.
#>
function Enable-PromptGit
{
    [CmdletBinding()]
    [Alias('egit')]
    param ()

    if ($null -eq (Get-Module -Name posh-git))
    {
        Import-Module -Name posh-git -Force
    }

    Remove-Variable -Scope Script -Name PromptGit -ErrorAction SilentlyContinue -Force
    New-Variable -Scope Script -Option ReadOnly -Name PromptGit -Value $true -Force
}

﻿<#
    .SYNOPSIS
        Get all SQL Server connections from the profile.

    .DESCRIPTION
        By registering a SQL Server connection, the connection then can be used
        with the Invoke-ProfileSqlServer (alias sql) to connect to the desired
        SQL Server.
#>
function Get-ProfileSqlServer
{
    [CmdletBinding()]
    param
    (
        # Name to filter the SQL Server connection. Supports wildcards. If not
        # specified or the name is an empty string, all SQL Server connections
        # are returned.
        [Parameter(Mandatory = $false)]
        [SupportsWildcards()]
        [AllowEmptyString()]
        [System.String]
        $Name,

        # Optional filter by tags. Don't use wildcards. If any tag was found,
        # the SQL Server connection will match the filter.
        [Parameter(Mandatory = $false)]
        [AllowEmptyCollection()]
        [System.String[]]
        $Tag
    )

    $objects = Get-ProfileObject -Type 'SqlServer' -Name $Name -Tag $Tag

    foreach ($object in $objects)
    {
        [PSCustomObject] @{
            PSTypeName    = 'ProfileFever.SqlServer.Definition'
            Name          = $object.Name
            Tag           = $object.Tag
            SqlInstance   = $object.Object.SqlInstance
            SqlCredential = $object.Object.SqlCredential
        }
    }
}

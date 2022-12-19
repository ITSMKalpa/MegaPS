﻿<#
.SYNOPSIS
	Checks BIOS details
.DESCRIPTION
	This PowerShell script queries BIOS details and prints it.
.EXAMPLE
	PS> ./check-bios
	✅ V1.10 BIOS (S/N NXA82EV0EBB0760, version ACRSYS - 2) by INSYDE Corp.
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

try {
	Write-Progress "Querying BIOS details..."
	if ($IsLinux) {
		# TODO
	} else {
		$BIOS = Get-CimInstance -ClassName Win32_BIOS
		$Manufacturer = $BIOS.Manufacturer.Trim()
		$Model = $BIOS.Name.Trim()
		$Serial = $BIOS.SerialNumber.Trim()
		$Version = $BIOS.Version.Trim()
		"✅ $Model BIOS (S/N $Serial, version $Version) by $Manufacturer"
	}
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
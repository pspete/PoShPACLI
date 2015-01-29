# PoShPACLI
Powershell PACLI Module
Exposes the native functions of the PACLI command line utility.

PACLI executable must be present on the computer on which the module is to be imported. 

Function Initialize-PoShPACLI must be run before working with the other module functions.
This is required to locate the PACLI execuatable in the SYSTEM path, or in a folder you specify, in order for the module to be able to execute the utility.

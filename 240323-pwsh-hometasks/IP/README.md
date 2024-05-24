# DevOps Essentials: Powershell Task 1

> **Please use branch `task1` for this task that already exist in your forked repository after you has been started task**

## Powershell Task 1

1. Create a PowerShell script `task1.ps1` which can accepts only (!) following incoming parameters:
   1. name first incoming parameter "ip_address_1", value IP address in the format x.x.x.x
   2. name second parameter is "ip_address_2", value IP address in the format x.x.x.x
   3. name last parameter is "network_mask", value in in the format x.x.x.x or xx (eg. 255.0.0.0 or 8)
2. Your script should check if ip_address_1 and ip_address_2 belong to the same network or not. Show results in the output console (text output yes or no).

## Task requirements
1. All 3 parameters are mandatory. If any argument is missing when you are calling the script, it should fail.
2. Your script should validate incoming parameters and not allow you to accept not valid arguments. For example, if you are calling `.\task1.ps1 -ip_address_1 "hello"` should show an error on the validation.
3. Your script also should accept only correct values of the ip addresses. In case you try to specify a value out of range "0.0.0.0-255.255.255.255" – it should fail on validation.

   **Tips**: look at the data types in PowerShell and try to use PS version 5 or newer.
4. Use clear formatting.
5. No errors on execution.
6. Use best practices during development.
7. Your scripts should be readable.
9. Use comments where it is needed.
10. Use console output to show result of your script (yes/no). *See above Task 1 Details 2.*


## Definition of done

Developed script `task1.ps1` that meets the above requirements and uploaded to this repository. 

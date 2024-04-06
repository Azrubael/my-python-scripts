# 2024-04-06    11:41
=====================


# Piping Objects to Functions
-----------------------------

Any function can accept `objects from the pipeline`. You can control the processing of these objects using the keywords *begin*, *process* and *end*.

At the very beginning of the function, the code from the *begin* block is executed once. PowerShell function can’t get objects from pipeline if it doesn’t have *begin* key word in it’s body.
The code in the *process* block is executed once for each object in the pipeline. During the execution of the process block, each object of the pipeline is assigned the automatic variable. Objects from the pipeline enter the function one by one.
After the function receives all the objects from the pipeline, the code from the *end* block is run once. When you use a function inside a pipeline, the objects that are passed to it, are stored in the automatic *input* variable.
The function first executes the code from the *begin* block, before any objects come from the pipeline. If the function has the *process* keyword, each subsequent object is removed from the *input* array, and assigned to the variable.
The *end* block code is executed once all objects have been received from the pipeline to finalize the execution. If the keywords *begin*, *process*, or *end* are not used, all commands are processed as code from the *end* block.


# Example1:
```powershell
function Get-Example {
    begin {<#Statement list#>}      # begin runs once
    process {<#Statement list#>}    # process runs once for each object in the pipeline
    end {<#Statement list#>}        # end runs once
}
```

# Automatic veriables:
- $input
- $_

When you use a function inside a pipeline, the object that a passed to it are stored in the `$input` automatic variable.
The function first executes the code in the *begin* block, before any ojects come from the pipeline.




# Useful Links
--------------

About_functions
https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions

Approved verbs:
https://docs.microsoft.com/en-us/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands 
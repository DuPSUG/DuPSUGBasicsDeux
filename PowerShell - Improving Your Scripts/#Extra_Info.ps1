Get-Help about_Functions_Advanced
help about_Functions_Advanced
help about_Functions_Advanced_Parameters
help about_Functions_CmdletBindingAttribute
help about_Comment_Based_Help

<#
    While innitialy some users might prefer function over form, I'd recommend the following steps [assuming your script remains functional of course]:

    1. Don't use aliases in scripts.
        Just don't... not even for parameters, use Tab-completion instead
    2. Indentation: Use it and use it consistently
        It makes for easier reading and understanding of the functionality of the script
    3. Use clear and intelligently named variables
        You might know what your variable means now, but someone else reading your script might have to scroll back and forth
        just to see what's going on.
    4. Use in-line comments.
        For the same purpose as #3, in a years time you might not remember why you needed to do something a certain way.
        As all commenting, it can instantly provide you with documentation which will save you time in the long run.
    5. Comment-based help.
        Similar to #4, comment-based help can help with documentation of your script and will provide users of your script
        with all required information.
    6. Filter left
        Always try and filter data as early as possible in your query to prevent unnecesary use of resources/time.
        Think about the impact on the following example
            Get-ADUser -Filter * -ResultSize Unlimited | Where-Object {$_.DisplayName -like 'Robert*'}
            Get-ADUser -Filter "DisplayName -like 'Robert*'"
    7. Avoid Read-Host, Use Parameters instead
    8. Use Measure-Command to check/compare performance between possible solutions.
        * Tip 1 - Prioritize condition checks from most common to least
        * Tip 2 - foreach VS Foreach-Object
        * Tip 3 - Save extracted data into its own variable
    9. Try not to use Write-Host
    10. Format at the absolute end of your script/function as it will change the object and you can't re-use it anymore
    11. KISS - try and make your scripts simple and not too complex. Chunk into seperate scripts/functions if need be.

#>

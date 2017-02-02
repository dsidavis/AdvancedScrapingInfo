
selParseDoc =
    # Simple helper for retrieving the HTML source of the current document and parsing it as HTML.
function(selDriver)
{
   doc = htmlParse(selDriver$getPageSource(), asText = TRUE)   
}

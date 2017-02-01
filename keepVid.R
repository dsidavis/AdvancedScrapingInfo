
getVideo =
function(url, driver, ...)
{

    driver$navigate("http://keepvid.com")

    txt = driver$findElement("name", "url")
    txt$clearElement()
    txt$sendKeysToElement(list(url))
    txt$sendKeysToElement(list('\ue007'))  # enter key

    doc = htmlParse(d$getPageSource(), asText = TRUE)
    u = getNodeSet(doc, "//a[contains(., 'Max')]/@href")[[1]]
    img = getURLContent(u, followlocation = TRUE, ...)
}

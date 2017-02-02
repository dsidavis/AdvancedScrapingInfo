getDocs =
function(url, dir = ".", download = TRUE)
{
   ll = getHTMLLinks(url)
   urls = grep("\\.(csv|tsv|pdf|pptx?|docx?|xlsx?)$", ll, value = TRUE)

   urls = getRelativeURL(escapeChars(urls), escapeChars(url))
   if(download) {
     if(!file.exists(dir))
         dir.create(dir)
     out = sprintf("%s%s%s", dir, .Platform$file.sep, basename(urls))
     mapply(download.file, urls, out)
     out
   } else
     urls
}

escapeChars =
function(urls)
{
 gsub(" ", "%32", urls)
}


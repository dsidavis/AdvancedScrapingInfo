getDocs =
function(url, dir = ".", download = TRUE)
{
   ll = getHTMLLinks(url)
   urls = grep("\\.(pdf|pptx?|docx?|xlsx?)$", ll, value = TRUE)   
   urls = getRelativeURL(urls, url)
   if(download) {
     if(!file.exists(dir))
         dir.create(dir)
     out = sprintf("%s%s%s", dir, .Platform$file.sep, basename(urls))
     mapply(download.file, urls, out)
     out
   } else
     urls
}

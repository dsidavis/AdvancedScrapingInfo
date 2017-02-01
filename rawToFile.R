saveRawToFile = writeRawBin =
function (object, con, size = NA_integer_, endian = .Platform$endian, 
    useBytes = FALSE) 
{
    swap <- endian != .Platform$endian
    if (is.character(con)) {
        con <- file(con, "wb")
        on.exit(close(con))
    }
    .Internal(writeBin(object, con, size, swap, useBytes))
}



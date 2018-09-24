# In Class assignment 09_24_18 Amanda Arnold
#Load library GEOquery, limma and affy

library(GEOquery)

library(limma)

library(affy)

# Use the following FTP link to download sample microarray data from GEO database use the function getGEO and assign the data to object named gse

url <- "ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE1nnn/GSE1000/matrix/GSE1000_series_matrix.txt.gz"

filenm <- "GSE1000_series_matrix.txt.gz"

if(!file.exists(filenm)) download.file(url, destfile=filenm)

gse <- getGEO(filename=filenm)
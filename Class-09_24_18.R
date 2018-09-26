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

#check what you have in gse object

head(gse)

#what class of object?

class(gse)

#To see expression levels of object

head(exprs(gse))

#Make two more objects called treatment and control and put first 5 columns of gse in treatment and next 5 columns in control

treatment <- exprs(gse[,1:5])

control <- exprs(gse[,6:10])

rowMeans(treatment)
rowMeans(control)

#hw calculate row means- use function "for loop" in a "data frame"

treatment_means <- rowMeans(treatment)
control_means <- rowMeans(control)

#Fold change of treatemtn means/control means and put in object called fold

fold <- treatment_means/control_means

#use "if else loop", if the fold change is >2 put genes into new object called up regulation and if fold change <-2 put the genes into new object called down regulation

#below not working
if (fold > 2) {up_regulation <- fold} else if (fold <-2) {down_regulation <- fold}

up_regulation = list()
down_regulation = list()

#subsetting in R

up_regulation <- fold[which(fold > 2)]
down_regulation <- fold[which(fold < -2)]

#write the object onto a file (.txt, .xls, .xlsx, .csv)

write.csv(fold, file="class_assignment_fold.csv", row.names=FALSE)

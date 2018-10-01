Class-09_24_18 HW
#hw calculate row means- use function "for loop" in a "data frame"

data <- exprs(gse)

for (features in data) {
	x <- rowSums(data)
	means <- x/10
}

head(means)
1007_s_at   1053_at    117_at    121_at 1255_g_at   1294_at 
272.56316 376.58757  62.66182 483.16337  22.11441 124.22214 

#same as 

rowMeans(head(data))
1007_s_at   1053_at    117_at    121_at 1255_g_at   1294_at 
272.56316 376.58757  62.66182 483.16337  22.11441 124.22214 

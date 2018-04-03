parsed <- function(directory, threshold = 0) {

	files <- list.files(directory, full.names = T)
	# locate the files
	data.list <- lapply(files, read.csv)

	# read the files into a list of data.frames
	data.cat <- do.call(rbind, data.list)

	# concatenate into one big data.frame
	data.filtered <- complete.cases(data.cat)
		
	completeCases <- data.cat[data.filtered,]

	#completeCases
	#completeCases[completeCases["Freq"] > threshold,]

}

corr <- function(directory, threshhold = 0) {

	p <- parsed(directory, threshhold)

	t <- as.data.frame(table(p$ID))

	overThresh <- t[t["Freq"] > threshhold,][[1]]

	valsOverThresh <- p[p$ID %in% overThresh,]

	sapply(split(valsOverThresh[2:4], valsOverThresh$ID), function(X) cor(X$sulfate, X$nitrate))

}

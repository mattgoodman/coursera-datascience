parsed <- function(directory, threshhold = 0) {

	files <- list.files(directory, full.names = T)
	# locate the files
	data.list <- lapply(files, read.csv)

	# read the files into a list of data.frames
	data.cat <- do.call(rbind, data.list)

	# concatenate into one big data.frame
	data.filtered <- complete.cases(data.cat)

	data.cat[data.filtered,]
	#completeCases <- data.cat[data.filtered,]

	#completeCases[completeCases["Freq"] > threshold,]

}
#cor(data.cat$nitrate, data.cat$sulfate, use = "complete.obs")
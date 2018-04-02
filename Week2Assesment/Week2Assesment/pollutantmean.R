pollutantmean <- function(directory, pollutant, id = 1:332) {

	files <- list.files(directory, full.names = T)[id]
	# locate the files
	data.list <- lapply(files, read.csv)

	# read the files into a list of data.frames
	data.cat <- do.call(rbind, data.list)

	# concatenate into one big data.frame
	data.filtered <- complete.cases(data.cat)

	data.parsed <- data.cat[data.filtered,]

	mean(data.parsed[[pollutant]])
	
}
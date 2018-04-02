parsed <- function(directory, id = 1:332) {

	files <- list.files(directory, full.names = T)[id]
	# locate the files
	data.list <- lapply(files, read.csv)

	# read the files into a list of data.frames
	data.cat <- do.call(rbind, data.list)

	# concatenate into one big data.frame
	data.filtered <- complete.cases(data.cat)

	data.cat[data.filtered,]
	

}

complete <- function(directory, id = 1:332) {

	p<- parsed(directory, id)

	as.data.frame(table(p$ID))
	
}
parsed <- function(directory, id = 1:332) {

	files <- list.files(directory, full.names = T)[id]
		
	data.cat <- NULL
	for (f in files) {
		dat <- read.table(f, header = T, sep = ",", stringsAsFactors = T)
		data.cat <- rbind(data.cat, dat)
	}

	# concatenate into one big data.frame

	data.cat[complete.cases(data.cat),]
	
}

complete <- function(directory, id = 1:332) {

	p <- parsed(directory, id)
	p$ID <- factor(p$ID, levels = unique(p$ID))
	ag <- aggregate(p$ID, by = p["ID"], FUN = length)
	names(ag) <- c("id", "nobs")
	ag
}

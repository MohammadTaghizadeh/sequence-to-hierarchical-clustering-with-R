address <- "address of your sequence file"
file_name <- 'all_sequences.txt'  # sequence file name 
address_file_name <- paste(address, file_name, sep = '')
install.packages("protr")    # if you didn't install this package before, use this line.
sequences <- protr::readFASTA(address_file_name)

names <- names(sequences)
sim_mat <- protr::parSeqSim(sequences, submat = 'BLOSUM80')
dim(sim_mat)
colnames(sim_mat) <- names
rownames(sim_mat) <- names


dist_m <- data.matrix(sim_mat)

hclust_input <- as.dist(dist_m, diag = FALSE, upper = FALSE)
par(lwd = 3, font = 2)
plot(hclust(hclust_input))

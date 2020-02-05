library(rentrez)

# The ncbi_ids varable will hold a vector of unique identifiers to
# an NCBI database which can be used as arguments for the entrez_fetch
# function.
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")

# entrez_fetch() is a variable takes type of database, the unique ids
# found in "ncbi_ids" and the return type of the data and pulls data
# in that specific format from NCBI. In this case it is pulling
# a FASTA file.
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")

Sequences = strsplit(Bburg, "\n\n")
Sequences = unlist(Sequences)
header =gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq =gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
seq = gsub("\\n","",seq)
Sequences=data.frame(Name=header,Sequence=seq)

write.csv(Sequences,"Sequences.csv")


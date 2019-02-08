
extract_owner <- function(repo) {
    strsplit(repo, split = "/")[[1]][1]
}

extract_repository <- function(repo) {
    strsplit(repo, split = "/")[[1]][2]
}

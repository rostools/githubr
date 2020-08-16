# For tables in vignette --------------------------------------------------

# rd_info <- tools::Rd_db("githubr")

.extract_rd_info_to_dataframe <- function(info) {
    keyword <- unname(tools:::.Rd_get_metadata(info, "keyword"))
    if (length(keyword) == 0)
        keyword <- NA

    data.frame(
        # Don't use these from tools
        FuncName = unname(tools:::.Rd_get_name(info)),
        Description = unname(tools:::.Rd_get_title(info)),
        Keyword = keyword,
        stringsAsFactors = FALSE
    )
}

.rd_as_data_for_table <- function(pkg = "githubr") {
    rd_info <- tools::Rd_db(pkg)
    rd_data_list <- lapply(rd_info, .extract_rd_info_to_dataframe)
    rd_data <- do.call(rbind, rd_data_list)
    rownames(rd_data) <- NULL
    rd_data$Name <- paste0("`", rd_data$FuncName, "`")
    tibble::as_tibble(rd_data)
}

.functions_implemented <- function(func_data) {
    func_data <- func_data[func_data$FuncName %in% getNamespaceExports("githubr"), ]
    tibble::as_tibble(func_data)
}

.functions_to_implement <- function(func_data) {
    func_data <- func_data[!func_data$FuncName %in% getNamespaceExports("githubr"), ]
    func_data <- func_data[!func_data$Keyword == "internal" | is.na(func_data$Keyword), ]
    tibble::as_tibble(func_data)
}

.table_of_functions <- function(func_data, caption) {
    knitr::kable(func_data[c("Name", "Description")], caption = caption)
}


#' Convert a `gh_response` object to a tidied data.frame.
#'
#' The class `gh_response` is returned from [gh::gh]. The tidy function converts
#' it from a list to a [tibble][tibble::tibble-package].
#'
#' @param x The input to tidy.
#' @param ... Arguments passed to other methods or cases.
#'
#' @return a [tibble][tibble::tibble-package].
#' @export
#'
#' @examples
#'
#' \dontrun{
#' # For labels
#' Labels <- gh_list_labels("lwjohnst86/test-githubr", tidied = FALSE)
#' Labels
#' tidy(Labels)
#' gh_list_labels("lwjohnst86/test-githubr")
#'
#' Issues <- gh_list_issues("lwjohnst86/test-githubr", tidied = FALSE)
#' Issues
#' tidy(Issues)
#' gh_list_issues("lwjohnst86/test-githubr")
#' }
tidy <- function(x, ...) {
    UseMethod("tidy", x)
}

tidy.gh_response <- function(x, ...) {
    elements_to_dataframe <- function(x) {
        data.frame(t(unlist(x)), stringsAsFactors = FALSE)
    }
    list_of_dataframes <- lapply(x, elements_to_dataframe)

    list_of_header_names <- lapply(list_of_dataframes, names)
    all_header_names <- unique(unlist(list_of_header_names))

    fill_dataframe_with_headers <- function(x) {
        name_differences <- setdiff(all_header_names, names(x))
        filled_in <- sapply(name_differences, function(y) NA)
        data.frame(c(x, filled_in), stringsAsFactors = FALSE)
    }

    response_dataframe <- do.call(
        rbind, lapply(list_of_dataframes, fill_dataframe_with_headers)
    )
    tibble::as_tibble(response_dataframe)
}

#' Basic template request to send to GitHub.
#'
#' Is mostly a thin wrapper around [gh::gh()], with some additional conveniences
#' to simplify GitHub request calls.
#'
#' @param repo Repository name in the form of "username/reponame" or
#'   "orgname/reponame", e.g. "lwjohnst86/githubr".
#' @param .request Request to GitHub.
#' @param .method Method to send, e.g. GET or POST.
#' @param ... Other parameters to give to the API, e.g.
#'
#' @return Sends a request to GitHub.
#' @keywords internal
#'
#' @seealso See [githubr::githubr-package].
#'
template_github_request <- function(repo, .request, .method = "GET", params_list = NULL) {
    owner <- extract_owner(repo)
    repository <- extract_repository(repo)

    params <- list(
        endpoint = .request,
        owner = owner,
        repo = repository,
        .method = .method
    )

    if (!is.null(params_list))
        params <- append(params, params_list)

    do.call(gh::gh, params)
}

# Basically use to remove any NULL elements in the list.
add_request_parameters <- function(...) {
    params <- list(...)
    Filter(Negate(is.null), params)
}

# To extract owner and repo information from the repo string:
# "username/reponame"
extract_owner <- function(repo) {
    strsplit(repo, split = "/")[[1]][1]
}
extract_repository <- function(repo) {
    strsplit(repo, split = "/")[[1]][2]
}

in_development <- function() {
    stop("This function has not been implemented yet.", call. = FALSE)
}

.extract_rd_info_to_dataframe <- function(info) {
    keyword <- unname(tools:::.Rd_get_metadata(info, "keyword"))
    if (length(keyword) == 0)
        keyword <- NA

    data.frame(
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
    func_data <- func_data[!func_data$Keyword == "internal", ]
    tibble::as_tibble(func_data)
}

.table_of_functions <- function(func_data, caption) {
    knitr::kable(func_data[c("Name", "Description")], caption = caption)
}

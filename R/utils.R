
#' Convert a GitHub response object to a tidied data.frame.
#'
#' @param x The input to tidy.
#' @param ... Arguments passed to other methods or cases.
#'
#' @return Returns a data.frame, or if available as a [tibble::tibble()].
#' @export
#'
#' @examples
#'
#' \dontrun{
#' tidy(gh_list_labels("lwjohnst86/test-githubr"))
#' }
tidy <- function(x, ...) {
    UseMethod("tidy", x)
}

tidy.gh_response <- function(x, ...) {
    response_list <- lapply(x, data.frame, stringsAsFactors = FALSE)
    response_data <- do.call(rbind, response_list)
    if (requireNamespace("tibble", quietly = TRUE)) {
        response_data <- tibble::as_tibble(response_data)
    }
    response_data
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
#' @export
#'
#' @seealso See [githubr::githubr-package].
#'
#' @examples
#' do.call(mean, list(c(runif(100), NA), na.rm = TRUE, trim = 0))
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

#' Project Git remote URL.
#'
#' @description
#' \lifecycle{experimental}
#'
#' Get the repository name based on remote name of the current working
#' directory.
#'
#' @param remote Remote name. Default is "origin".
#'
#' @return Remote name of R Project.
#' @export
#'
proj_repo <- function(remote = "origin") {
    repo <-  NULL
    if (requireNamespace("git2r", quietly = TRUE)) {
        repo <- git2r::remote_url(remote = remote)
        repo <- sub("^.*github\\.com[:/](.*/.*)\\.git$", "\\1", repo)
    }
    return(repo)
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

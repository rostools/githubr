
#' Create a GitHub pull request.
#'
#' @inheritParams template_github_request
#' @param title Title for the pull request.
#' @param head Branch to merge from (the branch you are wanting merged).
#' @param base The "master" branch or the branch you want your changes to be
#'   merged into (the branch you want to merge into).
#' @param body The description and details of the pull request.
#'
#' @return Nothing.
#'
gh_new_pull_request <- function(repo, title, head, base, body) {
    in_development()
    # https://developer.github.com/v3/pulls/#create-a-pull-request
    # https://developer.github.com/v3/pulls/#alternative-input
}

#' Make edits to existing GitHub Pull Requests.
#'
#' @inheritParams template_github_request
#' @inheritParams gh_new_pull_request
#' @param number The existing pull request number.
#' @param state Whether to open or close the pull request.
#' @param base Whether to change the base ("master") branch to merge into.
#'
#' @return Nothing.
#'
gh_edit_pull_request <- function(repo, number, title, body, state, base) {
    in_development()
    # https://developer.github.com/v3/pulls/#update-a-pull-request
}

#' Close a currently open GitHub Pull Request.
#'
#' @inheritParams gh_edit_pull_request
#'
#' @return Nothing.
#'
gh_close_pull_request <- function(repo, number) {
    in_development()
    # gh_edit_pull_request(repo = repo, number = number, state = "closed")
}

#' List all Pull Requests in a GitHub repository.
#'
#' @inheritParams template_github_request
#'
#' @return A tidied [tibble][tibble::tibble-package] or a `gh_response` class as
#'   a list.
#'
gh_list_pull_requests <- function(repo) {
    in_development()
    # https://developer.github.com/v3/pulls/#list-pull-requests
}

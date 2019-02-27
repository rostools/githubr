
#' Create a release of a Git tag.
#'
#' @inheritParams template_github_request
#' @param tag_name Name of the tag to create the release from.
#' @param name Name of the release.
#' @param body Description and details as part of the release.
#' @param draft Whether the release should be a draft.
#' @param prerelease Whether the release should be a prerelease.
#'
#' @return Nothing.
#'
gh_new_release <- function(repo, tag_name, name, body, draft, prerelease) {
    in_development()
    # Check to confirm
    # https://developer.github.com/v3/repos/releases/#create-a-release
}

#' List all releases in a GitHub repository.
#'
#' @inheritParams template_github_request
#'
#' @return A tidied [tibble][tibble::tibble-package] or a `gh_response` class as
#'   a list.
#'
gh_list_releases <- function(repo) {
    in_development()
    # https://developer.github.com/v3/repos/releases/#create-a-release
}

#' List all tags in a GitHub repository.
#'
#' @inheritParams template_github_request
#'
#' @return A tidied [tibble][tibble::tibble-package] or a `gh_response` class as
#'   a list.
#'
gh_list_tags <- function(repo) {
    in_development()
    # https://developer.github.com/v3/repos/#list-tags
}

#' Delete a GitHub release.
#'
#' @inheritParams template_github_request
#'
#' @return Nothing.
#'
gh_delete_release <- function(repo) {
    in_development()
    # https://developer.github.com/v3/repos/releases/#delete-a-release
}

#' Edits an existing GitHub release.
#'
#' @inheritParams template_github_request
#' @inheritParams gh_new_release
#' @param release_id The release ID.
#'
#' @return Nothing.
#'
gh_edit_release <- function(repo, release_id, tag_name, name, body,
                            draft, prerelease) {
    in_development()
    # https://developer.github.com/v3/repos/releases/#edit-a-release
}

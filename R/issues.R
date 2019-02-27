#' Create a GitHub issue in a repository.
#'
#' @inheritParams template_github_request
#' @param title The title of the issue.
#' @param body Add a description to the issue.
#' @param labels Add a label or labels to the issue.
#' @param assignees Assign a collaborator to deal with the issue.
#' @param milestone The milestone (as a number) to add to the issue.
#'
#' @return Has no output.
#' @export
#'
#' @seealso See [githubr::githubr-package].
#'
#' @examples
#'
#' \dontrun{
#' gh_new_issue("lwjohnst86/test-githubr", title = "Example issue", labels = "bug")
#' }
gh_new_issue <- function(repo, title, body = NULL, labels = NULL,
                         assignees = NULL, milestone = NULL) {

    # TODO: Add checks for arguments.
    # TODO: Prevent using unless authenticated.
    # TODO: Check that labels exist.

    if (!is.null(assignees))
        warning("Argument assignees is still in development.")
        # assignees <- array(c(assignees))

    if (!is.null(labels))
        labels <- array(c(labels))

    params <- add_request_parameters(
        title = title,
        labels = labels,
        body = body,
        assignees = assignees,
        milestone = milestone
    )

    template_github_request(
        repo = repo,
        .request = "/repos/:owner/:repo/issues",
        .method = "POST",
        params_list = params
    )

    return(invisible())

    # TODO: Add messaging about posting
    # cat("\n\nPosting `", title, "`\n\n")
    # if (!devtools:::yesno("Are you sure you want to post this event as an Issue?")) {
        # usethis:::done("Event posted as an Issue to UofTCoders/Events.")
    # } else {
    #     message("Event not posted to Issue.")
    # }
}

#' List issues in GitHub repository.
#'
#' @inheritParams template_github_request
#' @param tidied Tidy to data.frame from list?
#'
#' @return A tidied [tibble][tibble::tibble-package] or a `gh_response` class as
#'   a list.
#' @export
#'
#' @seealso See [githubr::githubr-package].
#'
#' @examples
#' \dontrun{
#' gh_list_issues("lwjohnst86/test-githubr")
#' }
gh_list_issues <- function(repo, tidied = TRUE) {
    # TODO: Add filtering
    repo_issues <- template_github_request(
        repo = repo,
        .request = "/repos/:owner/:repo/issues",
        .method = "GET"
    )

    if (tidied) {
        repo_issues <- tidy(repo_issues)
        optional_names <- grep("labels\\.name|assignees|milestone\\.(number|title|state|open_issues|closed_issues)|body",
                               names(repo_issues), value = TRUE)
        headers <- c("state", "number", "title", optional_names, "comments")
        repo_issues <- repo_issues[headers]
    }

    repo_issues
}

#' List labels in a GitHub repository.
#'
#' @inheritParams gh_list_issues
#'
#' @return A tidied [tibble][tibble::tibble-package] or a `gh_response` class as
#'   a list.
#' @export
#'
#' @seealso See [githubr::githubr-package].
#'
#' @examples
#'
#' \dontrun{
#' gh_list_labels("lwjohnst86/test-githubr")
#'
#' # As a tidied data.frame (or tibble)
#' tidy(gh_list_labels("lwjohnst86/test-githubr"))
#' }
gh_list_labels <- function(repo, tidied = TRUE) {
    repo_labels <- template_github_request(
        repo = repo,
        .request = "/repos/:owner/:repo/labels",
        .method = "GET"
    )

    if (tidied) {
        repo_labels <- tidy(repo_labels)
        repo_labels <- repo_labels[c("name", "color")]
    }

    repo_labels
}

#' Delete a GitHub label.
#'
#' @inheritParams template_github_request
#' @param label_name Name of the label.
#'
#' @return No output.
#' @export
#'
#' @seealso See [githubr-package].
#'
#' @examples
#'
#' \dontrun{
#' gh_delete_label("lwjohnst86/test-githubr", "Interest")
#' }
gh_delete_label <- function(repo, label_name) {
    # TODO: Check that label exists.
    template_github_request(
        repo = repo,
        .request = "/repos/:owner/:repo/labels/:name",
        .method = "DELETE",
        params_list = list(name = label_name)
    )
    return(invisible(NULL))
}

#' Delete all labels from a GitHub repository.
#'
#' @inheritParams template_github_request
#'
#' @return Has no output.
#'
#' @seealso [gh_create_label()] [gh_delete_label()]
#'
gh_delete_all_labels <- function(repo) {
    in_development()
    # TODO: Include a check to confirm to delete all labels.
    repo_labels <- tidy(gh_list_labels(repo))$name
    for (label_name in repo_labels) {
        gh_delete_label(repo, label_name = label_name)
    }
    return(invisible(NULL))
}

#' Create a GitHub label for a repository
#'
#' @inheritParams template_github_request
#' @param name Name to give the new label.
#' @param color Color in hexadecimal. See the list of common [colors](https://www.color-hex.com/).
#' @param description Description to give label.
#'
#' @return No output.
#' @export
#'
#' @seealso See [githubr::githubr-package].
#'
#' @examples
#'
#' \dontrun{
#' gh_create_label("lwjohnst86/test-githubr", "Interest", "deadad")
#' }
gh_create_label <- function(repo, name, color, description = NULL) {
    # TODO: Change this stopifnot to something more user friendly
    stopifnot(is.character(name), is.character(color),
              is.character(description) | is.null(description))
    color <- gsub("\\#", "", color)

    label_params <- add_request_parameters(
        name = name,
        color = color,
        description = description
    )

    template_github_request(
        repo = repo,
        .request = "/repos/:owner/:repo/labels",
        .method = "POST",
        params_list = label_params
    )
    return(invisible(NULL))
}

#' Edit parts of a GitHub repository's issue.
#'
#' @inheritParams template_github_request
#' @inheritParams gh_new_issue
#' @param issue_number The number of the issue.
#' @param state Whether issue is open or closed.
#'
#' @return Has not output.
#'
gh_edit_issue <- function(repo, issue_number, title, body,
                          state, milestone, labels, assignees) {
    in_development()
    # See https://developer.github.com/v3/issues/#edit-an-issue
}

#' Close a GitHub repository's issue.
#'
#' @inheritParams template_github_request
#' @inheritParams gh_edit_issue
#'
#' @return Has not output.
#'
gh_close_issue <- function(repo, issue_number) {
    in_development()
    # gh_edit_issue(repo = repo, issue_number = issue_number,
    # state = "closed")
    # See https://developer.github.com/v3/issues/#edit-an-issue
}

post_repo_issue <- function(repo, title, body, labels) {

    # TODO: add milestone
    # TODO: Add checks for arguments.
    # TODO: Prevent using unless authenticated.
    # TODO: Check that labels exist.

    if (missing(body))
        body <- ""

    # if (missing(milestone))
    #     milestone <- NULL

    if (!missing(labels)) {
        labels <- array(c(labels))
        base_issue_posting(repo = repo, title = title, body = body, labels = labels)
    } else {
        base_issue_posting(repo = repo, title = title, body = body)
    }
    return(invisible())

    # TODO: Add messaging about posting
    # cat("\n\nPosting `", title, "`\n\n")
    # if (!devtools:::yesno("Are you sure you want to post this event as an Issue?")) {
        # usethis:::done("Event posted as an Issue to UofTCoders/Events.")
    # } else {
    #     message("Event not posted to Issue.")
    # }
}

base_issue_posting <- function(repo, title, ...) {
    owner <- extract_owner(repo)
    repository <- extract_repository(repo)
    gh::gh(
        "POST /repos/:owner/:repo/issues",
        owner = owner,
        repo = repository,
        title = title,
        ...
    )
}

get_repo_issues <- function(repo) {
    # TODO: Add filtering
    owner <- extract_owner(repo)
    repository <- extract_repository(repo)
    gh::gh("GET /repos/:owner/:repo/issues",
           owner = owner,
           repo = repository)
}

get_self_issues <- function() {
    gh::gh("GET /user/issues")
}

get_org_issues <- function(org) {
    gh::gh("GET /orgs/:org/issues", org = org)
}

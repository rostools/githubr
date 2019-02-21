
gh_new_pull_request <- function(repo, title, head, base, body) {
    in_development()
    # https://developer.github.com/v3/pulls/#create-a-pull-request
    # https://developer.github.com/v3/pulls/#alternative-input
}

gh_edit_pull_request <- function(repo, number, title, body, state, base) {
    in_development()
    # https://developer.github.com/v3/pulls/#update-a-pull-request
}

gh_close_pull_request <- function(repo, number) {
    in_development()
    # gh_edit_pull_request(repo = repo, number = number, state = "closed")
}

gh_list_pull_requests <- function(repo) {
    in_development()
    # https://developer.github.com/v3/pulls/#list-pull-requests
}

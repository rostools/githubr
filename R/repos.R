
gh_new_repo <- function(repo, description, private) {
    in_development()
    # Check to confirm
    # Get list of organizations from https://developer.github.com/v3/orgs/
    # Compare to organization list to see if owner is org or user.
    # Because there are two different ways of creating repo.
    # https://developer.github.com/v3/repos/#create
}

gh_edit_repo <- function(repo, name, description, private,
                         has_issues, has_projects, has_wiki,
                         default_branch) {
    in_development()
    # https://developer.github.com/v3/repos/#edit
}

# gh_get_repo_info
# https://developer.github.com/v3/repos/#get

# gh_list_repos <- function(repo) {}
# https://developer.github.com/v3/repos/#list-your-repositories

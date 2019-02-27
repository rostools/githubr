
#' Create either a personal or organization repository.
#'
#' Requires a PAT authentication token.
#'
#' @param repo New repository location. In the format of
#'   "username/new_repo_name" or "organization_name/new_repo_name".
#' @param description Repository description.
#' @param private Whether the repository should be public or private. Default is
#'   public.
#'
#' @return Nothing. Creates a repository on GitHub.
#' @export
#'
#' @seealso See [githubr::githubr-package].
#'
#' @examples
#'
#' \dontrun{
#' gh_new_repo("lwjohnst86/test-repo")
#' }
#'
gh_new_repo <- function(repo, description = NULL, private = NULL) {
    owner <- extract_owner(repo)
    repository <- extract_repository(repo)

    if (owner == gh::gh_whoami()$login) {
        endpoint <- "/user/repos"
        org <- NULL
    } else if (owner %in% gh_list_user_orgs()$login) {
        endpoint <- "/orgs/:org/repos"
        org <- owner
    }

    params <- add_request_parameters(
        endpoint = endpoint,
        org = owner,
        name = repository,
        description = description,
        private = private,
        .method = "POST"
    )

    do.call(gh::gh, params)
    return(invisible())
}

#' List GitHub organizations an user is a member of.
#'
#' @param tidied Tidied up format via [`tidy()`].
#'
#' @return A tidied [tibble][tibble::tibble-package] or a `gh_response` class as
#'   a list.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' # Requires authenticated user.
#' gh_list_user_orgs()
#' }
gh_list_user_orgs <- function(tidied = TRUE) {
    # TODO: Check if authenticated.
    response <- gh::gh("GET /user/orgs")

    if (tidied) {
        headers <- c("login", "description", "url")
        response <- tidy(response)[c(headers)]
    }

    response
}

#' Edit GitHub repository details and settings.
#'
#' @inheritParams template_github_request
#' @inheritParams gh_new_repo
#' @param has_issues Whether repository should have issues.
#' @param has_projects Whether repository should have projects.
#' @param has_wiki Whether repository should have a wiki.
#' @param default_branch What the default branch should be.
#'
#' @return Nothing.
#'
gh_edit_repo <- function(repo, name, description, private,
                         has_issues, has_projects, has_wiki,
                         default_branch) {
    in_development()
    # https://developer.github.com/v3/repos/#edit
}

# gh_get_repo_info <- function(repo) {
#     # https://developer.github.com/v3/repos/#get
#     template_github_request(
#         repo = repo,
#         .request = "/repos/:owner/:repo",
#         .method = "GET"
#     )
# }

# gh_list_repos <- function(owner) {
#     # https://developer.github.com/v3/repos/#list-your-repositories
#     owner_repos <- gh::gh("/user/repos",
#                           .method = "GET")
#     tidy(owner_repos)
# }

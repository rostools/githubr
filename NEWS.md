# githubr 0.1.0.9000

* Use GitHub Actions instead of travis.
* Generate website automatically with pkgdown and GitHub Actions.
* Export tidy S3 methods (#7 and #13).
* Function to find the Git remote name and project repo automatically: `proj_repo()` (#12).

# githubr 0.1.0

* Added a `NEWS.md` file to track changes to the package
* Added functions to interact with issues such as:
    - To list items: `gh_list_issues`, `gh_list_labels`
    - To crete items: `gh_new_issue`, `gh_create_labels`
    - To delete items: `gh_delete_label`
* Added a tidier function `tidy` for converting `gh_response` class to a `tibble`
* Added function to create repository: `gh_new_repo`

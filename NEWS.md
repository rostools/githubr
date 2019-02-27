# githubr 0.1.0

# githubr 0.0.0.9000

* Added a `NEWS.md` file to track changes to the package
* Added functions to interact with issues such as:
    - To list items: `gh_list_issues`, `gh_list_labels`
    - To crete items: `gh_new_issue`, `gh_create_labels`
    - To delete items: `gh_delete_label`
* Added a tidier function `tidy` for converting `gh_response` class to a `tibble`
* Added function to create repository: `gh_new_repo`

context("Test GET and POST issue requests")

repository <- "lwjohnst86/test-githubr"

test_that("POST correctly", {
    skip("So far it works fine. No need to test and create another issue.")
    skip_on_cran()
    skip_on_appveyor()
    skip_on_travis()

    gh_new_issue(repository, title = "Test Issue", labels = "bug")
})

test_that("List labels, regular and tidied", {
    repo_labels_orig <- gh_list_labels(repository, tidied = FALSE)
    expect_is(repo_labels_orig, "gh_response")
    tidied_labels <- tidy(repo_labels_orig)
    expect_is(tidied_labels, "tbl_df")
    repo_labels_tidy <- gh_list_labels(repository)
    expect_equal(ncol(repo_labels_tidy), 2)
})

test_that("Create and delete labels", {
    skip_on_cran()
    skip_on_appveyor()
    skip_on_travis()

    new_label <- "Interest"

    # Create
    gh_create_label(repository, new_label, "deadad")
    label_created <- gh_list_labels(repository)$name
    label_created <- grep(new_label, label_created, value = TRUE)
    expect_identical(label_created, new_label)

    # Delete
    gh_delete_label(repository, new_label)
    label_deleted <- gh_list_labels(repository)$name
    label_deleted <- grep(new_label, label_deleted, value = TRUE)
    expect_length(label_deleted, 0)
})

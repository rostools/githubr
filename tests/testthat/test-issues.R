context("Test GET and POST issue requests")

repository <- "lwjohnst86/test-githubr"

test_that("POST correctly", {
    skip("Don't post issues right now.")

    lapply(gh_list_issues("lwjohnst86/test-githubr"), names)[[1]][1]
    gh_list_issues("lwjohnst86/test-githubrh")[[2]][1]
    tidy(gh_list_labels("lwjohnst86/test-githubr"))

    gh_new_issue("lwjohnst86/test-githubr", title = "testing4r", labels = "bug")
})

test_that("List labels, regular and tidied", {
    repo_labels <- gh_list_labels(repository, tidied = FALSE)
    expect_is(repo_labels, "gh_response")
    tidied_labels <- tidy(repo_labels)
    expect_is(tidied_labels, "data.frame")
    expect_equal(ncol(tidied_labels), 6)
})

test_that("Create and delete labels", {

    skip("This works fine.")
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

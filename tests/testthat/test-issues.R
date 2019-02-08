context("Test GET and POST issue requests")

test_that("POST correctly", {
    skip_on_travis()

    get_repo_issues("lwjohnst86/cv")
    # post_repo_issue("lwjohnst86/test-r2gh",
    #                 title = "testing2")

})

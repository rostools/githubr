#' Convert a `gh_response` object to a tidied data.frame.
#'
#' The class `gh_response` is returned from [gh::gh]. The tidy function converts
#' it from a list to a [tibble][tibble::tibble-package].
#'
#' @param x The input to tidy.
#' @param ... Arguments passed to other methods or cases.
#'
#' @return a [tibble][tibble::tibble-package].
#' @export
#'
#' @examples
#'
#' \dontrun{
#' # For labels
#' Labels <- gh_list_labels("lwjohnst86/test-githubr", tidied = FALSE)
#' Labels
#' tidy(Labels)
#' gh_list_labels("lwjohnst86/test-githubr")
#'
#' Issues <- gh_list_issues("lwjohnst86/test-githubr", tidied = FALSE)
#' Issues
#' tidy(Issues)
#' gh_list_issues("lwjohnst86/test-githubr")
#' }
tidy <- function(x, ...) {
    UseMethod("tidy", x)
}

#' @rdname tidy
#' @export
tidy.gh_response <- function(x, ...) {
    elements_to_dataframe <- function(x) {
        data.frame(t(unlist(x)), stringsAsFactors = FALSE)
    }
    list_of_dataframes <- lapply(x, elements_to_dataframe)

    list_of_header_names <- lapply(list_of_dataframes, names)
    all_header_names <- unique(unlist(list_of_header_names))

    fill_dataframe_with_headers <- function(x) {
        name_differences <- setdiff(all_header_names, names(x))
        filled_in <- sapply(name_differences, function(y) NA)
        data.frame(c(x, filled_in), stringsAsFactors = FALSE)
    }

    response_dataframe <- do.call(
        rbind, lapply(list_of_dataframes, fill_dataframe_with_headers)
    )
    tibble::as_tibble(response_dataframe)
}

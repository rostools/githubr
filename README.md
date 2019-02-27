
<!-- README.md is generated from README.Rmd. Please edit that file -->

# githubr: An R Interface to GitHub

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/lwjohnst86/githubr.svg?branch=master)](https://travis-ci.org/lwjohnst86/githubr)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/lwjohnst86/githubr?branch=master&svg=true)](https://ci.appveyor.com/project/lwjohnst86/githubr)
[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

The goal of githubr is to simplify using GitHub’s API. Uses the
wonderful [gh](https://github.com/r-lib/gh) R package. Inspiration also
comes from the [gitlabr](https://CRAN.R-project.org/package=gitlabr).

## Installation

You can install the development version of githubr with:

``` r
# install.packages("remotes")
remotes::install_github("lwjohnst86/githubr")
```

## Examples

So far there are only functions to interact with Issues. For example, to
list issues or labels:

``` r
library(githubr)

# See issues
gh_list_issues("lwjohnst86/carpenter")[[1]]
#> $url
#> [1] "https://api.github.com/repos/lwjohnst86/carpenter/issues/25"
#> 
#> $repository_url
#> [1] "https://api.github.com/repos/lwjohnst86/carpenter"
#> 
#> $labels_url
#> [1] "https://api.github.com/repos/lwjohnst86/carpenter/issues/25/labels{/name}"
#> 
#> $comments_url
#> [1] "https://api.github.com/repos/lwjohnst86/carpenter/issues/25/comments"
#> 
#> $events_url
#> [1] "https://api.github.com/repos/lwjohnst86/carpenter/issues/25/events"
#> 
#> $html_url
#> [1] "https://github.com/lwjohnst86/carpenter/issues/25"
#> 
#> $id
#> [1] 405201784
#> 
#> $node_id
#> [1] "MDU6SXNzdWU0MDUyMDE3ODQ="
#> 
#> $number
#> [1] 25
#> 
#> $title
#> [1] "Remove OSX from travis?"
#> 
#> $user
#> $user$login
#> [1] "lwjohnst86"
#> 
#> $user$id
#> [1] 6662983
#> 
#> $user$node_id
#> [1] "MDQ6VXNlcjY2NjI5ODM="
#> 
#> $user$avatar_url
#> [1] "https://avatars2.githubusercontent.com/u/6662983?v=4"
#> 
#> $user$gravatar_id
#> [1] ""
#> 
#> $user$url
#> [1] "https://api.github.com/users/lwjohnst86"
#> 
#> $user$html_url
#> [1] "https://github.com/lwjohnst86"
#> 
#> $user$followers_url
#> [1] "https://api.github.com/users/lwjohnst86/followers"
#> 
#> $user$following_url
#> [1] "https://api.github.com/users/lwjohnst86/following{/other_user}"
#> 
#> $user$gists_url
#> [1] "https://api.github.com/users/lwjohnst86/gists{/gist_id}"
#> 
#> $user$starred_url
#> [1] "https://api.github.com/users/lwjohnst86/starred{/owner}{/repo}"
#> 
#> $user$subscriptions_url
#> [1] "https://api.github.com/users/lwjohnst86/subscriptions"
#> 
#> $user$organizations_url
#> [1] "https://api.github.com/users/lwjohnst86/orgs"
#> 
#> $user$repos_url
#> [1] "https://api.github.com/users/lwjohnst86/repos"
#> 
#> $user$events_url
#> [1] "https://api.github.com/users/lwjohnst86/events{/privacy}"
#> 
#> $user$received_events_url
#> [1] "https://api.github.com/users/lwjohnst86/received_events"
#> 
#> $user$type
#> [1] "User"
#> 
#> $user$site_admin
#> [1] FALSE
#> 
#> 
#> $labels
#> $labels[[1]]
#> $labels[[1]]$id
#> [1] 375930154
#> 
#> $labels[[1]]$node_id
#> [1] "MDU6TGFiZWwzNzU5MzAxNTQ="
#> 
#> $labels[[1]]$url
#> [1] "https://api.github.com/repos/lwjohnst86/carpenter/labels/question"
#> 
#> $labels[[1]]$name
#> [1] "question"
#> 
#> $labels[[1]]$color
#> [1] "cc317c"
#> 
#> $labels[[1]]$default
#> [1] TRUE
#> 
#> 
#> 
#> $state
#> [1] "open"
#> 
#> $locked
#> [1] FALSE
#> 
#> $assignee
#> NULL
#> 
#> $assignees
#> list()
#> 
#> $milestone
#> NULL
#> 
#> $comments
#> [1] 0
#> 
#> $created_at
#> [1] "2019-01-31T11:29:04Z"
#> 
#> $updated_at
#> [1] "2019-01-31T11:29:04Z"
#> 
#> $closed_at
#> NULL
#> 
#> $author_association
#> [1] "OWNER"
#> 
#> $body
#> [1] ""

# See labels.
gh_list_labels("lwjohnst86/githubr")
#> # A tibble: 8 x 6
#>         id node_id       url                         name     color default
#>      <int> <chr>         <chr>                       <chr>    <chr> <lgl>  
#> 1   1.23e9 MDU6TGFiZWwx… https://api.github.com/rep… bug      d73a… TRUE   
#> 2   1.23e9 MDU6TGFiZWwx… https://api.github.com/rep… duplica… cfd3… TRUE   
#> 3   1.23e9 MDU6TGFiZWwx… https://api.github.com/rep… enhance… a2ee… TRUE   
#> 4   1.23e9 MDU6TGFiZWwx… https://api.github.com/rep… good fi… 7057… TRUE   
#> 5   1.23e9 MDU6TGFiZWwx… https://api.github.com/rep… help wa… 0086… TRUE   
#> 6   1.23e9 MDU6TGFiZWwx… https://api.github.com/rep… invalid  e4e6… TRUE   
#> 7   1.23e9 MDU6TGFiZWwx… https://api.github.com/rep… question d876… TRUE   
#> 8   1.23e9 MDU6TGFiZWwx… https://api.github.com/rep… wontfix  ffff… TRUE
```

## Contributing

Please note that the ‘githubr’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.

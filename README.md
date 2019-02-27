
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

Currently, most of the functionality revolves around Issues. For
example, to list issues or labels:

``` r
library(githubr)

# See issues
gh_list_issues("lwjohnst86/carpenter")
#> # A tibble: 13 x 37
#>    state number title labels.name body  milestone.url milestone.html_…
#>    <chr> <chr>  <chr> <chr>       <chr> <chr>         <chr>           
#>  1 open  25     Remo… question    ""    <NA>          <NA>            
#>  2 open  24     Add … docs        ""    https://api.… https://github.…
#>  3 open  23     Add … docs        To Z… https://api.… https://github.…
#>  4 open  21     Crea… feature     ""    https://api.… https://github.…
#>  5 open  20     Func… feature     For … https://api.… https://github.…
#>  6 open  19     Add … feature     ""    https://api.… https://github.…
#>  7 open  17     Add … feature     ""    https://api.… https://github.…
#>  8 open  16     Use … feature     ""    <NA>          <NA>            
#>  9 open  15     Have… feature     Inst… https://api.… https://github.…
#> 10 open  14     Chan… feature     This… https://api.… https://github.…
#> 11 open  9      Use … feature     Simi… https://api.… https://github.…
#> 12 open  2      Add … <NA>        ""    <NA>          <NA>            
#> 13 open  1      Add … <NA>        ""    <NA>          <NA>            
#> # … with 30 more variables: milestone.labels_url <chr>,
#> #   milestone.id <chr>, milestone.node_id <chr>, milestone.number <chr>,
#> #   milestone.title <chr>, milestone.description <chr>,
#> #   milestone.creator.login <chr>, milestone.creator.id <chr>,
#> #   milestone.creator.node_id <chr>, milestone.creator.avatar_url <chr>,
#> #   milestone.creator.gravatar_id <chr>, milestone.creator.url <chr>,
#> #   milestone.creator.html_url <chr>,
#> #   milestone.creator.followers_url <chr>,
#> #   milestone.creator.following_url <chr>,
#> #   milestone.creator.gists_url <chr>,
#> #   milestone.creator.starred_url <chr>,
#> #   milestone.creator.subscriptions_url <chr>,
#> #   milestone.creator.organizations_url <chr>,
#> #   milestone.creator.repos_url <chr>, milestone.creator.events_url <chr>,
#> #   milestone.creator.received_events_url <chr>,
#> #   milestone.creator.type <chr>, milestone.creator.site_admin <chr>,
#> #   milestone.open_issues <chr>, milestone.closed_issues <chr>,
#> #   milestone.state <chr>, milestone.created_at <chr>,
#> #   milestone.updated_at <chr>, comments <chr>

# See labels.
gh_list_labels("lwjohnst86/githubr")
#> # A tibble: 8 x 2
#>   name             color 
#>   <chr>            <chr> 
#> 1 bug              d73a4a
#> 2 duplicate        cfd3d7
#> 3 enhancement      a2eeef
#> 4 good first issue 7057ff
#> 5 help wanted      008672
#> 6 invalid          e4e669
#> 7 question         d876e3
#> 8 wontfix          ffffff
```

## Contributing

Please note that the ‘githubr’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.

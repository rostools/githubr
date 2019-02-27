
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
comes from the [gitlabr](https://CRAN.R-project.org/package=gitlabr)
package.

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
#> # A tibble: 13 x 11
#>    state number title labels.name body  milestone.number milestone.title
#>    <chr> <chr>  <chr> <chr>       <chr> <chr>            <chr>          
#>  1 open  25     Remo… question    ""    <NA>             <NA>           
#>  2 open  24     Add … docs        ""    1                v0.3.0         
#>  3 open  23     Add … docs        To Z… 1                v0.3.0         
#>  4 open  21     Crea… feature     ""    1                v0.3.0         
#>  5 open  20     Func… feature     For … 1                v0.3.0         
#>  6 open  19     Add … feature     ""    1                v0.3.0         
#>  7 open  17     Add … feature     ""    1                v0.3.0         
#>  8 open  16     Use … feature     ""    <NA>             <NA>           
#>  9 open  15     Have… feature     Inst… 1                v0.3.0         
#> 10 open  14     Chan… feature     This… 1                v0.3.0         
#> 11 open  9      Use … feature     Simi… 1                v0.3.0         
#> 12 open  2      Add … <NA>        ""    <NA>             <NA>           
#> 13 open  1      Add … <NA>        ""    <NA>             <NA>           
#> # … with 4 more variables: milestone.open_issues <chr>,
#> #   milestone.closed_issues <chr>, milestone.state <chr>, comments <chr>

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

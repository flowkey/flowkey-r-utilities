# Flowkey R Utilities

From our workflows for writing analytics scripts, there are shortcuts that have
been extracted from repeated tasks into routines and functions in this
repository. So much gold!

## Installing the package:

```{r}
devtools::install_github('flowkey/flowkey-r-utilities')
```

To use it:

```{r}
library(flowkey)
```

## Building the package (after dev changes):

```{r}
roxygen2::roxygenize(clean=TRUE)
```

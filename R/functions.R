#' Useful default settings for very small tabular output.
#' @export
tiny.datatable <- function(DT, rownames=FALSE, options=list(searching=FALSE, info=FALSE, paging=FALSE, ordering=FALSE)) {
  library(DT)
  datatable(DT, rownames=rownames, options=options)
}

#' Datatable that hides the rownames and adds Download CSV button
#' @export
datatable.with.csv <- function(DT, rownames=FALSE, ...) {
  library(DT)
  datatable(DT, rownames=rownames, extensions='Buttons', options=list(dom='Bfrtip', buttons='csv'))
}

#' Wrapper around length(unique()). The naming is influenced by nunique in pandas and in plyr, but shortend to nuniq like the UNIX tool.
#' @export
nuniq <- function(...) {
  length(unique(...))
}

#' Wrapper around ggplotly that hides the annoying Mode Bar options
#' @export
.ggplotly <- function(...) {
  ggplotly(..., dynamicTicks=FALSE) %>% config(displayModeBar = FALSE)
}

#' If you have a table like:
#'
#' variant   | cr
#' TREATMENT | 5.8
#' CONTROL   | 3.7
#'
#' This function can calculate the uplift in TREATMENT using abtest.uplift(dat, 'cr').
#'
#' @export
abtest.uplift <- function(summary_dt, column) {
  if (! column %in% names(summary_dt)) {
    stop('abtest_calculate_uplift data.table is expected to have a variant column')
  }

  if (nrow(summary_dt) != 2) {
    stop('abtest_calculate_uplift data.table is expected to exactly 2 rows')
  }

  if (nrow(summary_dt[variant == 'TREATMENT']) != 1) {
    stop('abtest_calculate_uplift data.table is expected to exactly 1 row for variant == TREATMENT')
  }

  if (nrow(summary_dt[variant == 'CONTROL']) != 1) {
    stop('abtest_calculate_uplift data.table is expected to exactly 1 row for variant == CONTROL')
  }

  (summary_dt[variant == 'TREATMENT'][[column]] - summary_dt[variant == 'CONTROL'][[column]]) / summary_dt[variant == 'CONTROL'][[column]]
}

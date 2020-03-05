#' Wrangle the CEDAR database's raw SQL Microbiology Table to match categorization criteria established by Kevin Ackerman, MD
#'
#' @description This function is to help CEDAR-users wrangle the raw microbiology data table according to standards established by Kevin Ackerman without the entire R script.
#'
#' @param micro_df A data frame or tibble object of raw SQL microbiology data
#'
#' @return A tibble appended with columns `test_type`, `source`, `organism` and `oranism_type`
#' @export
#'
#' @importFrom dplyr %>%

#' @examples
wrangle_micro <- function(micro_df){
  micro_df %>%
    add_test_type() %>%
    add_source() %>%
    add_organism() %>%
    add_organism_type() %>%
    add_result() %>%
    add_organism_merge()
}
#
#

#' Import a txt file from SQL data base and turn into a tidied tibble dataframe
#'
#' @param txt_file The path to a txt file saved from SQL
#'
#' @return A data frame tibble
#' @export
#'
#' @examples
#'
#'
txt_to_tbl <- function(txt_file){
  readr::read_delim(txt_file,
                  delim="\t",
                  na = c("","NA","NULL"),
                  guess_max = 1000000)
}

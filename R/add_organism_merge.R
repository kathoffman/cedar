#' micro internal function
#'
#' @param micro_df data frame of micro data
#'
#' @return
#' @importFrom dplyr %>% mutate case_when
add_organism_merge <- function(micro_df) {

  dplyr::mutate(micro_df,
                  organism_merge = dplyr::case_when(
                    organism %in% c("Multiple", "Bacteria – Multiple", "Fungi – Multiple") &
                      microbiology_type == "Culture" &
                      result == "Positive" ~ source_value,
                    organism == "Multiple" &
                      result == "Positive" ~ organism_name,
                    TRUE ~ organism
                  )
                )
}

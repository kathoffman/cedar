#' Pull from a CEDAR database on a mac
#'
#' @param tbl_name string indicating name of table in database
#' @param db main database
#' @param second_db secondary database (for COVID IDR only)
#' @param path_to_save optional file path to save an rds file of the data pull
#'
#' @return tibble of pulled sql data
#' @importFrom rstudioapi askForPassword
#' @importFrom DBI dbConnect dbGetQuery
#' @importFrom odbc odbc
#' @importFrom glue glue
#' @importFrom readr write_rds
#' @importFrom janitor clean_names
#'
#' @export
#'
#' @examples #not run pull_data("PATIENTS", "COVID_DATALAKE", "CEDAR")
pull_data <- function(tbl_name,
                      db = "DM_PLMNRY",
                      second_db = NULL,
                      path_to_save = NULL){
  tbl_name <- toupper(tbl_name)
  con <- DBI::dbConnect(odbc::odbc(),
                   Driver = "FreeTDS",
                   Server = "VITS-ARCHSQLP04.a.wcmc-ad.net",
                   Database = db,
                   Port = 1433,
                   # enter cumc\cwid at the prompt
                   uid = rstudioapi::askForPassword("Database username"),
                   # cwid password
                   pwd = rstudioapi::askForPassword("Database password")
  )

  if(db == "DM_PLMNRY"){
    df <- DBI::dbGetQuery(con, glue::glue("SELECT * FROM {db}.{tbl_name}")) %>% janitor::clean_names()
  }
    else{
    df <- DBI::dbGetQuery(con, glue::glue("SELECT * FROM {db}.{second_db}.{tbl_name}")) %>% janitor::clean_names()
    }
  if(!is.null(path_to_save)){
    readr::write_rds(df, path_to_save)
  }
  return(df)
}



# cedar
A package for working with raw data tables exported from Weill Cornell Medicine's CEDAR ICU SQL data base. A huge thank you to former WCM Biostatistician Clara Oromendia for her previous work wrangling the CEDAR data base.

To install:

`devtools::install_github("hoffmakl/cedar")`

## `txt_to_tbl()`

This function takes the raw txt files from SQL and reads them into R.

## `micro_wrangle()`

`micro_wrangle()` takes a data frame or tibble object of the raw microbiology table from SQL and appends the columns `test_type`, `source`, `organism`, and `organism_type` according to criteria established by Kevin Ackerman, MD in May 2019.

Instructions:

1. From SQL Access, save the MICROBIOLOGY LABS table as a txt file.

2. Import the file into R using `txt_to_tbl()` and save as a dataframe object.

    ```dat_micro_raw <- txt_to_tbl("data/microbiology_labs.txt")```
    
3. Run the `micro_wrangle()` function on your data frame and save the results as a new object. This will take a few minutes.

    ```dat_micro <- micro_wrangle(dat_micro_raw)```
    
4. You can now explore the rich information in the microbiology table using the condensed and more relevant categories for test type, source, organism, and organism type.



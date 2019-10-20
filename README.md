# cedar
A package for wrangling raw data tables exported from Weill Cornell Medicine's CEDAR ICU SQL data base

To install:

`devtools::install_github("hoffmakl/cedar")`

## `micro_wrangle()`

Currently the only function is `micro_wrangle()`, which takes a data frame or tibble object of the raw microbiology table from SQL and appends the columns `test_type`, `source`, `organism`, and `organism_type` according to criteria established by Kevin Ackerman, MD in May 2019.

Instructions:

1. From SQL Access, save the MICROBIOLOGY LABS table as a csv or txt file.

2. Import the file into R using `read.csv`, `read.table`, etc. and save as a dataframe object.

    ```dat_micro_raw <- read.csv("microbiology_labs.csv")```
    
3. Run the `micro_wrangle()` function on your data frame and save the results as a new object. This will take a few minutes.

    ```dat_micro <- micro_wrangle(dat_micro_raw)```
    
4. You can now explore the rich information in the microbiology table using the condensed and more relevant categories for test type, source, organism, and organism type.



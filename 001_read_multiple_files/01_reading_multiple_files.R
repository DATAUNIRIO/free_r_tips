# R TIPS ----
# TIP 001: Reading Multiple Files ----
#
# 👉 For Weekly R-Tips, Signup Here: https://learn.business-science.io/r-tips-newsletter

library(tidyverse)
library(fs)

file_paths <- fs::dir_ls("001_read_multiple_files/data")
file_paths

# 1.0 FOR LOOP ----

file_contents <- list()

for (i in seq_along(file_paths)) {
    file_contents[[i]] <- read_csv(
        file = file_paths[[i]]
    )
}

file_contents <- set_names(file_contents, file_paths)


# 2.0 PURRR MAP ----

file_contents <- file_paths %>%
    map(function (path) {
        read_csv(path, col_types = "ccdddccddcc")
    })

bind_rows(file_contents, .id = "file_path") %>% View()

# LEARNING MORE ----

# FREE MASTERCLASS
# - 10 SECRETS TO BECOMING A DATA SCIENTIST
#   https://learn.business-science.io/free-rtrack-masterclass



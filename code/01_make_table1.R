here::i_am("code/01_make_table1.R")

data <- readRDS(
  file = here::here("output/data_clean.rds")
)

library(kableExtra)

desc_table <- kbl(data) |>
  kableExtra::add_header_above(c("Prevalence of Cardiovascular Disease Among United States Adults in 2000" = 8)) |>
  kable_styling(bootstrap_options = "striped",    full_width = F, position = "left")

saveRDS(
  desc_table,
  file = here::here("output/desc_table.Rds")
)

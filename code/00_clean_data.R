here::i_am("code/00_clean_data.R")
absolute_path_to_data <- here::here("raw_data/NVSS__National_Cardiovascular_Disease_Surveillance_Data_20240206.csv")
data <- read.csv(absolute_path_to_data, header = TRUE)

pacman::p_load(tidyverse, rio, kableExtra)

nvss_wide <- data |> 
  filter(Data_Value_Type == "Age-Standardized", YearStart == "2000", LocationDesc != "United States", Break_Out %in% c("Overall", "Male", "Female", "Non-Hispanic White", "Non-Hispanic Black", "Hispanic", "Other")) |>
  select(State = "LocationDesc", cat = "Break_Out", Rate = "Data_Value") |>
  distinct() |>
  group_by(State, cat) |>
  mutate(row=row_number()) |>
  filter(row==1) |>
  pivot_wider(names_from = cat, values_from = Rate) |>
  select(-row)

saveRDS(
  nvss_wide, 
  file = here::here("output/data_clean.rds")
)

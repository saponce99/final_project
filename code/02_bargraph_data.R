here::i_am("code/02_bargraph_data.R")

absolute_path_to_data <- here::here("raw_data/NVSS__National_Cardiovascular_Disease_Surveillance_Data_20240206.csv")
data2 <- read.csv(absolute_path_to_data, header = TRUE)

pacman::p_load(tidyverse, rio)

nvss_state <- data2 |> 
  filter(Data_Value_Type == "Age-Standardized", LocationDesc == "California", Break_Out %in% c("Overall", "Male", "Female")) |>
  select(State = "LocationDesc", cat = "Break_Out", Rate = "Data_Value", "YearStart") |>
  distinct() |>
  group_by(State, cat) |>
  mutate(row=row_number()) |>
  filter(row==1)

nvss_wide_state <- tidyr::pivot_wider(nvss_state,
                                      names_from = cat,
                                      values_from = Rate
) |>
  select(-row)


# Create a data frame with 'Male', 'Female', and 'Overall' in one column and prevalence in another column
strat_sex <- data.frame(Category = c(rep("Male", length(nvss_wide_state$Male)),
                                     rep("Female", length(nvss_wide_state$Female)),
                                     rep("Overall", length(nvss_wide_state$Overall))),
                        Prevalence = c(nvss_wide_state$Male, nvss_wide_state$Female, nvss_wide_state$Overall))

saveRDS(
  strat_sex, 
  file = here::here("output/bargraph_data.rds")
)


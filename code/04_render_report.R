here::i_am("code/04_render_report.R")

library(rmarkdown)
report_filename <- paste0(
  "Final_Project",
  ".html"
)


#rendering a report in production mode
render(
  "Final_Project.Rmd", 
  output_format = "html_document",
  output_file = report_filename
)

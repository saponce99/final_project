
## Final_Project.html:  This is the final report
Final_Project.html: code/04_render_report.R Final_Project.Rmd \
  output/data_clean.rds output/desc_table.rds output/bargraph_data.rds \
  output/bargraph.png
	Rscript code/04_render_report.R

## output/data_clean.rds: This is the cleaned data object from R
output/data_clean.rds: code/00_clean_data.R raw_data/NVSS__National_Cardiovascular_Disease_Surveillance_Data_20240206.csv
	Rscript code/00_clean_data.R

## output/bargraph_data.rds: This is the formatted bargraph data
output/bargraph_data.rds: code/02_bargraph_data.R raw_data/NVSS__National_Cardiovascular_Disease_Surveillance_Data_20240206.csv
	Rscript code/02_bargraph_data.R
	
## output/desc_table.rds: this is the descriptive table
output/desc_table.rds: code/01_make_table1.R output/data_clean.rds
	Rscript code/01_make_table1.R
	
## output/bargraph.png: this is the bar graph
output/bargraph.png: code/03_make_bargraph.R output/bargraph_data.rds
	Rscript code/03_make_bargraph.R

## renv install
.PHONY: install
install:
	Rscript -e "renv::restore(prompt=FALSE)"
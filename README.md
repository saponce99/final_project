# Code Description

`code/00_clean_data.R`
- generates the clean dataset for the descriptive table
- saves data as a `data_clean.Rds` object in `output/` folder

`code/01_make_table1.R`
- generates a descriptive table stratified by sex and race-ethnicity using `data_clean.Rds`
- saves the table as `desc_table.Rds` object in `output/`

`code/02_bargraph_data.R`
- generates the clean dataset for the bargraph
- saves data as a `bargraph_data.Rds` object in `output/` folder

`code/01_make_table1.R`
- generates a formatted bargraph for the state of California stratified by sex
using `bargraph_data.Rds`
- saves the bargraph as `bargraph.png` object in `output/`

`Final_Project.Rmd`
- generates a report with the descriptive table and bargraph
- includes data description, analysis plan, and table and figure descriptions


`code/04_render_report.R` is used for rendering the combined report from the command line

Synchronize project environment
run 'make install' in the terminal to synchronize the package repository

`make report/Final_Project.html`
- runs the docker image for a Windows machine
- in order to run on a Mac/Linux-OS machine remove the forward slash in the make rule so that the path is as follows:
 "$$(pwd)/report":/home/rstudio/project/report saponce99/final_project_image3

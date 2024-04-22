FROM rocker/rstudio as base

#create project directory and set it to working directory
RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN R -e "renv::restore()"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######

FROM rocker/rstudio

WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project .

ENV WHICH_CONFIG="default"

#copy necessary files to the container directory
COPY Makefile Makefile
COPY Final_Project.Rmd Final_Project.Rmd

#create code output directories in container
RUN mkdir code output raw_data report

COPY raw_data/NVSS__National_Cardiovascular_Disease_Surveillance_Data_20240206.csv raw_data/NVSS__National_Cardiovascular_Disease_Surveillance_Data_20240206.csv
COPY code/*.R code/

#move Final_Project.html from container to local directory
CMD make Final_Project.html && mv Final_Project.html report
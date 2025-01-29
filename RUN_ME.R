#initial setup
source("functions/check_renv_status.R")

if(!require(renv)) {
  install.packages("renv") 
}

renv::restore(prompt = FALSE)

check_renv_status()

#------------------------

#create the analysis output
#Rendering takes about 10 minutes on an M4 MacBook Pro, running macOS Sequoia 15.1.1

quarto::quarto_render("RPG_ASEAN_Analysis.qmd")

#Output files are:
#all files in folder `files/`
#File `RPG_ASEAN_Analysis.html`
<img src="https://github.com/tscnlab/Templates/blob/main/logo/logo_with_text-01.png" width="400"/>

## Preface

This repository provides the data and the analysis documentation to the publication "[*Physiologically-relevant light exposure and light behaviour in Switzerland and Malaysia*](https://doi.org/10.1101/2025.01.07.631760)"(PREPRINT Link), as per the [OSF Preregistration from 18 October 2024, version v1.0.1](https://osf.io/pd79m).

In short, light exposure was measured in Basel, Switzerland, and Kuala Lumpur, Malaysia, for one month in 20 individuals per site. Additionally, questionnaires on sleep (PSQI) and light exposure behaviour ([LEBA](https://leba-instrument.org)) were collected at specified times.

The R code in this repository is publicly accessible under the [MIT](https://opensource.org/license/mit) license. The data is accessible under the [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/) license.  

## Relevant documents

**Data**: 

Data files are contained in the folder `data`, and further divided by sites. 

- The Malaysia site contains one subfolder per participant (ID), each containing light exposure and questionnaire data. Questionnaire data files contain `qualtrics` in their file name. 

- The Switzerland site contains a `REDCap` subfolder with the questionnaire data for all participants (IDs). Light exposure data is contained in a subfolder `Speccy` and a further folder structure by ID. Questionnaire ID and light exposure ID do not match. The file `Participant List Anonymised.xlsx` in the `Basel` root folder provides matches between `ID` (light exposure) and `Code` (questionnaires)

- The `processed` subfolder containes bootstrap-data, produced during the analysis. As this is time consuming, bootstraps are stored here to speed up the rest of the analysis.

**Analysis documentation**:

The comprehensive analysis documentation can be found in the file `RPG_ASEAN_Analysis.html` in the project root, which can be opened with any browser. GitHub does not support viewing it online, so it has to be downloaded. This is a rendered [Quarto](www.quarto.org) project file for transparent and reproducible research. 

**Figures and tables**:

Figures and tables, created as part of the analysis, and published with the manuscript, can be found in the folder `figures`.

## Reproduce results

The best way to reproduce the results is to clone this repository to a local directory. Scripts depend on data and folders in the same directory structure as provided in this repository.

Results can be reproduced by executing the R script `RUN_ME.R`. Executing the script will perform the following actions:

- loading the custom function `check_renv_status`
- checking whether the `renv` package for reproducible package environments is installed (and installs it if need be)
- restoring the project package library as contained int the `renv.lock` file
- checking whether the project package library is successfully installed (will throw an error otherwise)
- rendering the file `RPG_ASEAN_Analysis.qmd`. A successful run will produce an HMTL file of the same name, containing the analysis documentation, and all figures and tables in the subfolder `figures`

*Note 1: The script requires a **chrome** or **chromium browser** to be installed on the system. Please ensure that such a browser is installed prior to execution. After a fresh install of the browser, restarting the system is suggested. The browser is used in a headless mode by the {webshot2} package through the {chromote} package, whenever `gt_save()` is called to save a table. Without chrome the script will stop with an error.*

*Note 2: The package versions in the `renv.lock` file were tested against a fresh install of R and RStudio on a M4 MacBook Pro running MacOS Sequoia, a virtual machine running Windows 11 ARM, and Posit Cloud running Ubuntu 20.04 (Focal). Test runs were made on `30 January 2025`. If packages fail to install upon reproduction.* 

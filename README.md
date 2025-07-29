## Assessment: UNICEF D&A Team

This repository provides a reproducible pipeline to generate a national-level summary report of ANC4 and SBA coverage, weighted by projected births for 2022. The report leverages harmonized MNCH indicators from UNICEF and demographic projections from the UN World Population Prospects.

------------------------------------------------------------------------

### 📋 How to Run the Project

#### 1. Clone the Repository
``` bash
git clone https://github.com/hg-vita/drp-assess.git
cd drp-assess
```
#### 2. Render the Report
Run the project from R or RStudio:
``` r
source("run_project.R")
```
Or from command line:
``` bash
Rscript run_project.R
```
This will: - Set up the environment (`user_profile.R`) - Load data and analysis logic (`mnch_analysis.R`) - Generate the final HTML report (`report.Rmd` → `outputs/report.html`)

------------------------------------------------------------------------

### 📁 Structure and Purpose

| Folder/File           | Purpose                                                        |
|--------------------|----------------------------------------------------|
| `01_data/`            | All input data used for the analysis                           |
| ├── `01_clean_data/`  | Contains cleaned worldpop and unapi data        |
| ├── `02_process_data/`  | Contains cleaned raw data files, for intemrmediate processing       |
| └── `03_prod_data/`   | Final merged datasets for document generation          |
| `02_script/`          | Contains reusable scripts for data transformation and analysis |
| `03_output/`           | Target location for all generated reports  and related output |
| `report.Rmd`          | Main RMarkdown file used to render the summary report          |
| `run_project.R`       | Script to orchestrate execution of the report pipeline         |
| `user_profile.R`      | Environment-agnostic setup: directories + package installation |

------------------------------------------------------------------------
## 📤 Output
After successful execution, the report will be available at:
```         
outputs/report.html
```
Open it in any browser to explore the data and tables interactively.

------------------------------------------------------------------------
## Positions Applied

I have applied for the following positions \
- Learning and Skills Data Analyst Consultant – Req. \#**581598** \
- Administrative Data Analyst – Req \#**581696**

------------------------------------------------------------------------


# 📊 Consultancy Assessment Submission

This repository contains a reproducible workflow to calculate **population-weighted health service coverage** for:

- **Antenatal Care (ANC4)**: % of women (15–49) with at least 4 ANC visits
- **Skilled Birth Attendance (SBA)**: % of deliveries attended by skilled health personnel

---

## ✅ Repository Structure

```
consultancy-assessment/
├── data/
│   ├── coverage_data.csv               # Raw data
│   ├── cleaned_data.rds                # Output from script 1
│   └── weighted_coverage.rds           # Output from script 2
├── outputs/
│   ├── anc4_sba_plot.png               # Output plot
│   └── summary_table.csv               # Output table
├── scripts/
│   ├── 01_clean_data.R
│   ├── 02_calculate_coverage.R
│   └── 03_generate_outputs.R
├── report/
│   └── dashboard_report.Rmd            # Optional interactive report
├── run_all.R                           # Master script to run all
├── README.md
```

---

## 🚀 How to Run

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/consultancy-assessment.git
cd consultancy-assessment
```

### 2. Run the entire analysis (R terminal or console)

```r
source("run_all.R")
```

This will:
- Clean the raw data
- Calculate weighted ANC4/SBA coverage
- Generate outputs: plot + summary table

---

## 📄 Optional Report

To render the interactive report (with dropdowns and PDF export):

```r
rmarkdown::render("report/dashboard_report.Rmd", output_format = "pdf_document")
```

---

## ✅ Submission Checklist

- [x] Well-structured folder hierarchy
- [x] Automated execution via `run_all.R`
- [x] Clean, documented, and reproducible scripts
- [x] Version controlled with Git
- [x] Outputs (plot + table) saved to `outputs/`
- [x] Optional interactive markdown report

---

🕓 **Submitted before**: 29 July 2025, 6:00 AM EST / 3:30 PM IST  
🔗 **GitHub Repo**: [insert final repo link here]

Thank you for reviewing this submission.

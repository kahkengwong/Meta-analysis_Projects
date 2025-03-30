# Meta-Analysis Projects

Welcome to the **Meta-Analysis Projects** repository! This repository contains R scripts for meta-analyses conducted by Kah Keng Wong, focusing on the association of antiphospholipid antibodies with migraine and dementia. The scripts were used to generate forest plots, L'Abbe plots, funnel plots, and other diagnostic visualizations, subgroup analyses (e.g., adults vs pediatrics, gender, migraine with/without aura), for two peer-reviewed papers published in 2017. This repository serves as an archive of the meta-analysis workflows, showcasing statistical analysis and visualization techniques using R's `metafor` package.

![Project Status](https://img.shields.io/badge/status-active-brightgreen)
![GitHub last commit](https://img.shields.io/github/last-commit/kahkengwong/Meta-analysis_Projects)
![GitHub languages](https://img.shields.io/github/languages/count/kahkengwong/Meta-analysis_Projects)
![GitHub top language](https://img.shields.io/github/languages/top/kahkengwong/Meta-analysis_Projects)
![Contributors](https://img.shields.io/github/contributors/kahkengwong/Meta-analysis_Projects)

## Scripts

### [MetaAnalysis_ForestPlots.R](MetaAnalysis_ForestPlots.R)

This script generates meta-analysis visualizations for two papers:

1. **"Comorbid association of antiphospholipid antibodies and migraine: A systematic review and meta-analysis"**  
   Published in *Autoimmunity Reviews* (PMID: [28279839](https://pubmed.ncbi.nlm.nih.gov/28279839/))  
   This paper investigates the association between antiphospholipid antibodies (aPLs) and migraine, including subgroup analyses by age, gender, and migraine type 
   (with/without aura).

2. **"Presence of Anticardiolipin Antibodies in Patients with Dementia: A Systematic Review and Meta-Analysis"**  
   Published in *Frontiers in Aging Neuroscience* PMID: [28824414](https://pubmed.ncbi.nlm.nih.gov/28824414/)  
   This paper examines the presence of anticardiolipin antibodies in patients with dementia, using similar meta-analysis techniques.

#### Script Structure

The script is organized into 10 sections, each focusing on a specific aspect of the meta-analysis:

- **Section 1: Setup and Package Installation**  
  Installs and loads required packages (`xlsx`, `metafor`, `RColorBrewer`) and sets the base directory for the migraine meta-analysis.

- **Section 2: Forest Plots for Single Antibodies (aCL, B2GP1, LA)**  
  Generates forest plots for anticardiolipin (aCL), anti-β2-glycoprotein I (B2GP1), and lupus anticoagulant (LA) antibodies using both random and fixed effects models. Outputs are saved as PDFs with dimensions 769x613 pixels.

- **Section 3: Subgroup Analysis - Adults and Pediatrics (aCL, B2GP1, LA)**  
  Performs subgroup analyses for adults and pediatrics, generating forest plots for aCL, B2GP1, and LA antibodies. Includes sensitivity analysis using `leave1out()` for the pediatric aCL model.

- **Section 4: Overall Migraine Meta-Analysis (n=13 Studies)**  
  Conducts a meta-analysis of 13 studies on migraine and aPLs, producing a forest plot with a custom y-axis range.

- **Section 5: Subgroup Analysis - Adults vs Pediatrics (Overall)**  
  Generates forest plots for overall aPLs association in adults and pediatrics, comparing the two groups.

- **Section 6: Subgroup Analysis - Gender**  
  Creates forest plots for female and male subgroups, examining the association of aPLs with migraine by gender.

- **Section 7: Subgroup Analysis - Migraine with Aura**  
  Produces forest plots for migraine with aura (MwA), analyzing the association with aCL, B2GP1, LA, and overall aPLs.

- **Section 8: Subgroup Analysis - Migraine without Aura**  
  Generates forest plots for migraine without aura (MwoA), analyzing the association with aCL, B2GP1, LA, and overall aPLs.

- **Section 9: Diagnostic Plots (L'Abbe and Funnel Plots)**  
  Creates L'Abbe plots for aCL, B2GP1, and LA, and funnel plots for aCL (including a styled version and a trim-and-fill analysis). Outputs are saved as PDFs with dimensions 500x600 pixels for funnel plots.

- **Section 10: Publication Bias Tests (Egger's Test)**  
  Performs classical and random/mixed-effects Egger's tests to assess publication bias in the aCL meta-analysis.

## Getting Started

### Prerequisites
To run the script, you need:
- **R**: Version 3.0 or higher (script was developed in 2016, so compatible with older versions).
- **R Packages**:
  - `xlsx`: For reading Excel files.
  - `metafor`: For meta-analysis and visualization.
  - `RColorBrewer`: For color palettes in plots.
  Install these using the commands at the top of the script.
- **Java**: Required for the `xlsx` package. Alternatively, replace `xlsx` with `readxl` to avoid this dependency.
- **Excel Files**: The script references multiple Excel files (e.g., `R_Forest_aCL-only.xlsx`, `R_Forest_Plot_n=13.xlsx`). These are not included in the repository but can be requested (see [Contact](#contact)).

---

## License
This project is licensed under the [MIT License](https://github.com/kahkengwong/GAM_PRSS_REML_Project/blob/main/LICENSE), an open-source license to encourage collaboration and reuse, while ensuring proper attribution to the original author(s). For the full details, please refer to the [LICENSE](https://github.com/kahkengwong/GAM_PRSS_REML_Project/blob/main/LICENSE) file in this repository.


---

## Contributing
Contributions are welcome! Please open an issue or submit a pull request if you have suggestions or improvements.

---

## Contact
All analyses, modeling, and interpretations were conducted by KK Wong. For further information or questions, please email [kahkeng@usm.my](mailto:kahkeng@usm.my) or [kahkeng3@gmail.com](mailto:kahkeng3@gmail.com)

---

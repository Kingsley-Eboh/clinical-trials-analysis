![Platform](https://img.shields.io/badge/Platform-Python_3.12-blue)
![Platform](https://img.shields.io/badge/Platform-PostgreSQL_16-blue)
![Tool](https://img.shields.io/badge/Tool-Jupyter_Notebook-orange)
![Tool](https://img.shields.io/badge/Tool-Power_BI-yellow)
![Tool](https://img.shields.io/badge/Tool-SQL-orange)
![Domain](https://img.shields.io/badge/Domain-Healthcare_and_Life_Sciences-lightgrey)
![Data](https://img.shields.io/badge/Data-ClinicalTrials.gov_API-blue)
![Records](https://img.shields.io/badge/Records-50%2C000-blue)
![Analyses](https://img.shields.io/badge/Analyses-13-blue)
![SQL](https://img.shields.io/badge/SQL_Queries-10-orange)
![Dashboard](https://img.shields.io/badge/Dashboard-2_Pages-yellow)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)

# Clinical Trials Analysis
## Phase Completion Rates, Sponsor Performance and Recruitment Trends | January 2015 to December 2024

---

## Project Overview
This project examined 10 years of clinical trial activity across major pharmaceutical sponsors using 164,487 interventional trial records retrieved from the ClinicalTrials.gov API, representing the complete available population of interventional trials meeting the search criteria. The analysis covered all therapeutic areas with focus on oncology, cardiovascular, respiratory and vaccines, examining phase completion rates, 
sponsor performance profiles, recruitment trends and trial duration patterns across 2015 to 2024.

---

## Objectives
- Analyse the distribution of clinical trials across phases.
- Assess completion and termination rates by phase.
- Identify the most active sponsors and their performance profiles.
- Identify which therapeutic areas had the most trial activity.
- Track how trial activity changed over 10 years from 2015 to 2024.
- Measure average trial durations by phase and therapeutic area.
- Assess recruitment target sizes by phase and therapeutic area.
- Compare oncology, cardiovascular, respiratory and vaccine trial volumes.
- Identify which therapeutic areas had the highest termination rates.
- Analyse sponsor concentration by therapeutic area.
- Execute SQL analytical queries against a PostgreSQL database.
- Present key findings in an interactive Power BI dashboard.

---

## Data Source
| | |
|---|---|
| **Publisher** | ClinicalTrials.gov |
| **Dataset** | Interventional Clinical Trials Registry |
| **Access** | ClinicalTrials.gov API v2 |
| **Coverage** | January 2015 to December 2024 |
| **Records** | 164,487 interventional trial records |
| **Frequency** | Continuously updated |
| **Licence** | Public domain |

---

## Tools and Libraries
| Tool | Purpose |
|---|---|
| Python 3.12 | Core programming language |
| pandas | Data manipulation and transformation |
| numpy | Numerical calculations |
| matplotlib | Data visualisation |
| seaborn | Statistical visualisation and heatmaps |
| requests | ClinicalTrials.gov API data retrieval |
| SQLAlchemy | Python to PostgreSQL connection |
| psycopg2 | PostgreSQL database adapter |
| PostgreSQL 16 | Database storage and SQL analysis |
| Jupyter Lab | Interactive analysis environment |
| Power BI Desktop | Interactive dashboard |
| Git | Version control |

---

## Key Findings

### Dataset Overview
164,487 interventional clinical trial records were retrieved from the ClinicalTrials.gov API covering January 2015 to December 2024. The dataset covered 22,173 unique sponsors across 17 therapeutic areas. 78.1% of trials were completed, 8.9% were terminated, 4.9% were withdrawn and 8.1% were active but not recruiting. Academic sponsors accounted for 46.5% of all trial registrations and large pharmaceutical companies for 12.6%.

### Phase Distribution and Pipeline Structure
Phase 1 and Phase 2 trials accounted for 34.4% and 30.8% of phased trials respectively. The phase transition analysis identified Phase 2 to Phase 3 as the point of highest attrition with 54.8% of Phase 2 trials progressing to Phase 3. Phase 1 to Phase 2 transition was 89.5% and Phase 3 to Phase 4 was 85.4%. Phase 2 recorded the lowest completion rate at 61.7%, the only phase to fall below the overall average of 69.8%, and the highest termination rate at 16.5%.

### Trial Status and Completion
The overall completion rate was 78.1%. Phase 4 recorded the highest completion rate at 76.9% and Phase 2 the lowest at 61.7%. Phase 2 also recorded the highest termination rate at 16.5% and the highest withdrawal rate at 7.8%. These findings confirm Phase 2 as the most financially and operationally risky stage of the clinical development pipeline.

### Sponsor Activity
Cairo University was the most active sponsor with 1,277 registered trials followed by Riphah International University with 1,136 and Mayo Clinic with 1,039. Among pharmaceutical sponsors Pfizer registered 790 trials, AstraZeneca 754 and GlaxoSmithKline 680. The sponsor concentration analysis confirmed the following therapeutic area focus profiles. AstraZeneca registered 44.1% of its trials in oncology and 25.2% in respiratory. GlaxoSmithKline registered 36.8% in respiratory and 15.3% in vaccines. Pfizer registered 39.3% in oncology and 18.5% in vaccines. Eli Lilly registered 42.4% in metabolic and endocrine disease.

### Therapeutic Area Analysis
Oncology was the most active therapeutic area accounting for 14.0% of all trials and 23,100 records. Psychiatry and Mental Health was the second largest area with 11,147 trials, followed by Cardiovascular at 9,068. Oncology recorded the highest termination rate at 17.7% and the highest overall attrition rate at 25.1%. Oral Health recorded the lowest termination rate at 2.3% and Healthy Volunteer Studies the lowest attrition rate at 5.4%.

### Trial Duration
Phase 2 trials recorded the longest average duration at 31.2 months followed by Phase 3 at 29.8 months. Phase 1 trials recorded the shortest average duration at 20.4 months. Median durations were consistently lower than mean durations across all phases, with Phase 1 median at 12.4 months compared to a mean of 20.4 months, indicating a right-skewed distribution driven by a small number of very long trials.

### Trial Activity Trend
Trial registrations increased from 5,660 in 2015 to a peak of 18,748 in 2021, a 231% increase over six years. Registrations declined in each of the three subsequent years, falling to 12,047 in 2024, a 20.6% year on year decline. Vaccine trial registrations surged from 123 in 2015 to 1,254 in 2020 driven by pandemic response activity. Oncology remained the dominant therapeutic area throughout the decade but recorded a consistent decline from 2018 onward.

### Enrollment
Phase 3 trials recorded the largest average enrollment at 358 participants with outliers excluded. Vaccines recorded the highest average enrollment by therapeutic area at 276 participants followed by Infectious Disease at 258 and Obstetrics and Gynaecology at 213. Total planned enrollment across all 164,487 trials was 113,499,343 participants. Median enrollment across all trials was 50 participants, significantly below the mean of 690, reflecting the dominance of small Phase 1 and Phase 2 trials in the dataset.


## Business Recommendations
The following recommendations are drawn directly from the analytical findings and are intended to support strategic decision-making across pharmaceutical sponsors, clinical research organisations and regulatory bodies. Each recommendation is grounded in evidence from the full 164,487 record dataset.

### 1. Address Phase 2 to Phase 3 Attrition as a Strategic Priority
The analysis identified Phase 2 to Phase 3 as the point of highest pipeline attrition, with only 54.8% of Phase 2 trials progressing to Phase 3. Phase 2 also recorded the lowest completion rate at 61.7% and 
the highest termination rate at 16.5%, confirming it as the most operationally and financially risky stage of clinical development. Sponsors should invest in more rigorous Phase 2 endpoint design and earlier biomarker validation to improve the quality of go or no-go decisions before committing to the significantly higher cost of Phase 3 development.

### 2. Investigate the Post-2021 Registration Decline
Trial registrations peaked at 18,748 in 2021 and declined by 20.6% in 2024 alone. This sustained multi-year decline warrants investigation. Possible drivers include the winding down of pandemic-related trial activity, increased regulatory scrutiny, sponsor consolidation or a shift toward larger but fewer trials. Sponsors and regulators should assess whether this trend reflects a structural contraction in pipeline activity or a temporary correction following the pandemic-era surge.

### 3. Review Oncology Trial Portfolio Strategy
Oncology accounted for 14.0% of all trials yet recorded the highest termination rate at 17.7% and the highest overall attrition rate at 25.1%. For sponsors with a heavy oncology concentration, such as M.D. Anderson Cancer Center concentrating 93.5% of its trials in oncology and AstraZeneca at 44.1%, this represents a significant capital allocation risk. A structured portfolio review should assess whether the termination rate reflects scientific failure, competitive withdrawal or regulatory challenges, and whether rebalancing toward therapeutic areas with lower attrition rates would improve overall pipeline efficiency.

### 4. Address the Psychiatry and Mental Health Pipeline Gap
Psychiatry and Mental Health was the second largest therapeutic area with 11,147 trials, yet recorded a relatively low termination rate of 6.8% and an attrition rate of 11.1%, among the lowest in the dataset. This combination of high volume and low attrition suggests a productive and underinvested area of clinical activity. Sponsors and investors should consider whether current resource allocation reflects the scale of unmet need in mental health relative to the investment flowing into oncology.

### 5. Reassess Vaccine Trial Infrastructure Post-2021
Vaccine trial registrations surged from 123 in 2015 to 1,254 in 2020 driven by pandemic response activity, before declining sharply to 194 in 2024. Sponsors and public health agencies should assess whether the trial infrastructure and regulatory pathways developed during the pandemic can be repurposed to accelerate development in other infectious disease and preventative medicine areas, rather than allowing this capacity to atrophy.

### 6. Address Recruitment Planning for Large Scale Trials
Phase 3 trials recorded the largest average enrollment at 358 participants and Vaccines the highest by therapeutic area at 276, with total planned enrollment across the dataset exceeding 113 million participants. The median enrollment of 50 participants versus a mean of 690 confirms that a small number of very large trials dominate total enrollment targets. Sponsors should invest in adaptive recruitment strategies, decentralised trial models and patient registry partnerships to reduce the risk of enrollment shortfalls in large scale trials.

---

## Analyses
| Analysis | Description |
|---|---|
| 1 | Trial distribution by phase |
| 2 | Trial status distribution |
| 3 | Trial distribution by therapeutic area |
| 4 | Completion and termination rates by phase |
| 5 | Top 20 most active sponsors |
| 6 | Trial activity trend by year 2015 to 2024 |
| 7 | Average trial duration by phase |
| 8 | Enrollment size by phase and therapeutic area |
| 9 | Termination rates by therapeutic area |
| 10 | Phase transition funnel |
| 11 | Sponsor concentration by therapeutic area |
| 12 | Therapeutic area trend over 10 years |
| 13 | Summary scorecard |

---

## SQL Queries
| Query | Description |
|---|---|
| 1 | Total trials and status distribution |
| 2 | Completion and termination rates by phase |
| 3 | Top 20 most active sponsors |
| 4 | Sponsor completion rates minimum 10 trials |
| 5 | Trial distribution by therapeutic area |
| 6 | Termination and attrition rates by therapeutic area |
| 7 | Average trial duration by phase |
| 8 | Annual trial registration trend |
| 9 | Phase transition analysis using LAG window function |
| 10 | Comprehensive summary scorecard |

---

## How to Run

### Prerequisites
- Python 3.8 or higher
- PostgreSQL 14 or higher
- Power BI Desktop — powerbi.microsoft.com/desktop
- Jupyter Lab

### 1. Clone the Repository
```bash
git clone git@github.com:Kingsley-Eboh/clinical-trials-analysis.git
cd clinical-trials-analysis
```

### 2. Install Dependencies
```bash
pip install pandas numpy matplotlib seaborn requests sqlalchemy psycopg2-binary jupyter
```

### 3. Set Up PostgreSQL
Create a local PostgreSQL database named clinical_trials. Update the connection string in the Section 6 database load cell with your credentials before running.

### 4. Run the Notebook
Launch Jupyter Lab and open clinical_trials_analysis.ipynb:
```bash
jupyter lab
```
Select Kernel then Restart and Run All Cells to execute all cells in sequence.

### 5. Run the SQL Queries
Once the database is populated execute the analytical queries:
```bash
psql -U your_user -d clinical_trials -h localhost -f sql/clinical_trials_queries.sql
```

### 6. Open the Power BI Dashboard
Open powerbi/clinical_trials_dashboard.pbix in Power BI Desktop and update the CSV file paths to point to your local powerbi folder when prompted.

---

## Evidence

### Analysis 1 — Trial Distribution by Phase
[![analysis1](figures/analysis1_trial_distribution_by_phase.png)](figures/analysis1_trial_distribution_by_phase.png)

### Analysis 2 — Trial Status Distribution
[![analysis2](figures/analysis2_trial_status_distribution.png)](figures/analysis2_trial_status_distribution.png)

### Analysis 3 — Trial Distribution by Therapeutic Area
[![analysis3](figures/analysis3_trial_distribution_by_therapeutic_area.png)](figures/analysis3_trial_distribution_by_therapeutic_area.png)

### Analysis 4 — Completion and Termination Rates by Phase
[![analysis4](figures/analysis4_completion_termination_by_phase.png)](figures/analysis4_completion_termination_by_phase.png)

### Analysis 5 — Top 20 Most Active Sponsors
[![analysis5](figures/analysis5_top_sponsors.png)](figures/analysis5_top_sponsors.png)

### Analysis 6 — Trial Activity Trend by Year
[![analysis6](figures/analysis6_trial_activity_trend.png)](figures/analysis6_trial_activity_trend.png)

### Analysis 7 — Average Trial Duration by Phase
[![analysis7](figures/analysis7_trial_duration_by_phase.png)](figures/analysis7_trial_duration_by_phase.png)

### Analysis 8 — Enrollment Size by Phase and Therapeutic Area
[![analysis8](figures/analysis8_enrollment_by_phase_therapeutic_area.png)](figures/analysis8_enrollment_by_phase_therapeutic_area.png)

### Analysis 9 — Termination Rates by Therapeutic Area
[![analysis9](figures/analysis9_termination_by_therapeutic_area.png)](figures/analysis9_termination_by_therapeutic_area.png)

### Analysis 10 — Phase Transition Funnel
[![analysis10](figures/analysis10_phase_transition_funnel.png)](figures/analysis10_phase_transition_funnel.png)

### Analysis 11 — Sponsor Concentration by Therapeutic Area
[![analysis11](figures/analysis11_sponsor_therapeutic_area_concentration.png)](figures/analysis11_sponsor_therapeutic_area_concentration.png)

### Analysis 12 — Therapeutic Area Trend Over 10 Years
[![analysis12](figures/analysis12_therapeutic_area_trend.png)](figures/analysis12_therapeutic_area_trend.png)

### Analysis 13 — Summary Scorecard
[![analysis13](figures/analysis13_summary_scorecard.png)](figures/analysis13_summary_scorecard.png)

### Power BI Dashboard — Page 1 — Pipeline and Phase Analysis
[![dashboard_p1](powerbi/dashboard_page1_pipeline_phase_analysis.png)](powerbi/dashboard_page1_pipeline_phase_analysis.png)

### Power BI Dashboard — Page 2 — Sponsor and Therapeutic Area Analysis
[![dashboard_p2](powerbi/dashboard_page2_sponsor_therapeutic_area.png)](powerbi/dashboard_page2_sponsor_therapeutic_area.png)

---

## Project Structure
```
clinical-trials-analysis/
├── clinical_trials_analysis.ipynb
├── figures/
│   ├── analysis01_trial_distribution_by_phase.png
│   ├── analysis02_trial_status_distribution.png
│   ├── analysis03_trial_distribution_by_therapeutic_area.png
│   ├── analysis04_completion_termination_by_phase.png
│   ├── analysis05_top_sponsors.png
│   ├── analysis06_trial_activity_trend.png
│   ├── analysis07_trial_duration_by_phase.png
│   ├── analysis08_enrollment_by_phase_therapeutic_area.png
│   ├── analysis09_termination_by_therapeutic_area.png
│   ├── analysis10_phase_transition_funnel.png
│   ├── analysis11_sponsor_therapeutic_area_concentration.png
│   ├── analysis12_therapeutic_area_trend.png
│   └── analysis13_summary_scorecard.png
├── sql/
│   └── clinical_trials_queries.sql
├── powerbi/
│   ├── clinical_trials_dashboard.pbix
│   ├── phase_summary.csv
│   ├── sponsor_summary.csv
│   ├── therapeutic_area_summary.csv
│   └── annual_summary.csv
├── .gitignore
└── README.md
```

---

## Author
**Kingsley Eboh**
[GitHub](https://github.com/Kingsley-Eboh)

*Data sourced from ClinicalTrials.gov via the public API. This project is intended for portfolio and educational purposes.*

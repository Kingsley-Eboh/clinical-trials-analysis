
-- ============================================================
-- Clinical Trials Analysis: SQL Queries
-- Author: Kingsley Eboh
-- Dataset: ClinicalTrials.gov 2015 to 2024
-- Database: PostgreSQL 16
-- Table: clinical_trials
-- ============================================================

-- Query 1: Total Trials and Status Distribution
SELECT
    status_label,
    COUNT(*) as total_trials,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) as percentage
FROM clinical_trials
GROUP BY status_label
ORDER BY total_trials DESC;

-- Query 2: Completion and Termination Rates by Phase
SELECT
    phase_label,
    COUNT(*) as total_trials,
    SUM(CASE WHEN status_label = 'Completed' THEN 1 ELSE 0 END) as completed,
    SUM(CASE WHEN status_label = 'Terminated' THEN 1 ELSE 0 END) as terminated,
    ROUND(SUM(CASE WHEN status_label = 'Completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as completion_rate,
    ROUND(SUM(CASE WHEN status_label = 'Terminated' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as termination_rate
FROM clinical_trials
WHERE phase_label != 'Not Applicable'
GROUP BY phase_label
ORDER BY completion_rate DESC;

-- Query 3: Top 20 Most Active Sponsors
SELECT
    sponsor,
    COUNT(*) as total_trials,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) as percentage
FROM clinical_trials
GROUP BY sponsor
ORDER BY total_trials DESC
LIMIT 20;

-- Query 4: Sponsor Completion Rates Minimum 10 Trials
SELECT
    sponsor,
    COUNT(*) as total_trials,
    SUM(CASE WHEN status_label = 'Completed' THEN 1 ELSE 0 END) as completed,
    ROUND(SUM(CASE WHEN status_label = 'Completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as completion_rate
FROM clinical_trials
GROUP BY sponsor
HAVING COUNT(*) >= 10
ORDER BY completion_rate DESC
LIMIT 20;

-- Query 5: Trial Distribution by Therapeutic Area
SELECT
    therapeutic_area,
    COUNT(*) as total_trials,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) as percentage
FROM clinical_trials
WHERE therapeutic_area != 'Other'
GROUP BY therapeutic_area
ORDER BY total_trials DESC;

-- Query 6: Termination and Attrition Rates by Therapeutic Area
SELECT
    therapeutic_area,
    COUNT(*) as total_trials,
    SUM(CASE WHEN status_label = 'Terminated' THEN 1 ELSE 0 END) as terminated,
    SUM(CASE WHEN status_label = 'Withdrawn' THEN 1 ELSE 0 END) as withdrawn,
    ROUND(SUM(CASE WHEN status_label = 'Terminated' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as termination_rate,
    ROUND((SUM(CASE WHEN status_label = 'Terminated' THEN 1 ELSE 0 END) +
           SUM(CASE WHEN status_label = 'Withdrawn' THEN 1 ELSE 0 END)) * 100.0 / COUNT(*), 2) as attrition_rate
FROM clinical_trials
WHERE therapeutic_area != 'Other'
GROUP BY therapeutic_area
ORDER BY termination_rate DESC;

-- Query 7: Average Trial Duration by Phase
SELECT
    phase_label,
    COUNT(*) as total_trials,
    ROUND(AVG(duration_months)::NUMERIC, 1) as avg_duration_months,
    ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (
        ORDER BY duration_months)::NUMERIC, 1) as median_duration_months,
    ROUND(MIN(duration_months)::NUMERIC, 1) as min_duration_months,
    ROUND(MAX(duration_months)::NUMERIC, 1) as max_duration_months
FROM clinical_trials
WHERE phase_label != 'Not Applicable'
AND status_label = 'Completed'
AND duration_months IS NOT NULL
AND duration_months > 0
GROUP BY phase_label
ORDER BY avg_duration_months DESC;

-- Query 8: Annual Trial Registration Trend
SELECT
    start_year,
    COUNT(*) as total_trials,
    SUM(CASE WHEN status_label = 'Completed' THEN 1 ELSE 0 END) as completed,
    SUM(CASE WHEN status_label = 'Terminated' THEN 1 ELSE 0 END) as terminated,
    ROUND(SUM(CASE WHEN status_label = 'Completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as completion_rate
FROM clinical_trials
WHERE start_year IS NOT NULL
GROUP BY start_year
ORDER BY start_year;

-- Query 9: Phase Transition Analysis
WITH phase_counts AS (
    SELECT
        phase_label,
        COUNT(*) as total_trials,
        SUM(CASE WHEN status_label = 'Completed' THEN 1 ELSE 0 END) as completed
    FROM clinical_trials
    WHERE phase_label IN ('Phase 1', 'Phase 2', 'Phase 3', 'Phase 4')
    GROUP BY phase_label
)
SELECT
    phase_label,
    total_trials,
    completed,
    ROUND(completed * 100.0 / total_trials, 2) as completion_rate,
    LAG(total_trials) OVER (ORDER BY
        CASE phase_label
            WHEN 'Phase 1' THEN 1
            WHEN 'Phase 2' THEN 2
            WHEN 'Phase 3' THEN 3
            WHEN 'Phase 4' THEN 4
        END) as previous_phase_trials,
    ROUND(total_trials * 100.0 /
        NULLIF(LAG(total_trials) OVER (ORDER BY
            CASE phase_label
                WHEN 'Phase 1' THEN 1
                WHEN 'Phase 2' THEN 2
                WHEN 'Phase 3' THEN 3
                WHEN 'Phase 4' THEN 4
            END), 0), 2) as transition_rate
FROM phase_counts
ORDER BY
    CASE phase_label
        WHEN 'Phase 1' THEN 1
        WHEN 'Phase 2' THEN 2
        WHEN 'Phase 3' THEN 3
        WHEN 'Phase 4' THEN 4
    END;

-- Query 10: Comprehensive Summary Scorecard
SELECT
    COUNT(*) as total_trials,
    SUM(CASE WHEN status_label = 'Completed' THEN 1 ELSE 0 END) as completed_trials,
    ROUND(SUM(CASE WHEN status_label = 'Completed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as completion_rate,
    SUM(CASE WHEN status_label = 'Terminated' THEN 1 ELSE 0 END) as terminated_trials,
    ROUND(SUM(CASE WHEN status_label = 'Terminated' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as termination_rate,
    SUM(CASE WHEN status_label = 'Withdrawn' THEN 1 ELSE 0 END) as withdrawn_trials,
    ROUND(SUM(CASE WHEN status_label = 'Withdrawn' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) as withdrawal_rate,
    COUNT(DISTINCT sponsor) as unique_sponsors,
    ROUND(AVG(duration_months)::NUMERIC, 1) as avg_duration_months,
    ROUND(AVG(enrollment)::NUMERIC, 0) as avg_enrollment,
    SUM(enrollment) as total_planned_participants
FROM clinical_trials;

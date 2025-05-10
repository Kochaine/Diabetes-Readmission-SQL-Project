-- Checking for missing or invalid values
SELECT  
  SUM(race = '?' OR race IS NULL) AS race_mistake,
  SUM(gender = '?' OR gender IS NULL) AS gender_mistake,
  SUM(age = '?' OR age IS NULL) AS age_mistake,
  SUM(weight = '?' OR weight IS NULL) AS weight_mistake,
  SUM(admission_type_id = '?' OR admission_type_id IS NULL) AS admission_type_id_mistake,
  SUM(discharge_disposition_id = '?' OR discharge_disposition_id IS NULL) AS discharge_disposition_id_mistake,
  SUM(admission_source_id = '?' OR admission_source_id IS NULL) AS admission_source_id_mistake
FROM diabetic_data;

-- Check for duplicates
SELECT encounter_id, COUNT(*) AS duplicates_count
FROM diabetic_data
GROUP BY encounter_id
HAVING COUNT(*) > 1;

-- Checking unique values
SELECT DISTINCT race FROM diabetic_data;
SELECT DISTINCT gender FROM diabetic_data;
SELECT DISTINCT age FROM diabetic_data;
SELECT DISTINCT weight FROM diabetic_data;
SELECT DISTINCT readmitted FROM diabetic_data;

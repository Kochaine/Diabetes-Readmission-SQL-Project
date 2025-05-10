-- Readmission counts
SELECT readmitted, COUNT(*) AS total_patients_back
FROM diabetic_data
GROUP BY readmitted
ORDER BY total_patients_back DESC;

-- Readmission by age
SELECT age, readmitted, COUNT(*) AS total_patients_back
FROM diabetic_data
GROUP BY age, readmitted
ORDER BY age, readmitted DESC;

-- Readmission vs medications
SELECT readmitted, ROUND(AVG(num_medications), 1) AS avg_meds
FROM diabetic_data
GROUP BY readmitted;

-- Medication change
SELECT `change`, COUNT(*) AS total_patients, ROUND(AVG(num_medications), 2) AS avg_meds
FROM diabetic_data
GROUP BY `change`;

-- Discharge outcomes
SELECT discharge_disposition_id, COUNT(*) AS patient_count
FROM diabetic_data
GROUP BY discharge_disposition_id
ORDER BY patient_count DESC;

-- Readmission vs length of stay
SELECT readmitted, ROUND(AVG(time_in_hospital), 2) AS avg_stay_days
FROM diabetic_data
GROUP BY readmitted;

-- Age vs length of stay
SELECT age, ROUND(AVG(time_in_hospital), 2) AS avg_stay
FROM diabetic_data
GROUP BY age
ORDER BY age;

-- High-risk patient profiles
SELECT 
  age,
  readmitted,
  `change` AS med_changed,
  discharge_disposition_id,
  ROUND(AVG(time_in_hospital), 2) AS avg_stay,
  ROUND(AVG(num_medications), 2) AS avg_meds,
  COUNT(*) AS total_patients
FROM diabetic_data
GROUP BY age, readmitted, med_changed, discharge_disposition_id
ORDER BY total_patients DESC;

-- Standardizing 'readmitted'
UPDATE diabetic_data SET readmitted = 'No Readmission back' WHERE readmitted = 'NO';
UPDATE diabetic_data SET readmitted = 'Readmitted within 30 days' WHERE readmitted = '<30';
UPDATE diabetic_data SET readmitted = 'Readmitted after 30 days' WHERE readmitted = '>30';

-- Standardizing 'change'
UPDATE diabetic_data
SET `change` = CASE 
  WHEN `change` = 'No' THEN 'NO'
  WHEN `change` = 'Ch' THEN 'CHANGE'
  ELSE NULL
END;

-- Standardizing 'race'
UPDATE diabetic_data
SET race = CASE
  WHEN race = 'AfricanAmerican' THEN 'AFRICAN AMERICAN'
  WHEN race = 'Other' THEN 'OTHER'
  WHEN race = 'Asian' THEN 'ASIAN'
  WHEN race = 'Hispanic' THEN 'HISPANIC'
  WHEN race = 'Caucasian' THEN 'CAUCASIAN'
  ELSE NULL
END;

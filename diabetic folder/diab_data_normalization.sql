-- Create lookup table for admission_type_id
CREATE TABLE admission_type_lookup (
  admission_type_id INT PRIMARY KEY,
  admission_type_desc VARCHAR(100)
);

INSERT INTO admission_type_lookup (admission_type_id, admission_type_desc)
VALUES
(1, 'Emergency'),
(2, 'Urgent'),
(3, 'Elective'),
(4, 'Newborn'),
(5, 'Not Available'),
(6, 'NULL'),
(7, 'Trauma Center'),
(8, 'Not Mapped');

-- Join to get descriptive admission types
SELECT dd.admission_type_id, atl.admission_type_desc
FROM diabetic_data AS dd
JOIN admission_type_lookup AS atl
ON dd.admission_type_id = atl.admission_type_id;

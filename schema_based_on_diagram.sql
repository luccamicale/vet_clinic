CREATE TABLE patients (
  id GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50),
  date_of_birth DATE,
  PRIMARY KEY(id)
);

CREATE TABLE medical_histories(id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
admitted_at time, patient_id INT, 
CONSTRAINT patient_hist FOREIGN KEY (patient_id) REFERENCES patients(id), status VARCHAR(50));

CREATE TABLE invoices (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
total_amount decimal, generated_at time, payed_at time, 
medical_history_id INT, CONSTRAINT invoice_hist FOREIGN KEY (medical_history_id) 
REFERENCES medical_histories (id));


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



/*  treatments table */
CREATE TABLE treatments (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
type VARCHAR(100), name VARCHAR(100));


/* invoce_items table */
CREATE TABLE invoice_items (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
unit_price DECIMAL, quantity INT, total_price DECIMAL, 
invoice_id INT, treatment_id INT, 
CONSTRAINT invoice_item FOREIGN KEY (treatment_id) REFERENCES treatments (id));
ERROR:  relation "treatments" does not exist

/*  Many to many relation table between treatments and medical_histories table */
CREATE TABLE medical_histories_treatments(medical_history_id INT, 
treatment_id INT, CONSTRAINT HIST_TREAT 
FOREIGN KEY(medical_history_id ) REFERENCES medical_histories(id), 
CONSTRAINT treat_hist FOREIGN KEY (treatment_id) REFERENCES treatments(id));

/* Create Index */
CREATE INDEX ON patients(id);
CREATE INDEX ON medical_histories(id);
CREATE INDEX ON invoices(id);
CREATE INDEX ON treatments(id);

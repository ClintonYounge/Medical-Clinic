CREATE TABLE patients (
    id INT,
    name VARCHAR,
    date_of_birth DATE,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
    id INT,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR,
    PRIMARY KEY (id)
);

CREATE TABLE treatments (
    id INT,
    type VARCHAR,
    name VARCHAR,
    PRIMARY KEY (id)
);

CREATE TABLE medical_history_treatments (
  medical_history_id INT,
  treatment_id INT,
  PRIMARY KEY (medical_history_id, treatment_id)
);

CREATE TABLE invoice_items (
    id INT,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    PRIMARY KEY (id)
);

CREATE TABLE invoices (
    id INT,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    PRIMARY KEY (id)
);

-- Add relationships

-- Alter medical_histories table to make patient_id a foreign key
ALTER TABLE medical_histories
DROP COLUMN patient_id,
ADD COLUMN patient_id INTEGER UNIQUE REFERENCES patients(id);

-- Alter medical_history_treatments table to make medical_history_id and treatment_id foreign keys
ALTER TABLE medical_history_treatments
DROP COLUMN medical_history_id,
DROP COLUMN treatment_id,
ADD COLUMN medical_history_id INTEGER REFERENCES medical_histories(id),
ADD COLUMN treatment_id INTEGER REFERENCES treatments(id);

-- Alter invoice_items table to make invoice_id and treatment_id foreign keys
ALTER TABLE invoice_items
DROP COLUMN invoice_id,
DROP COLUMN treatment_id,
ADD COLUMN invoice_id INTEGER REFERENCES invoices(id),
ADD COLUMN treatment_id INTEGER REFERENCES treatments(id);

-- Alter invoices table to make medical_history_id a foreign key
ALTER TABLE invoices
DROP COLUMN medical_history_id,
ADD COLUMN medical_history_id INTEGER UNIQUE REFERENCES medical_histories(id);


-- Add indexes
CREATE INDEX idx_medical_history_treatments_medical_history_id ON medical_history_treatments (medical_history_id);
CREATE INDEX idx_medical_history_treatments_treatment_id ON medical_history_treatments (treatment_id);

CREATE INDEX idx_invoice_items_invoice_id ON invoice_items (invoice_id);
CREATE INDEX idx_invoice_items_treatment_id ON invoice_items (treatment_id);

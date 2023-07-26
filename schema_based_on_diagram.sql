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

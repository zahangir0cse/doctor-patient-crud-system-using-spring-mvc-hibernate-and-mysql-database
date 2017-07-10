
package com.zahangir.service;

import com.zahangir.model.Patient;

public interface PatientService {
    void addPatient(Patient p);
    void removePatientById(int id);
}

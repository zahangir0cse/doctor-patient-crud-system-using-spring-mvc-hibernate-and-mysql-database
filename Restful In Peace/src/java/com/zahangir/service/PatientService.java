
package com.zahangir.service;

import com.zahangir.model.Patient;
import java.util.List;

public interface PatientService {
    void addPatient(Patient p);
    void removePatientById(int id);
    List<Patient> patientList();
    Patient getPatientById(int id);
}

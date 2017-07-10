
package com.zahangir.service;

import com.zahangir.model.Patient;
import java.util.List;

public interface PatientService {
    void addPatient(Patient p);
    void removePatientById(int id);
    void updatePatient(Patient patient);
    List<Patient> patientList();
}

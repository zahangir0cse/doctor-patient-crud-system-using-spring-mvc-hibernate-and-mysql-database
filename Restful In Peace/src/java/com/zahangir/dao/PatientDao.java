
package com.zahangir.dao;

import com.zahangir.model.Patient;
import java.util.List;

public interface PatientDao {
    void addPatient(Patient p);
    void removePatientById(int id);
    void updatePatient(Patient patient);
    List<Patient> patientList();
}

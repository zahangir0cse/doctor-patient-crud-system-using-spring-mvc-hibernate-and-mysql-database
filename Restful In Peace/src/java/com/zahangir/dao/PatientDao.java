
package com.zahangir.dao;

import com.zahangir.model.Patient;
import java.util.List;

public interface PatientDao {
    void addPatient(Patient p);
    void removePatientById(int id);
    List<Patient> patientList();
    Patient getPatientById(int id);
}


package com.zahangir.dao;

import com.zahangir.model.Patient;

public interface PatientDao {
    void addPatient(Patient p);
    void removePatientById(int id);
    
}

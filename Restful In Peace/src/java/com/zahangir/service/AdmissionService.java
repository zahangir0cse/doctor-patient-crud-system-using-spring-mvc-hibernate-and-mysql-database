
package com.zahangir.service;

import com.zahangir.model.Admission;

public interface AdmissionService {
    void addAdmission(Admission admission);
    void removeAdmissionById(int id);
}

package com.syndic.dao;

import com.syndic.beans.Supplier;

import java.util.List;

public interface SupplierDAO {

    List<Supplier> getAllSuppliers();

    boolean insertSupplier(Supplier supplier);

    boolean updateSupplier(Supplier supplier);

    boolean deleteSupplier(int supplier_id);
}

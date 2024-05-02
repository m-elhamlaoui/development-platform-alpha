package com.syndic.dao;

import com.syndic.beans.Payment;

import java.util.List;

public interface PaymentDAO {
    List<Payment> getAllPayments();

    boolean insertPayment(Payment payment);

    boolean updatePayment(Payment payment);

    boolean deletePayment(String code);
}

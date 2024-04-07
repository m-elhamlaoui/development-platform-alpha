package com.syndic.dao;

import com.syndic.beans.Paiement;

import java.util.List;

public interface PaiementDAO {
    List<Paiement> getPaiementsByUserId(int userId);
}

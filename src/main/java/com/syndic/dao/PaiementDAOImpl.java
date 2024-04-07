package com.syndic.dao;

import com.syndic.beans.Paiement;
import com.syndic.connection.Syndic_con;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaiementDAOImpl implements PaiementDAO {

    private final Connection connection;

    public PaiementDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public List<Paiement> getPaiementsByUserId(int userId) {
        List<Paiement> paiements = new ArrayList<>();
        String query = "SELECT * FROM paiement WHERE id_user = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Paiement paiement = new Paiement();
                paiement.setIdPaiement(resultSet.getInt("id_paiement"));
                paiement.setMois(resultSet.getString("mois"));
                paiement.setPaye(resultSet.getBoolean("paye"));
                paiement.setIdUser(resultSet.getInt("id_user"));
                paiements.add(paiement);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return paiements;
    }
}

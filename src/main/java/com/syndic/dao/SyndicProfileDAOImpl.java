package com.syndic.dao;


import com.syndic.beans.Member;
import com.syndic.beans.Syndic;
import com.syndic.beans.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SyndicProfileDAOImpl implements SyndicProfileDAO {
    private final Connection connection;

    public SyndicProfileDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public void addSyndic(Syndic syndic) throws SQLException {

        String query = "INSERT INTO syndics (s_fulladdress, s_iduser) VALUES (?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, syndic.getFulladdress());
            preparedStatement.setInt(2, syndic.getUserId());
            preparedStatement.executeUpdate();
        }
    }


    //a redefinir
    @Override
    public User getProfileUserById(int userId) throws SQLException {
        User profileUser = null;
        String query = "SELECT * FROM users WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, userId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    profileUser = new User();
                    profileUser.setName(resultSet.getString("u_name"));
                    profileUser.setEmail(resultSet.getString("u_email"));
                    profileUser.setApartmentNumber(resultSet.getString("u_apartment_number"));
                    profileUser.setBuildingNumber(resultSet.getString("u_building_number"));
                }
            }
        }
        return profileUser;
    }

    @Override
    public Syndic getSyndicByUserId(int userId) throws SQLException {
        String query = "SELECT * FROM syndics WHERE s_iduser = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, userId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int id = resultSet.getInt("s_id");
                    String firstName = resultSet.getString("s_firstname");
                    String lastName = resultSet.getString("s_lastname");
                    String fulladdress = resultSet.getString("s_fulladdress");
                    String codepostal = resultSet.getString("s_codepostal");
                    String phoneNumber = resultSet.getString("s_phonenumber");
                    String mail = resultSet.getString("s_mail");
                    return new Syndic ( id, firstName, lastName, fulladdress, codepostal, phoneNumber, mail, userId);
                }
            }
        }
        return null; // Retourne null si aucun membre n'est trouvé avec cet identifiant utilisateur.
    }

}



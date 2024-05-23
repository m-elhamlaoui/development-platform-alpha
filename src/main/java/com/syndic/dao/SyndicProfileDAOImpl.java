package com.syndic.dao;

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

        String query = "INSERT INTO syndics (s_fulladdress, s_iduser , residence_name) VALUES (?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, syndic.getFulladdress());
            preparedStatement.setInt(2, syndic.getUserId());
            preparedStatement.setString(3, syndic.getResidenceName());
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public void updateSyndic(Syndic syndic) throws SQLException {
        String query = "UPDATE syndics SET s_firstname = ?,   s_lastname = ?,    s_codepostal = ?,    s_phonenumber = ?,    s_fulladdress  = ?,   s_mail  = ? WHERE  s_iduser = ? ";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, syndic.getFirstName());
            preparedStatement.setString(2, syndic.getLastName());
            preparedStatement.setString(3, syndic.getCodepostal());
            preparedStatement.setString(4, syndic.getPhoneNumber());
            preparedStatement.setString(5, syndic.getFulladdress());
            preparedStatement.setString(6, syndic.getMail());
            preparedStatement.setInt(7, syndic.getUserId());
            preparedStatement.executeUpdate();
        }
    }

        @Override
        public void updateSyndic2(Syndic syndic) throws SQLException {
            String query = "UPDATE syndics SET s_firstname = ?, s_lastname = ?, s_codepostal = ?, s_phonenumber = ?, s_fulladdress = ?, s_mail = ?, residence_name = ?, residence_address = ?, residence_type = ?, residence_size = ?, apartment_count = ?, villa_count = ?, garden_count = ?, pool_count = ?, parking_count = ?, elevators_count = ?, security_system = ? WHERE s_iduser = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, syndic.getFirstName());
                preparedStatement.setString(2, syndic.getLastName());
                preparedStatement.setString(3, syndic.getCodepostal());
                preparedStatement.setString(4, syndic.getPhoneNumber());
                preparedStatement.setString(5, syndic.getFulladdress());
                preparedStatement.setString(6, syndic.getMail());
                preparedStatement.setString(7, syndic.getResidenceName());
                preparedStatement.setString(8, syndic.getResidenceAddress());
                preparedStatement.setString(9, syndic.getResidenceType());
                preparedStatement.setInt(10, syndic.getResidenceSize());
                preparedStatement.setInt(11, syndic.getApartmentCount());
                preparedStatement.setInt(12, syndic.getVillaCount());
                preparedStatement.setInt(13, syndic.getGardenCount());
                preparedStatement.setInt(14, syndic.getPoolCount());
                preparedStatement.setInt(15, syndic.getParkingCount());
                preparedStatement.setInt(16, syndic.getElevatorsCount());
                preparedStatement.setBoolean(17, syndic.isSecuritySystem());
                preparedStatement.setInt(18, syndic.getUserId());
                preparedStatement.executeUpdate();
            }
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
        return null; // Retourne null si aucun synd n'est trouvé avec cet identifiant utilisateur.
    }
    @Override
    public int getSyndicIdByUserId(int userId) throws SQLException {
        String sql = "SELECT s_id FROM syndics WHERE s_iduser = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("s_id");
                } else {
                    throw new SQLException("Syndic not found for user id: " + userId);
                }
            }
        }
    }

    @Override
    public Syndic getSyndicByresidence(String residence) throws SQLException {
        String query = "SELECT s_id FROM syndics WHERE residence_name = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, residence);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int id = resultSet.getInt("s_id");

                    Syndic syndic = new Syndic();
                    syndic.setId(id);
                    return  syndic ;
                }
            }
        }
        return null; // Retourne null si aucun synd n'est trouvé avec cet identifiant utilisateur.
    }

}



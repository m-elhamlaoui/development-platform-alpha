package com.syndic.dao;

import com.syndic.beans.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProfileUserDAOImpl implements ProfileUserDAO {
    private final Connection connection;

    public ProfileUserDAOImpl(Connection connection) {
        this.connection = connection;
    }

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
    public void updateProfile(User user) throws SQLException {
        String query = "UPDATE users SET u_phone_number = ?, u_apartment_number = ?, u_building_number = ? WHERE id = ?";
        System.out.println("id "+user.getId_user());
        System.out.println("user "+user);
        System.out.println("user "+user.getApartmentNumber());
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            System.out.println("query"+preparedStatement);
            preparedStatement.setString(1, user.getPhoneNumber());
            preparedStatement.setString(2, user.getApartmentNumber());
            preparedStatement.setString(3, user.getBuildingNumber());
            preparedStatement.setInt(4, user.getIdUser());
            preparedStatement.executeUpdate();
        }
    }
}

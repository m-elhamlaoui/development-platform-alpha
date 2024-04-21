package com.syndic.dao;

import com.syndic.beans.Member;
import com.syndic.beans.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberProfileDAOImpl implements MemberProfileDAO {
    private final Connection connection;

    public MemberProfileDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public void addMember(Member member) throws SQLException {

        String query = "INSERT INTO member (m_fulladdress, iduser) VALUES (?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, member.getFulladdress());
            preparedStatement.setInt(2, member.getUserId());
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public void createUser(User user) {
        String INSERT_USER = "INSERT INTO users ( u_email, u_pwd,checkadmin) VALUES (?, ?,0)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER)) {
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(3, user.getPassword());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
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

}

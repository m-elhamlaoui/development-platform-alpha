package com.syndic.dao;

import com.syndic.beans.User;
import com.syndic.connection.AbstractDAOA;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAOImpl extends AbstractDAOA implements UserDAO {

    private static final String SELECT_USER_BY_ID = "SELECT * FROM users WHERE id=?";
    private static final String SELECT_USER_BY_EMAIL = "SELECT * FROM users WHERE u_email=?";
    private static final String INSERT_USER = "INSERT INTO users (u_name, u_email, u_pwd) VALUES (?, ?, ?)";
    private static final String UPDATE_USER = "UPDATE users SET u_name=?, u_email=?, u_pwd=? WHERE id=?";
    private static final String DELETE_USER = "DELETE FROM users WHERE id=?";
    private static final String LOGIN_USER = "SELECT * FROM users WHERE u_email=? AND u_pwd=?";

    private Connection connection;

    public UserDAOImpl(Connection connection) {
        this.connection = connection;
    }



    @Override
    public User getUserById(int userId) {
        User user = null;

        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID)) {
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                user = extractUserFromResultSet(resultSet);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public User getUserByEmail(String email) {
        User user = null;
        System.out.println("DOAIMPL!!"+connection);
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_EMAIL)) {
            preparedStatement.setString(1, email);
            System.out.println("DOAIMPL!!"+email+"..");
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                user = extractUserFromResultSet(resultSet);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }



    @Override
    public User login(String email, String password) {
        User user = null;
        System.out.println("DOAIMPLlogin!!"+connection);
        try (PreparedStatement preparedStatement = connection.prepareStatement(LOGIN_USER)) {
            System.out.println(connection);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            System.out.println(connection.prepareStatement(LOGIN_USER));
            System.out.println("dao...");
            ResultSet resultSet = preparedStatement.executeQuery();
            System.out.println(preparedStatement);
            System.out.println("dao2..");
            System.out.println(resultSet);

            if (resultSet.next()) {
                user = extractUserFromResultSet(resultSet);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public void createUser(User user) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateUser(User utilisateur) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER)) {
            preparedStatement.setString(1, utilisateur.getName());
            preparedStatement.setString(2, utilisateur.getEmail());
            preparedStatement.setString(3, utilisateur.getPassword());
            preparedStatement.setInt(4, utilisateur.getIdUser());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteUser(int userId) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER)) {
            preparedStatement.setInt(1, userId);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private User extractUserFromResultSet(ResultSet resultSet) throws SQLException {
        int id = resultSet.getInt("id");
        String name = resultSet.getString("u_name");
        String email = resultSet.getString("u_email");
        String password = resultSet.getString("u_pwd");

        return new User(id, name, email, password);
    }
}

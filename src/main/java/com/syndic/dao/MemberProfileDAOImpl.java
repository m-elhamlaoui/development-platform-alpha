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

        String query = "INSERT INTO members (m_fulladdress, m_iduser, member_s_id ) VALUES (?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, member.getFulladdress());
            preparedStatement.setInt(2, member.getUserId());
            preparedStatement.setInt(3, member.getMemberSId());
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public Member getMemberByUserId(int userId) throws SQLException {
        String query = "SELECT * FROM members WHERE m_iduser = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, userId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int id = resultSet.getInt("m_id");
                    String firstName = resultSet.getString("m_firstname");
                    String lastName = resultSet.getString("m_lastname");
                    String fulladdress = resultSet.getString("m_fulladdress");
                    String codepostal = resultSet.getString("m_codepostal");
                    String phoneNumber = resultSet.getString("m_phonenumber");
                    String mail = resultSet.getString("m_mail");
                    int memberSId = resultSet.getInt("member_s_id");
                    return new Member(id, firstName, lastName, fulladdress, codepostal, phoneNumber, mail, userId, memberSId);
                }
            }
        }
        return null;
    }

    @Override
    public void updateMember(Member member) throws SQLException {
        String query = "UPDATE members SET m_firstname = ?, m_lastname = ?, m_codepostal = ?, m_phonenumber = ?, m_fulladdress = ?, m_mail = ? WHERE m_iduser = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, member.getFirstName());
            preparedStatement.setString(2, member.getLastName());
            preparedStatement.setString(3, member.getCodepostal());
            preparedStatement.setString(4, member.getPhoneNumber());
            preparedStatement.setString(5, member.getFulladdress());
            preparedStatement.setString(6, member.getMail());
            preparedStatement.setInt(7, member.getUserId());
            preparedStatement.executeUpdate();
        }
    }



}

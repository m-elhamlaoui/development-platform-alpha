package com.syndic.dao;

import com.syndic.beans.User;
import java.sql.SQLException;
import java.util.List;

import com.syndic.beans.Member;

public interface MemberProfileDAO {
   // User getProfileUserById(int userId) throws SQLException;

   // void updatememberProfile(User user) throws SQLException;

    void addMember(Member member) throws SQLException ;
    void createUser(User user) throws SQLException ;


}

package com.syndic.dao;

import com.syndic.beans.User;
import java.sql.SQLException;

public interface ProfileUserDAO {
    User getProfileUserById(int userId) throws SQLException;

    void updateProfile(User user) throws SQLException;
}

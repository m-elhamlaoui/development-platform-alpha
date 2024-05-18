package com.syndic.dao;

import com.syndic.beans.Member;
import com.syndic.beans.Syndic;
import com.syndic.beans.User;

import java.sql.SQLException;

public interface SyndicProfileDAO {

    void addSyndic(Syndic syndic) throws SQLException ;
    void updateSyndic(Syndic syndic) throws SQLException;

    void updateSyndic2(Syndic syndic) throws SQLException;

    Syndic getSyndicByUserId(int userId) throws SQLException;
}

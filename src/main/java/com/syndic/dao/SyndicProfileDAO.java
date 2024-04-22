package com.syndic.dao;

import com.syndic.beans.Syndic;
import com.syndic.beans.User;

import java.sql.SQLException;

public interface SyndicProfileDAO {

    void addSyndic(Syndic syndic) throws SQLException ;
;


    //a redefinir
    User getProfileUserById(int userId) throws SQLException;
}

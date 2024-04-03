package com.syndic.connection;

import java.sql.Connection;

public class AbstractDAOA {
    protected Connection connection = Syndic_con.getConnection();
}

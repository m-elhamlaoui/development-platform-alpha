package com.syndic.servlet;

import com.syndic.beans.User;
import com.syndic.dao.MemberProfileDAO;
import com.syndic.dao.MemberProfileDAOImpl;
import com.syndic.connection.Syndic_con;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MemberProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MemberProfileServlet() {
        super();
    }


}

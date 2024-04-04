package com.syndic.servlet;

import com.syndic.beans.User;
import com.syndic.dao.UserDAO;
import com.syndic.dao.UserDAOImpl;
import com.syndic.connection.Syndic_con;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;


public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UserDAO userDAO;
        try (Connection connection = Syndic_con.getConnection()) {
            userDAO = new UserDAOImpl(connection);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Cr�er un nouvel utilisateur
        User newUser = new User(0, name, email, password);

        // Appeler la m�thode pour ajouter l'utilisateur � la base de donn�es
        userDAO.createUser(newUser);

        // Rediriger vers la liste des utilisateurs apr�s l'ajout
        response.sendRedirect("login.jsp");
    }

}

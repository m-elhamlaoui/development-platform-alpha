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
import java.util.concurrent.TimeUnit;


public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public LoginServlet() {
        super();
        // Instanciation de votre DAO
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Rediriger vers la page login.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection connection = null;

        do {
            try {
                connection = Syndic_con.getConnection();
                if (connection != null) {
                    userDAO = new UserDAOImpl(connection);
                    User user = userDAO.login(email, password);

                    if (user != null) {
                        HttpSession session = request.getSession();
                        session.setAttribute("user", user);
                        System.out.println("0ou un"+user.getAdmin());
                        if (user.getAdmin()  ) {
                            response.sendRedirect("admin.jsp");
                            return;
                        } else {
                            response.sendRedirect("Home.jsp");
                            return;
                        }
                    } else {
                        response.sendRedirect("login.jsp?error=1");
                        return;
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
                return;
            }

        } while (true); // Continue indefinitely until connection is obtained


    }
}
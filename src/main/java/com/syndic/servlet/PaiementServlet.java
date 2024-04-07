package com.syndic.servlet;

import com.syndic.beans.Paiement;
import com.syndic.beans.User;
import com.syndic.dao.PaiementDAO;
import com.syndic.dao.PaiementDAOImpl;
import com.syndic.connection.Syndic_con;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class PaiementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            try (Connection connection = Syndic_con.getConnection()) {
                PaiementDAO paiementDAO = new PaiementDAOImpl(connection);
                List<Paiement> paiements = paiementDAO.getPaiementsByUserId(user.getIdUser());
                request.setAttribute("paiements", paiements);
                RequestDispatcher dispatcher = request.getRequestDispatcher("paiement.jsp");
                dispatcher.forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}

package com.syndic.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class MembersPaymentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Utilisez getRequestDispatcher() pour transférer la requête à Memberspayment.jsp
        RequestDispatcher dispatcher = req.getRequestDispatcher("Memberspayment.jsp");
        dispatcher.forward(req, resp); // Transfère la requête et la réponse à la page Memberspayment.jsp
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Pour le traitement des méthodes POST, vous pouvez également rediriger vers la même page
        doGet(req, resp);
    }
}

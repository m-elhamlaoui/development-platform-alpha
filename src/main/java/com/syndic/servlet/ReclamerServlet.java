package com.syndic.servlet;

import com.syndic.beans.User;
import com.syndic.dao.ReclamationDAO;
import com.syndic.dao.ReclamationDAOImpl;
import com.syndic.connection.Syndic_con;
import com.syndic.beans.Reclamation;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import com.syndic.dao.UserDAO;
import com.syndic.dao.UserDAOImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ReclamerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    public ReclamerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        RequestDispatcher dispatcher = request.getRequestDispatcher("reclamer.jsp");
        dispatcher.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les données du formulaire
        String sujet = request.getParameter("sujet");
        String description = request.getParameter("description");
        Syndic_con.getConnection();
        // Récupérer l'utilisateur connecté
        //HttpSession session = request.getSession();
        //User user = (User) session.getAttribute("user");

        // Créer une nouvelle réclamation
        //  Reclamation reclamation = new Reclamation();
        //  reclamation.setSujet(sujet);
        //  reclamation.setDescription(description);
        // reclamation.setDateSoumission(new Date()); // Date actuelle
        //  reclamation.setIdUser(user.getIdUser()); // Récupérer l'ID de l'utilisateur


        // Enregistrer la réclamation dans la base de données
        try (Connection connection = Syndic_con.getConnection()) {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            // Créer une nouvelle réclamation
            Reclamation reclamation = new Reclamation();
            reclamation.setSujet(sujet);
            reclamation.setDescription(description);
            reclamation.setDateSoumission(new Date()); // Date actuelle
            reclamation.setIdUser(user.getIdUser()); // Récupérer l'ID de l'utilisateur


            ReclamationDAO reclamationDAO = new ReclamationDAOImpl(connection);
            reclamationDAO.ajouterReclamation(reclamation);
            response.sendRedirect("reclamer.jsp?success=1"); // Redirection vers la page de succès
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("reclamer.jsp?error=1"); // Redirection vers la page d'erreur
        }
    }
}

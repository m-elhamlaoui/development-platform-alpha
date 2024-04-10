package com.syndic.servlet;

import com.syndic.beans.User;
import com.syndic.dao.ProfileUserDAO;
import com.syndic.dao.ProfileUserDAOImpl;
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

public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ProfileServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        try (Connection connection = Syndic_con.getConnection()) {
            ProfileUserDAO profileUserDAO = new ProfileUserDAOImpl(connection);
            User profileUser = profileUserDAO.getProfileUserById(user.getIdUser());

            // Mettre à jour l'objet User avec les détails récupérés
            user.setName(profileUser.getName());
            user.setEmail(profileUser.getEmail());
        } catch (SQLException e) {
            e.printStackTrace();
            // Gérer l'erreur
        }

        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les données du formulaire
        String apartmentNumber = request.getParameter("apartmentNumber");
        String buildingNumber = request.getParameter("buildingNumber");
        String phoneNumber = request.getParameter("phoneNumber");


        try (Connection connection = Syndic_con.getConnection()) {
            System.out.println("connectionuser1 "+connection);
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            // Mettre à jour les informations de l'utilisateur
            user.setApartmentNumber(apartmentNumber);
            user.setBuildingNumber(buildingNumber);
            user.setPhoneNumber(phoneNumber);
            System.out.println("apartmentNumb "+user.getApartmentNumber());
            ProfileUserDAO profileUserDAO = new ProfileUserDAOImpl(connection);

            System.out.println("IID "+user.getId_user());
            profileUserDAO.updateProfile(user);
            //session.setAttribute("user", user); // Mettre à jour l'objet utilisateur en session
                request.setAttribute("successMessage", "Profil mis à jour avec succès !");
                RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
                dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
                request.setAttribute("errorMessage", "Erreur lors de la mise à jour du profil. Veuillez réessayer.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
                dispatcher.forward(request, response);
        }

    }
}

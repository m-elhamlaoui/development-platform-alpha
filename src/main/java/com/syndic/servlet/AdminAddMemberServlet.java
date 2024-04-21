package com.syndic.servlet;


import com.syndic.beans.Member;
import com.syndic.beans.User;
import com.syndic.connection.Syndic_con;
import com.syndic.dao.MemberProfileDAO;
import com.syndic.dao.MemberProfileDAOImpl;
import com.syndic.dao.UserDAO;
import com.syndic.dao.UserDAOImpl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;


public class AdminAddMemberServlet extends HttpServlet {
    private UserDAO userDAO;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        RequestDispatcher dispatcher = request.getRequestDispatcher("addmember.jsp");
        dispatcher.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer les données du formulaire
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        // Crypter le mot de passe avant de l'ajouter à la base de données
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        Connection connection = null;


        do {
            try {
                connection = Syndic_con.getConnection();
                if (connection != null) {
                    userDAO = new UserDAOImpl(connection);
                    // Cr�er un nouvel utilisateur
                    User newUser = new User(email, hashedPassword,0);
                    // Appeler la m�thode pour ajouter l'utilisateur � la base de donn�es
                    userDAO.createUser(newUser);
                    // Récupérer l'ID de l'utilisateur nouvellement créé
                    int userId = userDAO.getUserIdByEmail(email);
                    // Créer un nouveau membre
                    Member newMember = new Member(address);
                    newMember.setUserId(userId);
                    newMember.setFulladdress(address);
                    MemberProfileDAO memberDAO = new MemberProfileDAOImpl(connection);
                    memberDAO.addMember(newMember);


                    // Rediriger vers la liste des utilisateurs apr�s l'ajout
                    response.sendRedirect("admin.jsp");
                    return;
                }
            } catch (IOException e) {
                e.printStackTrace();
            } catch (SQLException ex) {
                throw new RuntimeException(ex);
            }

        } while (true);
    }


}

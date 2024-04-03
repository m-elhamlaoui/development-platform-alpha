package User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.syndic.connection.Syndic_con;


@WebServlet("/User_servlet")
public class User_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list"; // Action par d�faut
        }

        try (Connection connection = Syndic_con.getConnection()) {
            UtilisationDAO utilisateurDAO = new UtilisationDAOImpl();

            switch (action) {

                case "add":
                    showAddForm(request, response);
                    break;
                case "insert":
                    insertUser(request, response, utilisateurDAO);
                    break;
                case "edit":
                    showEditForm(request, response, utilisateurDAO);
                    break;
                case "update":
                    updateUser(request, response, utilisateurDAO);
                    break;
                case "delete":
                    deleteUser(request, response, utilisateurDAO);
                    break;
                case "login":
                    loginUser(request, response, utilisateurDAO);
                    break;

            }
        } catch ( SQLException e) {
            e.printStackTrace();
            // G�rer les erreurs de connexion
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur de connexion � la base de donn�es");
        }
    }
    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Affiche le formulaire pour ajouter un utilisateur (� impl�menter si n�cessaire)
        request.getRequestDispatcher("addUser.jsp").forward(request, response);
    }
    private void loginUser(HttpServletRequest request, HttpServletResponse response, UtilisationDAO utilisateurDAO)
            throws ServletException, IOException {
        // R�cup�rer les param�tres du formulaire
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println("loginuser successfully..."+email +"..."+password);

        try {
            // Authentifier l'utilisateur
            Utilisateur user = utilisateurDAO.login(email, password);
            System.out.println("loginuser ..."+ user);

            if (user != null) {

                // L'utilisateur est authentifi�
                HttpSession session = request.getSession();
                System.out.println("loginuser ..."+session);
                session.setAttribute("utilisateur", user);

                // Rediriger vers une page apr�s la connexion r�ussie
                response.sendRedirect("test.jsp");
            } else {
                // L'authentification a �chou�
                response.sendRedirect("login.jsp?error=1");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur inattendue");
        }
    }
    private void deleteUser(HttpServletRequest request, HttpServletResponse response, UtilisationDAO utilisateurDAO)
            throws ServletException, IOException {
        // R�cup�rer l'ID de l'utilisateur � supprimer depuis les param�tres de la requ�te
        int userId = Integer.parseInt(request.getParameter("id"));

        System.out.println("Deleting user with ID: " + userId);

        // Appeler la m�thode pour supprimer l'utilisateur de la base de donn�es
        utilisateurDAO.deleteUser(userId);

        System.out.println("User deleted successfully.");

        // Rediriger vers la liste des utilisateurs apr�s la suppression
        response.sendRedirect("register.jsp");
    }
    private void updateUser(HttpServletRequest request, HttpServletResponse response, UtilisationDAO utilisateurDAO)
            throws ServletException, IOException {
        // R�cup�rer les param�tres du formulaire
        String email = request.getParameter("email");
        String newName = request.getParameter("newName");
        String newPassword = request.getParameter("newPassword");

        try (Connection connection = Syndic_con.getConnection()) {
            Utilisateur utilisateur = utilisateurDAO.getUserByEmail(email);

            if (utilisateur != null) {
                // Mettre � jour les propri�t�s de l'utilisateur
                utilisateur.setName(newName);
                utilisateur.setPassword(newPassword);

                // Appeler la m�thode updateUser de votre DAO
                utilisateurDAO.updateUser(utilisateur);

                // Redirection apr�s la mise � jour
                response.sendRedirect("index.jsp"); // Redirigez vers la page appropri�e
            } else {
                // G�rer le cas o� l'utilisateur n'est pas trouv�
                response.sendRedirect("error.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur inattendue");
        }
    }
    private void showEditForm(HttpServletRequest request, HttpServletResponse response, UtilisationDAO utilisateurDAO)
            throws ServletException, IOException {
        // R�cup�rer l'ID de l'utilisateur � �diter depuis les param�tres de la requ�te
        int userId = Integer.parseInt(request.getParameter("id"));

        // R�cup�rer l'utilisateur � �diter
        Utilisateur userToEdit = utilisateurDAO.getUserById(userId);

        // Mettre l'utilisateur � �diter dans les attributs de la requ�te
        request.setAttribute("userToEdit", userToEdit);

        // Afficher le formulaire d'�dition de l'utilisateur (� impl�menter si n�cessaire)
        request.getRequestDispatcher("editUser.jsp").forward(request, response);
    }


    private void insertUser(HttpServletRequest request, HttpServletResponse response, UtilisationDAO utilisateurDAO)
            throws ServletException, IOException {
        // R�cup�rer les param�tres du formulaire pour cr�er un nouvel utilisateur
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Cr�er un nouvel utilisateur
        Utilisateur newUser = new Utilisateur(0, name, email, password);

        // Appeler la m�thode pour ajouter l'utilisateur � la base de donn�es
        utilisateurDAO.createUser(newUser);

        // Rediriger vers la liste des utilisateurs apr�s l'ajout
        response.sendRedirect("login.jsp");
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}

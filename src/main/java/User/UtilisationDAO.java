package User;

public interface UtilisationDAO {
    Utilisateur getUserById(int userId);
    Utilisateur getUserByEmail(String email);
    Utilisateur login(String email, String password);
    void createUser(Utilisateur utilisateur);
    void updateUser(Utilisateur utilisateur);
    void deleteUser(int userId);
}

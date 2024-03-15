package User;




public class Utilisateur {
    private int id_user;
    private String name;
    private String email;
    private String password;

    // Constructeur par d�faut
    public Utilisateur() {
    }

    public Utilisateur(int idUser, String name) {
        this.id_user = idUser;
        this.name = name;
    }

    public Utilisateur(int idUser) {
        this.id_user = idUser;

    }
    // Constructeur avec tous les champs
    public Utilisateur(int idUser, String name, String email, String password) {
        this.id_user = idUser;
        this.name = name;
        this.email = email;
        this.password = password;
    }

    // Getters et setters
    public int getIdUser() {
        return id_user;
    }

    public void setIdUser(int idUser) {
        this.id_user = idUser;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    // Autres m�thodes au besoin
}

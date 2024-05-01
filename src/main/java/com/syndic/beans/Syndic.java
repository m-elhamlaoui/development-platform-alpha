package com.syndic.beans;

public class Syndic {
    private int id;
    private String firstName;
    private String lastName;
    private String fulladdress;
    private String codepostal;
    private String phoneNumber;
    private String mail;

    private int userId;

    public Syndic() {
    }
    public Syndic(String fulladdress) {
        this.fulladdress = fulladdress;
    }
    public Syndic(int id , int userId){
        this.id = id;
        this.userId = userId;
    }
    // Constructeur avec tous les champs
    public Syndic(int id, String firstName, String lastName, String fulladdress,String codepostal, String phoneNumber,String mail, int userId) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.fulladdress = fulladdress;
        this.codepostal = codepostal;
        this.phoneNumber = phoneNumber;
        this.mail = mail;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFulladdress() {
        return fulladdress;
    }

    public void setFulladdress(String fulladdress) {
        this.fulladdress = fulladdress;
    }

    public String getCodepostal() {
        return codepostal;
    }

    public void setCodepostal(String codepostal) {
        this.codepostal = codepostal;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}

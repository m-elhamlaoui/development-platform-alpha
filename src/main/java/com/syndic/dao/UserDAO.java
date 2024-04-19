package com.syndic.dao;


import com.syndic.beans.User;

public interface UserDAO {
    User getUserById(int userId);
    User getUserByEmail(String email);
    User login(String email, String password);
    void createUser(User user);
    void createSyndic(User user);
    void updateUser(User user);
    void deleteUser(int userId);
}
<%@ page import="com.syndic.beans.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Profil Utilisateur</title>
  <link rel="stylesheet" href="css/style.css">
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <style>/* FORMULAIRE */
    form {
    margin-top: 2rem;
    }

    form label {
    font-weight: 500;
    }

    form input[type="text"],
    form input[type="email"] {
    width: 100%;
    padding: 1rem;
    margin-top: 0.5rem;
    border: 1px solid var(--color-dark-variant);
    border-radius: var(--border-radius-1);
    }

    form input[type="submit"] {
    background-color: var(--color-primary);
    color: var(--color-white);
    border: none;
    padding: 1rem 2rem;
    border-radius: var(--border-radius-1);
    cursor: pointer;
    margin-top: 1rem;
    transition: background-color 0.3s ease;
    }

    form input[type="submit"]:hover {
    background-color: var(--color-primary-variant);
    }
  </style>
</head>
<body>
<div class="container">
  <jsp:include page="templates/user_sidenav.jsp" />

    <div class="formulaire" >
      <h1>Welcome <%= ((User) session.getAttribute("user")).getName() %> to your Profile!</h1>
  <h2>completer et éditer votre Profile </h2>
<form action="profile" method="post">
  <input type="hidden" name="action" value="update">
  <label for="name">Nom :</label><br>
  <input type="text" id="name" name="name" value="${user.name}" readonly><br>
  <label for="email">Email :</label><br>
  <input type="email" id="email" name="email" value="${user.email}" readonly ><br>
  <label for="mobile">Numéro de téléphone :</label><br>
  <input type="text" id="mobile" name="phoneNumber"  value="${profileUser.phoneNumber}" ><br>
  <label for="apartment">Numéro d'appartement :</label><br>
  <input type="text" id="apartment" name="apartmentNumber" value="${profileUser.apartmentNumber}" ><br>
  <label for="building">Numéro d'immeuble :</label><br>
  <input type="text" id="building" name="buildingNumber" value="${profileUser.buildingNumber}" ><br>
  <input type="submit" value="Enregistrer">
</form>

      <%-- Affichage du message de succès --%>
      <% if (request.getAttribute("successMessage") != null) { %>
      <div class="alert alert-success">
        <%= request.getAttribute("successMessage") %>
      </div>

      <% } %>
      <%-- Affichage du message d'erreur --%>
      <% if (request.getAttribute("errorMessage") != null) { %>
      <div class="alert alert-danger">
        <%= request.getAttribute("errorMessage") %>
      </div>
      <% } %>
</div>
</div>
</body>
</html>

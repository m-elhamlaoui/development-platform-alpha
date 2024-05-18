<%@ page import="com.syndic.beans.User" %>
<%@ page import="com.syndic.beans.Syndic" %>
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

  <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container">
  <jsp:include page="templates/syndic_sidenav.jsp" />

  <!------------MIDDLE ------------>
  <main>

    <div class="recent-updates">

      <h1>Welcome <%= ((Syndic) session.getAttribute("syndic")).getFirstName() %>!</h1>
      <form action="syndicprofile" method="post">
        <label for="firstname">Prénom:</label><br>
        <input type="text" id="firstname" name="firstname" value="${syndic.firstName}"><br>

        <label for="lastname">Nom:</label><br>
        <input type="text" id="lastname" name="lastname" value="${syndic.lastName}"><br>

        <label for="codepostal">Code Postal:</label><br>
        <input type="text" id="codepostal" name="codepostal" value="${syndic.codepostal}"><br>

        <label for="phonenumber">Numéro de Téléphone:</label><br>
        <input type="text" id="phonenumber" name="phonenumber" value="${syndic.phoneNumber}"><br>

        <label for="fulladdress">Adresse Complète:</label><br>
        <input type="text" id="fulladdress" name="fulladdress" value="${syndic.fulladdress}"><br>

        <label for="mail">E-mail:</label><br>
        <input type="text" id="mail" name="mail" value="${syndic.mail}"><br>

        <input type="submit" value="Enregistrer">
      </form>
    </div>
  </main>
  <!-------------END OF MIDDLE --------->
</div>
<script>
  document.getElementById("syndicprofile").classList.add("active");
</script>
</body>
</html>

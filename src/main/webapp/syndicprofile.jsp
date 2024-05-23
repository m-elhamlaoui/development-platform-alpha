<%@ page import="com.syndic.beans.User" %>
<%@ page import="com.syndic.beans.Syndic" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DASHBOARD</title>
  <link rel="shortcut icon" href="/Assets/images/logo.png" type="image/x-icon">
  <!---BOX ICON CDN-->
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

  <!----STYLESHEET---->
  <link rel="stylesheet" href="css/style.css">
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://demos.creative-tim.com/notus-js/assets/styles/tailwind.css">
  <link rel="stylesheet" href="https://demos.creative-tim.com/notus-js/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css">
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

        <input type="text" id="firstname" name="firstname" value="${syndic.firstName}" , placeholder="Full Name"><br>

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

        <!-- Nouveaux champs pour les informations de la résidence -->
        <label for="residenceName">Nom de la Résidence:</label><br>
        <input type="text" id="residenceName" name="residenceName" value="${syndic.residenceName}"><br>

        <label for="residenceAddress">Adresse de la Résidence:</label><br>
        <input type="text" id="residenceAddress" name="residenceAddress" value="${syndic.residenceAddress}"><br>

        <label for="residenceType">Type de Résidence:</label><br>
        <input type="text" id="residenceType" name="residenceType" value="${syndic.residenceType}"><br>

        <label for="residenceSize">Taille de la Résidence (m²):</label><br>
        <input type="number" id="residenceSize" name="residenceSize" value="${syndic.residenceSize}"><br>

        <label for="apartmentCount">Nombre d'Appartements:</label><br>
        <input type="number" id="apartmentCount" name="apartmentCount" value="${syndic.apartmentCount}"><br>

        <label for="villaCount">Nombre de Villas:</label><br>
        <input type="number" id="villaCount" name="villaCount" value="${syndic.villaCount}"><br>

        <label for="gardenCount">Nombre de Jardins:</label><br>
        <input type="number" id="gardenCount" name="gardenCount" value="${syndic.gardenCount}"><br>

        <label for="poolCount">Nombre de Piscines:</label><br>
        <input type="number" id="poolCount" name="poolCount" value="${syndic.poolCount}"><br>

        <label for="parkingCount">Nombre de Parkings:</label><br>
        <input type="number" id="parkingCount" name="parkingCount" value="${syndic.parkingCount}"><br>

        <label for="elevatorsCount">Nombre d'Ascenseurs:</label><br>
        <input type="number" id="elevatorsCount" name="elevatorsCount" value="${syndic.elevatorsCount}"><br>

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

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Ajouter un membre</title>
</head>
<body>
<h1>Ajouter un membre</h1>
<form action="addmember" method="post">
  <label for="email">Email :</label><br>
  <input type="email" id="email" name="email"><br>
  <label for="password">Mot de passe :</label><br>
  <input type="password" id="password" name="password"><br>
  <label for="address">Adresse :</label><br>
  <input type="text" id="address" name="address"><br>
  <input type="submit" value="Ajouter">
</form>
</body>
</html>

<%@ page import="com.syndic.beans.Paiement" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Statut des paiements</title>
</head>
<body>
<h1>Statut des paiements</h1>
<table border="1">
  <thead>
  <tr>
    <th>Mois</th>
    <th>Statut</th>
  </tr>
  </thead>
  <tbody>
  <%
    List<Paiement> paiements = (List<Paiement>)request.getAttribute("paiements");
    if (paiements != null) {
      for (Paiement paiement : paiements) {
  %>
  <tr>
    <td><%= paiement.getMois() %></td>
    <td><%= paiement.isPaye() ? "Payé" : "Non payé" %></td>
  </tr>
  <%
    }
  } else {
  %>
  <tr>
    <td colspan="2">Aucun paiement trouvé.</td>
  </tr>
  <% } %>
  </tbody>
</table>
</body>
</html>

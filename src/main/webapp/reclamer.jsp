<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Soumettre Réclamation</title>

</head>
<body>
<jsp:include page="templates/side_nav.jsp" />
<div class="container">
<h1>Soumettre Réclamation</h1>
<form action="reclamer" method="post">
    <div class="input-data">
    <input class="input" type="hidden" name="action" value="insert" >
    <label class="form-label" for="sujet">Sujet :</label><br>
    </div>

    <div class="input-data">
    <input class="input" type="text" id="sujet" name="sujet"><br>
    <label class="form-label" for="description">Description :</label><br>
    </div>

    <textarea id="description" name="description"></textarea><br>
    <input class="input" type="submit" value="Soumettre">
</form>
<a href="home.jsp">Retourner</a>
</div>
</body>

</html>

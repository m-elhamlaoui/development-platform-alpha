<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" encoding="UTF-8">
    <title>Soumettre Réclamation</title>
    <link rel="stylesheet" href="css/style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<style>/* Styles for the formulaire class within the current theme */
.formulaire {
    background-color: var(--color-white);
    padding: var(--card-padding);
    border-radius: var(--card-border-radius);
    box-shadow: var(--box-shadow);
    transition: all 300ms ease;
    margin-left: 10%;

}

.formulaire h1 {
    margin-bottom: 1rem;
    font-size: 1.8rem;
    color: var(--color-dark);
}

.formulaire label {
    color: var(--color-dark);
}

.formulaire input[type="text"],
.formulaire textarea {
    width: 100%;
    padding: 0.8rem;
    margin-bottom: 1rem;
    border-radius: var(--border-radius-1);
    border: 1px solid var(--color-info-dark);
    background-color: var(--color-info-light);
    color: var(--color-dark);
}

.formulaire input[type="submit"] {
    background-color: var(--color-primary);
    color: var(--color-white);
    padding: 0.8rem 2rem;
    border: none;
    border-radius: var(--border-radius-1);
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.formulaire input[type="submit"]:hover {
    background-color: var(--color-primary-variant);
}

.formulaire a {
    color: var(--color-primary);
    text-decoration: none;
    transition: color 0.3s ease;
}

.formulaire a:hover {
    color: var(--color-primary-variant);
}
</style>
</head>
<body>
<div class="container">
<jsp:include page="templates/member_sidenav.jsp" />

<div class="formulaire" >
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


    <!---------RIGHT--------->
    <div class="right">

        <!--------TOP-->
        <div class="top">
            <!---MENU ICON-->
            <button id="menu-btn">
                <i class='bx bx-menu'></i>
            </button>

            <!------LIGHT AND DARK THEME BUTTONS-->
            <div class="theme-toggle">
                <i class='bx bx-sun active'></i>
                <i class='bx bx-moon'></i>
            </div>
            <div class="profile">
                <div class="info">
                    <p>Hey, <b>Ayo</b></p>
                    <small class="text-muted">Admin</small>
                </div>
                <div class="profile-photo">
                    <img src="./Assets/images/profile-1.jpg" alt="Oluwadare Taye Ayo">
                </div>
            </div>
        </div>
        <!-------END OF TOP------>
</div>

</body>

</html>

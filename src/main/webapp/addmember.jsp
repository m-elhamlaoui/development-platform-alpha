<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DASHBOARD</title>
  <link rel="shortcut icon" href="/Assets/images/logo.png" type="image/x-icon">
  <!---BOX ICON CDN-->
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

  <!----STYLESHEET---->
  <link rel="stylesheet" href="css/style.css">
</head>

<body>
<div class="container">
  <jsp:include page="templates/admin_sidenav.jsp" />

  <!------------MIDDLE ------------>
  <main>
    <!----------TOP -------->
    <h1>Dashboard</h1>
    <div class="date">
      <input type="date">
    </div>
    <div class="recent-updates">
      <form action="addmember" method="post" class="user-form">
        <label for="name">Nom:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="password">Mot de passe:</label>
        <input type="password" id="password" name="password" required><br>

        <label for="residence">Residence:</label>
        <input type="text" id="residence" name="residence" required><br>

        <input type="submit" value="Ajouter">
      </form>
    </div>

    <% String successMessage = (String) request.getSession().getAttribute("successMessage"); %>
    <% if (successMessage != null) {  %>
    <script> alert('<%= successMessage %>');</script>
    <% request.getSession().removeAttribute("successMessage");} %>

    <% String errorMessage = (String) request.getSession().getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
    <script>alert('<%= errorMessage %>');</script>
    <% request.getSession().removeAttribute("errorMessage");} %>


  </main>
  <!-------------END OF MIDDLE --------->


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

    <!---------RECENT UPDATES------>
    <div class="recent-updates">

    </div>
    <!-------END OF RECENT UPDATES---->


  </div>
  <!---------END OF RIGHT------->

</div>
<script>
  document.getElementById("addmember").classList.add("active");
</script>
</body>

<script src="javascript/main.js"></script>
</html>
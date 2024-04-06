<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Soumettre Réclamation</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Inter', sans-serif;
        }

        .input {
            display: flex;
            gap: 20px;
            margin-bottom: 15px;
        }
        .input > div {
            width: 50%;
        }
        .input {
            text-align: center;
            width: 100%;
            padding: 13px 22px;
            border-radius: 5px;
            border: 1px solid #dde3ec;
            background: #ffffff;
            font-weight: 500;
            font-size: 16px;
            color: #536387;
            outline: none;
            resize: none;
        }
        .input :focus {
            border-color: #6a64f1;
            box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
        }
        .form-label {
            color: #536387;
            font-size: 14px;
            line-height: 24px;
            display: block;
            margin-bottom: 10px;
        }

    </style>
</head>
<body>
<h1>Soumettre Réclamation</h1>
<form action="reclamer" method="post">
    <input class="input" type="hidden" name="action" value="insert" >
    <label class="form-label" for="sujet">Sujet :</label><br>
    <input class="input" type="text" id="sujet" name="sujet"><br>
    <label class="form-label" for="description">Description :</label><br>
    <textarea id="description" name="description"></textarea><br>
    <input class="input" type="submit" value="Soumettre">
</form>
<a href="test.jsp">Retourner</a>
</body>
</html>

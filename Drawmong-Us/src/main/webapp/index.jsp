<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Drawmong-Us</title>
    <link rel="stylesheet" href="css/home.css"/>
</head>
<body>
<div class="Title">
    <h1>Drawmong-Us</h1>
</div>
<div class="BaseInterface">
    <div class="PseudoText" id="PseudoText">

    </div>
    <div class="ChooseName" id="ChooseName">
        <h3>Entrez votre pseudo</h3>
        <input id="PseudoInput">
        <button onclick="test()">OK</button>
    </div>
    <div class="JoinGame" id="JoinGame">
        <h3>Rejoindre une partie</h3>
        <h5>Entrez le code de la partie à rejoindre</h5>
        <input>
        <button>Rejoindre</button>
    </div>
    <div class="CreateGame" id="CreateGame">
        <h3>Créer une partie</h3>
            <button>Créer</button>
    </div>
</div>

<div><a href="chat" title="chat servlet">Chat</a></div>
<div><a href="paint" title="paint servlet">Paint</a></div>

</body>

<script src="js/home.js"></script>

</html>
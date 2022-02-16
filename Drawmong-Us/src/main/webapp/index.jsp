<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
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
    <div class="ChangePseudo" id="ChangePseudo">
        <button class="ChangePseudoButton" onClick="window.location.reload();">Changer de pseudo</button>
    </div>
    <div class="ChooseName" id="ChooseName">
        <h3>Entrez votre pseudo</h3>
        <input id="PseudoInput">
        <button onclick="EnterPseudo()">OK</button>
    </div>
    <div class="JoinGame" id="JoinGame">
        <h3>Rejoindre une partie</h3>
        <h5>Entrez le code de la partie à rejoindre</h5>
        <input>
        <button>Rejoindre</button>
    </div>
    <div class="CreateGame" id="CreateGame">
        <h3>Créer une partie</h3>
            <button onclick="OpenLobbyInterface()">Créer</button>
    </div>
    <div class="Lobby" id="Lobby">
        <div id="LobbyText"></div>
        <div id="LobbyCode"></div>
        <div id="Participants"></div>
        <button>Lancer la partie !</button>
        <button>Paramètres</button>
        <button onclick="quitLobby()">Quitter le lobby</button>
    </div>
</div>

<div><a href="chat" title="chat servlet">Chat</a></div>
<div><a href="paint" title="paint servlet">Paint</a></div>

</body>

<script src="js/home.js"></script>

</html>
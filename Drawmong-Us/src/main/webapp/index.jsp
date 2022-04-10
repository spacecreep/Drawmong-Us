<%--
  Created by IntelliJ IDEA.
  User: Minffuuuueeeeeeenn
  Date: 17/02/2022
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <link rel="shortcut icon" type="image/ico" href="ressources/favicon.ico"/>
    <title>Drawmong-Us</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/create_game.css">
    <link rel="stylesheet" href="css/paint.css">
</head>

<body>
<div>
    <h1>Drawmong-Us </h1>
    <a href="paint">Paint</a>
</div>

<div class="BaseInterface" id="BaseInterface">
    <div class="ChooseName" id="ChooseName">
        <h3>Entrez votre pseudo</h3>
        <form action="login" method="post">
            <input name="pseudo" id="PseudoInput">
            <button type="submit" name="pseudo">OK</button>
        </form>

    </div>

</div>

<script type="text/javascript">
    let lobbyTableLoaded = false;
    let lobbyTableBody = document.getElementById("lobby-table-body");
    let selectedLobby;

    let createLobbyTabButton = document.getElementById("create-lobby-tab-button");
    let joinLobbyTabButton = document.getElementById("join-lobby-tab-button");

    let joinButton = document.getElementById("join-button");

    let wordpackDetail = document.getElementById("wordpack-detail");
    let roundsDetail = document.getElementById("rounds-detail");
    let playersDetail = document.getElementById("players-detail");
    let drawingTimeDetail = document.getElementById("drawing-time-detail");
    let customWordsDetail = document.getElementById("custom-words-detail");
    let votekickingDetail = document.getElementById("votekicking-detail");
    let maxClientsIPDetail = document.getElementById("max-clients-ip-detail");

    function onJoin() {
        window.open("{{.RootPath}}/ssrEnterLobby?lobby_id=" + selectedLobby, "_self");
    }

    function loadLobbyTable() {
        lobbyTableLoaded = true;

        if (lobbyTableBody.childNodes.length > 0) {
            for (let i = lobbyTableBody.childNodes.length - 1; i >= 0; i--) {
                lobbyTableBody.removeChild(lobbyTableBody.childNodes.item(i));
            }
        }

        fetch("{{.RootPath}}/v1/lobby")
            .then((response) => {
                return response.json();
            })
            .then((data) => {
                //Initially remove all data and disable join button, as we don't know
                //whether we'll have any data after fetching.
                showLobbyDetails(null);

                data.forEach(lobby => {
                    const wordpackCell = document.createElement("td");
                    wordpackCell.innerText = lobby.wordpack;
                    const roundsCell = document.createElement("td");
                    roundsCell.innerText = lobby.round + "/" + lobby.rounds;
                    const playersCell = document.createElement("td");
                    playersCell.innerText = lobby.playerCount + "/" + lobby.maxPlayers;
                    const drawingTimeCell = document.createElement("td");
                    drawingTimeCell.innerText = lobby.drawingTime.toString();
                    const customWordsCell = document.createElement("td");
                    customWordsCell.innerText = lobby.customWords ? 'yes' : 'no';

                    const newRow = document.createElement("tr");
                    newRow.appendChild(wordpackCell);
                    newRow.appendChild(roundsCell);
                    newRow.appendChild(playersCell);
                    newRow.appendChild(drawingTimeCell);
                    newRow.appendChild(customWordsCell);

                    lobbyTableBody.appendChild(newRow);

                    let clickHandler = function () {
                        lobbyTableBody.childNodes.forEach(row => {
                            row.setAttribute("selected", "false");
                        });
                        newRow.setAttribute("selected", "true");
                        selectedLobby = lobby.lobbyId;
                        showLobbyDetails(lobby);
                    };
                    newRow.addEventListener("click", clickHandler, false);
                });
            });
    }

    function showLobbyDetails(lobby) {
        if (lobby === null) {
            wordpackDetail.innerText = "";
            roundsDetail.innerText = "";
            playersDetail.innerText = "";
            drawingTimeDetail.innerText = "";
            customWordsDetail.innerText = "";
            votekickingDetail.innerText = "";
            maxClientsIPDetail.innerText = "";
            joinButton.disabled = true;
        } else {
            wordpackDetail.innerText = lobby.wordpack;
            roundsDetail.innerText = lobby.round + "/" + lobby.rounds;
            playersDetail.innerText = lobby.playerCount + "/" + lobby.maxPlayers;
            drawingTimeDetail.innerText = lobby.drawingTime.toString();
            customWordsDetail.innerText = lobby.customWords ? 'yes' : 'no';
            votekickingDetail.innerText = lobby.votekick ? 'yes' : 'no';
            maxClientsIPDetail.innerText = lobby.maxClientsPerIp;
            joinButton.disabled = false;
        }
    }

    function openTab(tabId) {
        if (tabId === "join-lobby") {
            loadLobbyTable();
        }

        //Initially hide all tabs except for our target tab
        const tabs = document.getElementsByClassName("tab-content");
        for (let i = 0; i < tabs.length; i++) {
            tabs[i].style.display = "none";
        }

        //Show the newly selected tab.
        document.getElementById(tabId).style.display = "flex";
    }

    if (createLobbyTabButton.checked) {
        openTab('create-lobby');
    } else if (joinLobbyTabButton.checked) {
        openTab('join-lobby');
    }

</script>
<script src="js/home.js"></script>
</body>

</html>


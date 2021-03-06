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
    <link rel="shortcut icon" type="image/ico" href="../ressources/favicon.ico"/>
    <title>Drawmong-Us</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/create_game.css">
    <link rel="stylesheet" href="css/main.css">
</head>

<body>
<div>
    <h1>Drawmong-Us</h1>
    <a href="paint">Paint</a>
</div>
<div class="BaseInterface" id="BaseInterface">
        <div class="content-wrapper">
            <div class="tab-header">
                <label for="create-lobby-tab-button">
                    <input id="create-lobby-tab-button" class="custom-check-or-radio tab-button" type="radio"
                           onclick="openTab('create-lobby')" name="tab" checked>
                    <div class="tab-label">Creer partie</div>
                </label>
                <label for="join-lobby-tab-button">
                    <input id="join-lobby-tab-button" class="custom-check-or-radio tab-button" type="radio"
                           onclick="openTab('join-lobby')" name="tab">
                    <div class="tab-label" >Rejoindre partie</div>
                </label>
            </div>


            <div id="create-lobby" class="tab-content">
                <h3 class="PseudoPlayer" id="PseudoPlayer">Bienvenue ${pseudo}</h3>
                <div class="center-container">
                    <div class="content-container">
                        <button id="create-lobby-button" onclick="ShowLobby()">Créer une partie</button>
                        <div id="settings-form" class="settings-form">
                            <form id="lobby-create" class="input-container" action="info" method="GET">
                                <b>Langue</b>
                                <select class="input-item" name="language" placeholder="Choose your language">
                                    <option value="">--Choisissez une option--</option>
                                    <option value="francais">Francais</option>
                                    <option value="francais">Francais</option>
                                    <option value="francais">Francais</option>
                                    <option value="francais">Francais</option>
                                </select>
                                <b>Temps de dessin (secondes) </b>
                                <input class="input-item" type="number" name="drawing_time"
                                       min=0 max=10/>
                                <b>Manches</b>
                                <input class="input-item" type="number" name="rounds"
                                       min=0 max=10/>
                                <b>Nombre max de joueurs</b>
                                <input class="input-item" type="number" name="max_players"
                                       min=0 max=20/>
                                <b>Room publique</b>
                                <input class="input-item" type="checkbox" name="public" value="true"/>
                                <b>Mots personnalises</b>
                                <textarea class="input-item" name="custom_words" style="resize: none"
                                          placeholder="Ajoutez des mots, en les séparant par des virgules"></textarea>
                                <b>Probabilite des mots personnalises</b>
                                <div class="input-item" style="display: flex;">
                                    0%
                                    <input style="flex: 1;" type="range" name="custom_words_chance" min="1" max="100">
                                    100%
                                </div>
                                <details class="advanced-section">
                                    <summary>Parametres avances</summary>
                                    <div class="input-container">
                                        <b>Limite de joueur par IP</b>
                                        <input class="input-item" type="number" name="clients_per_ip_limit"
                                               min=0 max=10 />
                                        <b>Autoriser le ban</b>
                                        <input class="input-item" type="checkbox" name="enable_votekick" value="true" />
                                    </div>
                                </details>
                                <button type="submit" class="create-button" form="lobby-create">
                                    Creer la partie
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <div id="join-lobby" class="tab-content">
                <div class="join-lobby-data">
                    <div class="table-wrapper-wrapper">
                        <button id="refresh-button" onclick="loadLobbyTable()">Actualiser</button>
                        <div class="table-wrapper">
                            <table id="lobby-table">
                                <thead>
                                <tr>
                                    <th>Langue</th>
                                    <th>Manches</th>
                                    <th>Joueurs</th>
                                    <th>Temps de dessin</th>
                                    <th>Mots</th>
                                </tr>
                                </thead>
                                <tbody id="lobby-table-body">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="lobby-details">
                        <span class="lobby-detail">Langue:</span>
                        <span id="wordpack-detail"></span>
                        <span class="lobby-detail">Manches :</span>
                        <span id="rounds-detail"></span>
                        <span class="lobby-detail">Joueurs:</span>
                        <span id="players-detail"></span>
                        <span class="lobby-detail">Temps de dessin:</span>
                        <span id="drawing-time-detail"></span>
                        <span class="lobby-detail">Mots :</span>
                        <span id="custom-words-detail"></span>
                        <span class="lobby-detail">Ban autorise:</span>
                        <span id="votekicking-detail"></span>
                        <span class="lobby-detail">Limite de joueurs par IP:</span>
                        <span id="max-clients-ip-detail"></span>
                        <form action="joinlobby" method="post">
                            <input name="lobbycode" id="PseudoInput">
                            <button type="submit">Rejoindre la partie</button>
                        </form>

                    </div>
                </div>
            </div>

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


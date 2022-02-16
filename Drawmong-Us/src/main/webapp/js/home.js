var pseudo;

function getRandom(min, max) {
    return Math.round(Math.random() * (max - min) + min);
}

function EnterPseudo() {
    pseudo = this.document.getElementById("PseudoInput").value;

    if(pseudo == ""){return;}

    this.document.getElementById("ChooseName").style.display = "none";
    this.document.getElementById("JoinGame").style.display = "block";
    this.document.getElementById("CreateGame").style.display = "block";
    this.document.getElementById("ChangePseudo").style.display = "block";
    this.document.getElementById("PseudoText").style.display = "block";
    var txt = this.document.getElementById("PseudoText");
    txt.innerHTML = "<H3>Bienvenue " + pseudo + " !!!</H3>";

}

function OpenLobbyInterface() {
    this.document.getElementById("JoinGame").style.display = "none";
    this.document.getElementById("CreateGame").style.display = "none";
    this.document.getElementById("PseudoText").style.display = "none";
    this.document.getElementById("ChangePseudo").style.display = "none";
    this.document.getElementById("Lobby").style.display = "block";
    var title = this.document.getElementById("LobbyText");
    title.innerHTML = "<H3>Lobby de " + pseudo + "</H3>";
    var code = this.document.getElementById("LobbyCode");
    code.innerHTML = "<H4>Code : " + getRandom(100000,999999) + "</H4>";
    var participants = this.document.getElementById("Participants");
    participants.innerHTML = "<H4>Participants : " + pseudo + "</H4>";
}

function quitLobby() {
    this.document.getElementById("JoinGame").style.display = "block";
    this.document.getElementById("CreateGame").style.display = "block";
    this.document.getElementById("PseudoText").style.display = "block";
    this.document.getElementById("ChangePseudo").style.display = "block";
    this.document.getElementById("Lobby").style.display = "none";
}
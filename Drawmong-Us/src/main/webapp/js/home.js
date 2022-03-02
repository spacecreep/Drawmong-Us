var pseudo;

function EnterPseudo() {
    pseudo = this.document.getElementById("PseudoInput").value;

    if(pseudo == ""){return;}

    this.document.getElementById("ChooseName").style.display = "none";
    this.document.getElementById("LobbySelection").style.display = "flex";
    this.document.getElementById("PseudoPlayer").innerHTML = `Bienvenue ${pseudo} !`;

    return;

}
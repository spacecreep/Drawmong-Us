var pseudo;

function EnterPseudo() {
    pseudo = this.document.getElementById("PseudoInput").value;
    setCookie('pseudo', pseudo, dtExpire,'/' );

    if(pseudo == ""){return;}

    this.document.getElementById("ChooseName").style.display = "none";
    this.document.getElementById("LobbySelection").style.display = "flex";
    this.document.getElementById("PseudoPlayer").innerHTML = `Bienvenue ${pseudo} !`;

    return;

}

function setCookie(nom, valeur, expire, chemin, domaine, securite){
    document.cookie = nom + ' = ' + escape(valeur) + '  ' +
        ((expire == undefined) ? '' : ('; expires = ' + expire.toGMTString())) +
        ((chemin == undefined) ? '' : ('; path = ' + chemin)) +
        ((domaine == undefined) ? '' : ('; domain = ' + domaine)) +
        ((securite == true) ? '; secure' : '');
}

function ShowLobby(){
    document.getElementById("create-lobby-button").style.display = "none";
    document.getElementById("settings-form").style.display = "flex";
    document.getElementById("Joueurs").style.display = "block";
}

var dtExpire = new Date();
dtExpire.setTime(dtExpire.getTime() + 3600 * 1000);

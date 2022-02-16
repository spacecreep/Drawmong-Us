function test() {
    var pseudo = this.document.getElementById("PseudoInput").value

    this.document.getElementById("ChooseName").style.display = "none";
    this.document.getElementById("JoinGame").style.display = "block";
    this.document.getElementById("CreateGame").style.display = "block";
    this.document.getElementById("PseudoText").style.display = "block";
    var txt = this.document.getElementById("PseudoText");
    txt.innerHTML = "<H3>Bienvenue " + pseudo + " !!!</H3>";

}
<!DOCTYPE HTML>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>

<link rel="shortcut icon" type="image/ico" href="ressources/favicon.ico"/>

<link rel="stylesheet" href="css/paint.css"/>

<head>
    <title>Drawmong-Us, A toi de Jouer !</title>
</head>

<body onload="debut()">





<div id="titreJoue" class="Title">
    <h1>A toi de Jouer !</h1>
</div>
<div id="titreObs" class="Title">
    <h1>Devine qui est le Dess'Imposteur !</h1>
</div>
<div id="titreVote" class="Title">
    <h1>Vote pour qui tu penses être le Dess'Imposteur !</h1>
</div>

<div>
    <form name="chronoForm">
        <input type="text" name="chronotime" id="chronotime" value=${temps}/>
        <input type="button" name="startstop" value="start!" onClick="chronoStart()" />
        <input type="button" name="reset" value="reset!" onClick="chronoReset()" />
    </form>
</div>

<div style="display: flex">
    <div class="Select">
        <div>Choisis la couleur</div>
        <div class=Color id="grey" style="background-color: grey" onclick="color(this)"></div>
        <div class=Color id="red" style="background-color: red" onclick="color(this)"></div>
        <div class=Color id="orange" style="background-color: orange" onclick="color(this)"></div>
        <div class=Color id="yellow" style="background-color: yellow" onclick="color(this)"></div>
        <div class=Color id="green" style="background-color: green" onclick="color(this)"></div>
        <div class=Color id="cyan" style="background-color: cyan" onclick="color(this)"></div>
        <div class=Color id="blue" style="background-color: blue" onclick="color(this)"></div>
        <div class=Color id="purple" style="background-color: purple" onclick="color(this)"></div>
        <br>
        <div class=Color id="black" style="background-color: black" onclick="color(this)"></div>
        <div class=Color id="brown" style="background-color: saddlebrown" onclick="color(this)"></div>
        <div class=Color id="coral" style="background-color: coral" onclick="color(this)"></div>
        <div class=Color id="greenyellow" style="background-color: greenyellow" onclick="color(this)"></div>
        <div class=Color id="seagreen" style="background-color: mediumseagreen" onclick="color(this)"></div>
        <div class=Color id="darkblue" style="background-color: darkslateblue" onclick="color(this)"></div>
        <div class=Color id="mediumpurple" style="background-color: mediumpurple" onclick="color(this)"></div>
        <div class=Color id="pink" style="background-color: hotpink" onclick="color(this)"></div>

        <div>Choisis la taille</div>
        <div class=tinysize id="petit" style="background-color: black" onclick="color(this)"></div>
        <div class=middlesize id="moyen" style="background-color: black" onclick="color(this)"></div>
        <div class=bigsize id="grand" style="background-color: black" onclick="color(this)"></div>
        <img src="https://i.imgur.com/WGN7g7x.png?1"  id="remplissage" onclick="color(this)">
        <div class=Eraser>
            <div>Gomme</div>
            <div class=Eraser_click id="white" style="background-color: white"   onclick="color(this)"></div>
        </div>
        <div id="afficheMot">
        <div class="afficheMot">

        </div>

    </div>

    <span id="interface">

    <canvas id="can" class="Whiteboard" height="500px" width="800px"></canvas>


    <img id="canvasimg" class="Affiche" >
    </span>

    <span class=ChatBox>
        <h2 id="titreChat">Chat</h2>
        <textarea readonly="true" rows="18" cols="80" id="log" ></textarea>
        <div id="envoiMes">
            <input type="text" size="51" id="msg" placeholder="Message" />
            <button type="button" onclick="client.send();">Send</button>
        </div>
    </span>
    <span id="Votes" class="Votes">
        <div class="votediv">
            <h4 style="margin: 5px">PSEUDO DU JOUEUR</h4>
            <button style="margin: 5px">Voter</button>
        </div>
        <div class="votediv">
            <h4 style="margin: 5px">PSEUDO DU JOUEUR</h4>
            <button style="margin: 5px">Voter</button>
        </div>
        <div class="votediv">
            <h4 style="margin: 5px">PSEUDO DU JOUEUR</h4>
            <button style="margin: 5px">Voter</button>
        </div>
        <div class="votediv">
            <h4 style="margin: 5px">PSEUDO DU JOUEUR</h4>
            <button style="margin: 5px">Voter</button>
        </div>

    </span>
</div>


<div class=Param>
    <button id="jeu" onclick="etat('jeu')">jouer</button>
    <button id="obs" onclick="etat('obs')">observer</button>
    <button id="vote" onclick="etat('Vote')">voter</button>
    <button id="start" onclick="client.start()">Start</button>
</div>
<H1>Recapitulatif des informations</H1>
<UL>
    <p id = "numerotour">0</p>
    <p id = "numerojoueur"></p>
    <p id = "nbjoueur"></p>
    <p>Probablitite des mots personnalises: ${proba}%</p>
    <p>mots: ${mots}</p>
    <p>langue: ${sessionScope['langue']}</p>
    <p>Room publique: ${publique}</p>
    <p>Joueurs max: ${max}</p>
    <p>Nombre de manches: ${manches}</p>
    <p>Temps de dessin: ${temps}s</p>

</UL>
</body>


<script type="text/javascript" src="js/paint.js"></script>
<script src="js/chat.js"></script>
<script type="application/javascript">
    /**window.onload = chronoStart;*/
    function chrono(){
        end = new Date()
        diff = end - start
        diff = new Date(diff)
        var sec = diff.getSeconds()
        var msec = diff.getMilliseconds()


        if (sec < 10){
            sec = "0" + sec
        }
        if (sec ==${temps}){
            if (parseInt(document.getElementById("numerotour").innerText) > parseInt(document.getElementById("nbjoueur").innerText.substring(20))) {
                document.getElementById("numerotour").innerText = "0"
            }
            document.getElementById("numerotour").innerText = parseInt(document.getElementById("numerotour").innerText) + 1 + "";
            chronoReset()
            if (parseInt(document.getElementById("numerojoueur").innerText) != parseInt(document.getElementById("numerotour").innerText)) {
                etat('obs');
                console.log("oops")
            }
            else {
                etat('jeu');
            }
        }
        if(msec < 10){
            msec = "00" +msec
        }
        else if(msec < 100){
            msec = "0" +msec
        }

        document.getElementById("chronotime").value = sec + ":" + msec
        timerID = setTimeout("chrono()", 10)
    }
    function chronoStart(){
        document.chronoForm.startstop.value = "stop!"
        document.chronoForm.startstop.onclick = chronoStop
        document.chronoForm.reset.onclick = chronoReset
        start = new Date()
        chrono()
    }
    function chronoContinue(){
        document.chronoForm.startstop.value = "stop!"
        document.chronoForm.startstop.onclick = chronoStop
        document.chronoForm.reset.onclick = chronoReset
        start = new Date()-diff
        start = new Date(start)
        chrono()
    }
    function chronoReset(){
        document.getElementById("chronotime").value = "00"
        start = new Date()
    }
    function chronoStopReset(){
        document.getElementById("chronotime").value = "00"
        document.chronoForm.startstop.onclick = chronoStart
    }
    function chronoStop(){
        document.chronoForm.startstop.value = "start!"
        document.chronoForm.startstop.onclick = chronoContinue
        document.chronoForm.reset.onclick = chronoStopReset
        clearTimeout(timerID)
    }
    const client = new ChatClient();

    function debut(){
        client.connect();
        etat("obs");
        init();
        save();
    }

    function etat(eta){
        switch (eta) {
            case "jeu":
                majcanva();
                document.getElementById("can").className ="Whiteboard";
                document.getElementById("canvasimg").className = "Disparu";
                document.getElementById("titreJoue").className = "Title";
                document.getElementById("titreObs").className = "Disparu";
                document.getElementById("titreVote").className = "Disparu";
                document.getElementById("Votes").className = "Disparu";
                break;
            case "obs":
                document.getElementById("can").className ="Disparu";
                document.getElementById("canvasimg").className = "Affiche";
                document.getElementById("titreJoue").className = "Disparu";
                document.getElementById("titreObs").className = "Title";
                document.getElementById("titreVote").className = "Disparu";
                document.getElementById("Votes").className = "Disparu";
                break;
            case "Vote":
                document.getElementById("can").className ="Disparu";
                document.getElementById("canvasimg").className = "Disparu";
                document.getElementById("titreJoue").className = "Disparu";
                document.getElementById("titreObs").className = "Disparu";
                document.getElementById("titreVote").className = "Title";
                document.getElementById("Votes").className = "Votes";
                break;
            default:
                document.getElementById("can").className ="Whiteboard";
                document.getElementById("canvasimg").className = "Affiche";
                document.getElementById("titreJoue").className = "Title";
                document.getElementById("titreObs").className = "Title";
                break;
        }
    }

</script>
</html>
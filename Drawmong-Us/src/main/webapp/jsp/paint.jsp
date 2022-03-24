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
<div id="logo" class="Title">
    <a href="index.jsp">
        <img src="https://i.imgur.com/UR9GTdY.png?1" alt="logo">
    </a>
</div>
<div class="Select">
    <div>Choose Color</div>
    <div class=Color id="green" style="background-color: green" onclick="color(this)"></div>
    <div class=Color id="blue" style="background-color: blue" onclick="color(this)"></div>
    <div class=Color id="red" style="background-color: red" onclick="color(this)"></div>
    <div class=Color id="yellow" style="background-color: yellow" onclick="color(this)"></div>
    <div class=Color id="orange" style="background-color: orange" onclick="color(this)"></div>
    <div class=Color id="black" style="background-color: black" onclick="color(this)"></div>
    <div class=Eraser>
        <div>Eraser</div>
        <div class=Eraser_click id="white" style="background-color: white"   onclick="color(this)"></div>
    </div>

</div>

<div>
    <form name="chronoForm">
        <input type="text" name="chronotime" id="chronotime" value=${temps}/>
        <input type="button" name="startstop" value="start!" onClick="chronoStart()" />
        <input type="button" name="reset" value="reset!" onClick="chronoReset()" />
    </form>
</div>

<div style="display: flex">
    <span id="interface">

    <canvas id="can" class="Whiteboard" height="500px" width="500px"></canvas>


    <img id="canvasimg" class="Affiche" >
    </span>

    <span class=ChatBox>
        <h2 id="titreChat">Chat</h2>
        <textarea readonly="true" rows="21" cols="80" id="log" ></textarea>
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
</div>
<H1>Recapitulatif des informations</H1>
<UL>
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
            chronoReset()
            if (document.getElementById("canvasimg").className == "Disparu") {
                etat('obs');
            }
            else if (document.getElementById("canvasimg").className == "Affiche"){
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
        chronoStart()
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
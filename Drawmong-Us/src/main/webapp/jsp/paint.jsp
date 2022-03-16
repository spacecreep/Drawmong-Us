<!DOCTYPE HTML>
<html>

<link rel="stylesheet" href="css/paint.css"/>

<head>
    <title>Drawmong-Us, A toi de Jouer !</title>
</head>

<body onload="debut()">



<div id="logo" class="Title">
    <img src="https://i.imgur.com/UR9GTdY.png?1">
</div>
<div id="titreJoue" class="Title">
    <h1>A toi de Jouer !</h1>
</div>
<div id="titreObs" class="Title">
    <h1>Devine qui est le Dess'Imposteur !</h1>
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
    <span id="interface">

    <canvas id="can" class="Whiteboard" height="500px" width="500px"></canvas>


    <img id="canvasimg" class="Affiche" >
    </span>

    <span class=ChatBox>
        <h2 id="titreChat">Chat</h2>
        <textarea readonly="true" rows="10" cols="80" id="log" ></textarea>
        <div id="envoiMes">
            <input type="text" size="51" id="msg" placeholder="Message" />
            <button type="button" onclick="client.send();">Send</button>
        </div>
    </span>
</div>


<div class=Param>
    <button id="jeu" onclick="etat('jeu')">jouer</button>
    <button id="obs" onclick="etat('obs')">observer</button>
</div>
</body>


<script type="text/javascript" src="js/paint.js"></script>
<script src="js/chat.js"></script>
<script type="application/javascript">
    const client = new ChatClient();

    function debut(){
        client.connect();
        etat("obs");
        init();
        save();
        /**etat("obs");

        client.connect();
         */
    }

    function etat(eta){
        switch (eta) {
            case "jeu":
                document.getElementById("can").className ="Whiteboard";
                document.getElementById("canvasimg").className = "Disparu";
                document.getElementById("titreJoue").className = "Title";
                document.getElementById("titreObs").className = "Disparu";
                break;
            case "obs":
                document.getElementById("can").className ="Disparu";
                document.getElementById("canvasimg").className = "Affiche";
                document.getElementById("titreJoue").className = "Disparu";
                document.getElementById("titreObs").className = "Title";
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
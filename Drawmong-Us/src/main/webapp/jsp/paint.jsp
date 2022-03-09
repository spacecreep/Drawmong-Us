<!DOCTYPE HTML>
<html>

<link rel="stylesheet" href="css/paint.css"/>

<head>
    <title>Drawmong-Us, A toi de Jouer !</title>
</head>

<body onload="debut()">



<div class="Title">
    <img src="https://i.imgur.com/tMwQRoc.png?1">
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

    <div id="Whiteboard">
        <canvas id="can" height="500px" width="500px"></canvas>
    </div>


    <div id="Affiche">
        <img id="canvasimg">
    </div>


    <div class=ChatBox>
        <h1>Chat</h1>
        <div id="boiteChat">
            <textarea readonly="true" rows="10" cols="80" id="log" ></textarea>
            <div>
                <input type="text" size="51" id="msg" placeholder="Message"/>
                <button type="button" onclick="client.send();">Send</button>
            </div>
        </div>
    </div>
</div>


<div class=Param>
    <button id="btn" onclick="etat('jeu')">jouer</button>
    <button id="clr" onclick="etat('obs')">observer</button>
</div>
</body>


<script type="text/javascript" src="js/paint.js"></script>
<script src="js/chat.js"></script>
<script type="application/javascript">
    const client = new ChatClient();

    function debut(){
        init();
        save();
        etat("obs");

        client.connect();
    }

    function etat(eta){
        switch (eta) {
            case "jeu":
                document.getElementById("Whiteboard").style.display = "inline-block";
                document.getElementById("can").style.display = "inline-block";
                document.getElementById("Affiche").style.display = "none";
                break;
            case "obs":
                document.getElementById("Affiche").style.display = "inline-block";
                document.getElementById("Whiteboard").style.display = "none";
                document.getElementById("can").style.display = "none";
                break;
            default:
                document.getElementById("Whiteboard").style.display = "inline-block";
                document.getElementById("can").style.display = "inline-block";
                document.getElementById("Affiche").style.display = "inline-block";
                break;
        }
    }

</script>
</html>
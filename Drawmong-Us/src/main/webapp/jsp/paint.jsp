<!DOCTYPE HTML>
<html>

<link rel="stylesheet" href="css/paint.css"/>

<head>
    <title>Drawmong-Us, A toi de Jouer !</title>
</head>

<body onload="init()">


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

    <div class="Whiteboard" id="main">
        <canvas id="can" height="500px" width="500px"></canvas>
    </div>


    <div class=Affiche>
        <img id="canvasimg">
    </div>


    <div class=ChatBox>
        <h1>Chat</h1>
        <div id="boiteChat">
            <div>
                <input type="text" id="username" placeholder="Username"/>
                <button type="button" onclick="client.connect();">Connect</button>
            </div>
            <textarea readonly="true" rows="10" cols="80" id="log" ></textarea>
            <div>
                <input type="text" size="51" id="msg" placeholder="Message"/>
                <button type="button" onclick="client.send();">Send</button>
            </div>
        </div>
    </div>
</div>


<div class=Param>
    <button id="btn" onclick="save()">save</button>
    <button id="clr" onclick="erase()">clear</button>
</div>
</body>


<script type="text/javascript" src="js/paint.js"></script>
<script src="js/chat.js"></script>
<script type="application/javascript">
    const client = new ChatClient();
</script>
</html>
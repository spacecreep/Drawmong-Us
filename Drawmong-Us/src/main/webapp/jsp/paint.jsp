<!DOCTYPE HTML>
<html>

<link rel="stylesheet" href="css/paint.css"/>

<script type="text/javascript" src="js/paint.js"></script>

<body onload="init()">
<div>
    <div class="Whiteboard" id="main">
        <canvas id="can" height="500px" width="500px"></canvas>
    </div>
    <div class=Affiche>
        <img id="canvasimg">
    </div>
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
<div class=Param>
    <button id="btn" onclick="save()">save</button>
    <button id="clr" onclick="erase()">clear</button>
</div>
</body>
</html>
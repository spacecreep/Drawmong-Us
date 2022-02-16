<!DOCTYPE HTML>
<html>

<link rel="stylesheet" href="css/paint.css"/>

<script type="text/javascript" src="js/paint.js"></script>

<body onload="init()">
<div id="main">
    <canvas class="Whiteboard" id="can" height="500px" width="500px"></canvas>
</div>
<div class="Select">
    <div>Choose Color</div>
    <div class=Color id="green" style="background-color: green" onclick="color(this)"></div>
    <div class=Color id="blue" style="background-color: blue" onclick="color(this)"></div>
    <div class=Color id="red" style="background-color: red" onclick="color(this)"></div>
    <div class=Color id="yellow" style="background-color: yellow" onclick="color(this)"></div>
    <div class=Color id="orange" style="background-color: orange" onclick="color(this)"></div>
    <div class=Color id="black" style="background-color: black" onclick="color(this)"></div>
    <div>Eraser</div>
    <div id="white" onclick="color(this)"></div>

</div>
<button id="btn" onclick="save()">save</button>
<button id="clr" onclick="erase()">clear</button>
<img id="canvasimg">
</body>
</html>
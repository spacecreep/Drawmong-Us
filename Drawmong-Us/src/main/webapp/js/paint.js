var canvas, ctx, flag = false,
    prevX = 0,
    currX = 0,
    prevY = 0,
    currY = 0,
    dot_flag = false;

var x = "black",
    y = 2;

function init() {
    //setCookie('pseudo', 'aaaaaaaa', dtExpire,'/' );

    canvas = document.getElementById('can');
    ctx = canvas.getContext("2d");
    let w = canvas.width;
    let h = canvas.height;

    canvas.addEventListener("mousemove", function (e) {
        findxy('move', e)
    }, false);
    canvas.addEventListener("mousedown", function (e) {
        findxy('down', e)
    }, false);
    addEventListener("mouseup", function (e) {
        findxy('up', e);
        save()
        majcanva();
        save()
    }, false);

}

function color(obj) {
    switch (obj.id) {
        case "green":
            x = "green";
            break;
        case "blue":
            x = "blue";
            break;
        case "red":
            x = "red";
            break;
        case "yellow":
            x = "yellow";
            break;
        case "orange":
            x = "orange";
            break;
        case "black":
            x = "black";
            break;
        case "white":
            x = "white";
            break;
    }
    if (x === "white") y = 14;
    else y = 2;


}

function draw() {
    ctx.beginPath();
    ctx.moveTo(prevX, prevY);
    ctx.lineTo(currX, currY);
    ctx.strokeStyle = x;
    ctx.lineWidth = y;
    ctx.stroke();
    ctx.closePath();
}
/**
function erase() {
    var m = confirm("Want to clear");
    if (m) {
        ctx.clearRect(0, 0, w, h);
        document.getElementById("canvasimg").style.display = "none";
    }
}
*/

function save() {
    try {
        document.getElementById("canvasimg").src = canvas.toDataURL();
        client.sendimg();
    } catch(e) {
        console.log(e);
    }
}

function findxy(res, e) {
    if (res === 'down') {
        prevX = currX +scrollX;
        prevY = currY +scrollY;
        currX = e.clientX - canvas.offsetLeft + scrollX;
        currY = e.clientY - canvas.offsetTop + scrollY;

        flag = true;
        dot_flag = true;
        if (dot_flag) {
            ctx.beginPath();
            ctx.fillStyle = x;
            ctx.fillRect(currX, currY, 2, 2);
            ctx.closePath();
            dot_flag = false;
        }
    }
    if (res === 'up' || res === "out") {
        flag = false;
    }
    if (res === 'move') {
        if (flag) {
            prevX = currX;
            prevY = currY;
            currX = e.clientX - canvas.offsetLeft + scrollX;
            currY = e.clientY - canvas.offsetTop + scrollY;
            draw();
        }
    }
}

class PaintClient {
    webSocket;

    connect() {

    }
}

function setCookie(nom, valeur, expire, chemin, domaine, securite){
    document.cookie = nom + ' = ' + escape(valeur) + '  ' +
        ((expire == undefined) ? '' : ('; expires = ' + expire.toGMTString())) +
        ((chemin == undefined) ? '' : ('; path = ' + chemin)) +
        ((domaine == undefined) ? '' : ('; domain = ' + domaine)) +
        ((securite == true) ? '; secure' : '');
}

var dtExpire = new Date();
dtExpire.setTime(dtExpire.getTime() + 3600 * 1000);

function majcanva() {
    var canvas = document.getElementById('can');
    var ctx = canvas.getContext('2d');
        ctx.drawImage(document.getElementById('canvasimg'),0,0,500,500,0,0,500,500);
    }
// HTML5 canvas, save jpeg blob and restore to canvas from blob
function blob2canvas(canvas,blob){
  var img = new Img;
  var ctx = canvas.getContext('2d');
  img.onload = function () {
    ctx.drawImage(img,0,0);
  }
  img.src = blob;
}

// The blob was received when calling canvas.toDataURL("image/jpeg")
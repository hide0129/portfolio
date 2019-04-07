var flug = true;
var fps = 30;
var frameTime = 1000 / fps;

var scroll = null;
var opacityNow = null;
var opacity = null;
var title = null;

window.onload = function(){
    title = document.getElementById('title');
    title.style.opacity = 1
    opacity = 1
}

$(window).scroll(function(){
  if(flug){
    flug = false;
    setTimeout(function(){

      scroll = window.pageYOffset;

      if (scroll < 100) {
        if (opacity != 1) {
          title.style.opacity = 1
          opacity = 1
        }
      } else if (scroll < 160) {
        opacityNow = 1-(scroll-100)/60
        title.style.opacity = opacityNow
        opacity = opacityNow
      } else {
        if (opacity != 0) {
          title.style.opacity = 0
          opacity = 0
        }
      }

      flug = true;
      return flug;
    }, frameTime);
  }
});

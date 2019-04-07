var isScrollable = true;

function resizeNav() {
    // Set the nav height to fill the window
    $("#nav-fullscreen").css({"height": window.innerHeight});

    // Set the circle radius to the length of the window diagonal,
    // this way we're only making the circle as big as it needs to be.
    var radius = Math.sqrt(Math.pow(window.innerHeight, 2) + Math.pow(window.innerWidth, 2));
    var diameter = radius * 2;
    $("#nav-overlay").width(diameter);
    $("#nav-overlay").height(diameter);
    console.log(diameter)
    $("#nav-overlay").css({"margin-top": -radius, "margin-left": -radius});
}

//スクロール禁止用関数
function disableScroll(){
//PC用
  var scroll_event = 'onwheel' in document ? 'wheel' : 'onmousewheel' in document ? 'mousewheel' : 'DOMMouseScroll';
  $(document).on(scroll_event,function(e){e.preventDefault();},{passive: false});
  //SP用
  $(document).on('touchmove.noScroll', function(e) {e.preventDefault();},{passive: false});

  console.log('禁止');
}

//スクロール復活用関数
function enableScroll(){
  //PC用
  var scroll_event = 'onwheel' in document ? 'wheel' : 'onmousewheel' in document ? 'mousewheel' : 'DOMMouseScroll';
  $(document).off(scroll_event);
  //SP用
  $(document).off('.noScroll');

  console.log('解除');
}

function toggleScroll(){
  if (isScrollable) {
    // disableScroll();
    window.on('touchmove.noScroll', e => {
        e.preventDefault();
    });
  } else {
    // enableScroll();
    window.off('.noScroll');
  }
  isScrollable = !isScrollable
}

// Set up click and window resize callbacks, then init the nav.
$(document).ready(function() {
    $("#nav-toggle").click(function() {
        $("#nav-toggle, #nav-overlay, #nav-fullscreen").toggleClass("open");
        toggleScroll()
    });

    $(window).resize(resizeNav);

    resizeNav();


});

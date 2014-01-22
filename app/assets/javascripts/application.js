// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

function onPlayerReady(event) {
  event.target.playVideo();
}

function onPlayerStateChange (state) {
  console.log(state);
  console.log(state.target.getVideoUrl())
  console.log(state.target.getDuration())
  console.log(state.target.getVideoEmbedCode())
  console.log(player.getCurrentTime())
  switch (state.data) {
    case 0:
      // Video is unstarted
      console.log('video event 0: ended');
      $.post( "/events", { video: state.target.getVideoUrl(), status: "stop"} );
      break;   
    case 1:
      // Video is now playing
      console.log('video event 1: playing');
      $.post( "/events", { video: state.target.getVideoUrl(), status: "start"} );
      break; 
    case 2:
      // Video is now paused
      console.log('video event 2: paused');
      $.post( "/events", { video: state.target.getVideoUrl(), status: "stop"} );
      break; 
    case 3:
      // Video is now buffering
      console.log('video event 3: buffering');
      break;
  }
}
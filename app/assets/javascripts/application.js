// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require parallax
//= require_tree .

//= require underscore
//= require gmaps/google




$(document).ready(function () {

   $("#btn-right").mouseover(function(){
         $(".body-2-left").css("background-color", "white");
         $(".body-2-right-2").addClass("feeder-bg");
         $(".body-2-right-2").find(".panel").css("display", "block");
         
          $(".body-2-right").animate({
            
            right: '0'
        });
         $(".body-2-right").css("z-index", "99");
          $(".body-2-left").css("z-index", "1");
     });

   $(".body-2-right").mouseleave(function(){

      $(".body-2-left").css("background-color", "#75B9DC");
      $(".body-2-right-2").removeClass("feeder-bg");
      $(".body-2-right-2").find(".panel").css("display", "none");
         $(".body-2-right").animate({
            
            right: '-30%'
        });
         $(".body-2-right").css("z-index", "99");
         $(".body-2-left").css("z-index", "1");
         
     });

   $("#btn-left").mouseenter(function(){
         $(".body-2-right").css("background-color", "white");
         $(".body-2-left-1").addClass("org-bg");
         $(".body-2-left-1").find(".panel").css("display", "block");
          $(".body-2-left").animate({
            left: '0'
        });
         $(".body-2-left").css("z-index", "99");
         $(".body-2-right").css("z-index", "1");
     });
   $(".body-2-left").mouseleave(function(){


        $(".body-2-right").css("background-color", "#75B9DC");
        $(".body-2-left-1").removeClass("org-bg");
        $(".body-2-left-1").find(".panel").css("display", "none");
         $(".body-2-left").animate({
            
            left: '-30%'
        });
         $(".body-2-left").css("z-index", "99");
          $(".body-2-right").css("z-index", "1");
     
        
     });
	

});
      // 2. This code loads the IFrame Player API code asynchronously.
      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      var player;
      function onYouTubeIframeAPIReady() {
        player = new YT.Player('player', {
          height: '720',
          width: '1280',
          videoId: '211bWklh5Fo',
          playerVars: { 'autoplay': 1, 'controls': 0, 'start': 17, 'end': 107, 'showinfo': 0, 'rel': 0 },

         
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
          }
        });
      }

      // 4. The API will call this function when the video player is ready.
      function onPlayerReady(event) {
        event.target.playVideo();
        player.mute();
      }

      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      //    the player should play for six seconds and then stop.
      var done = false;
      function onPlayerStateChange(event) {
        // if (event.data == YT.PlayerState.PLAYING && !done) {
        //   setTimeout(stopVideo, 6000);
        //   done = true;
        // }
      }
      function stopVideo() {
        player.stopVideo();
      }
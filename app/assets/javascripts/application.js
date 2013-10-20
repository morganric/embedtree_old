// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require masonry/jquery.event-drag
//= require masonry/jquery.imagesloaded.min
//= require masonry/jquery.infinitescroll.min
//= require masonry/modernizr-transitions
//= require masonry/jquery.masonry
//= require rails.validations
//= require_tree .
//



$( document ).ready(function() {


  console.log( "ready!" );

  $('img').load(function(){
	            $('#masonry-container').masonry();
	        });

	$(function(){  
	  $('#masonry-container').masonry({
	    itemSelector: '.box',
	    isFitWidth: true

	  });

	});

  $('.dropdown-toggle').dropdown(); 


  $('label.label.label-rich a').html('Audio').prepend('<i class="icon-music icon-white"></i> ');
  $('label.label.label-video a').prepend('<i class="icon-film icon-white"></i> ');
  $('label.label.label-photo a').prepend('<i class="icon-picture icon-white"></i> ');
  $('label.label.label-link a').prepend('<i class="icon-bookmark icon-white"></i> ');

  $('.delete_user_post').on('click', function() {
   		$(this).fadeOut();
  });

});


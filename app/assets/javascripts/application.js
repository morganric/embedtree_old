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
//= require masonry/modernizr-transitions
//= require masonry/jquery.masonry
//= require masonry/jquery.infinitescroll.min
//= require rails.validations
//= require modernizr
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
	    isFitWidth: true,
      isAnimated: false,
      transitionDuration: 0,
      // animationOptions: {
      //     duration: 50,
      //     easing: 'linear',
      //     queue: false
      //   },
      // isAnimated: !Modernizr.csstransitions,
      "isOriginLeft": true,
      hiddenStyle: { opacity: 0, transform: 'scale(0.001)' },
      visibleStyle: { opacity: 1, transform: 'scale(1)' }

	  });

	});

  var $container = $('#masonry-container');



  $container.infinitescroll({
    navSelector  : '.pagination',    // selector for the paged navigation 
    nextSelector : '.pagination a[rel=next]',  // selector for the NEXT link (to page 2)
    itemSelector : '.box',     // selector for all items you'll retrieve
    loading: {
        finishedMsg: 'No more pages to load.',
        img: 'http://i.imgur.com/6RMhx.gif'
      }
    },
    // trigger Masonry as a callback
    function( newElements ) {
      // hide new items while they are loading
      var $newElems = $( newElements ).css({ opacity: 0 });
      // ensure that images load before adding to masonry layout


      $newElems.imagesLoaded(function(){
        // show elems now they're ready
        $newElems.animate({ opacity: 1 });
        $container.masonry( 'appended', $newElems, true ); 

      });
    }
  );
  
  console.log( " infinite posts!" );

  $('.dropdown-toggle').dropdown(); 


  $('label.label.label-rich a').html('Audio').prepend('<i class="icon-music icon-white"></i> ');
  $('label.label.label-video a').prepend('<i class="icon-film icon-white"></i> ');
  $('label.label.label-photo a').prepend('<i class="icon-picture icon-white"></i> ');
  $('label.label.label-link a').prepend('<i class="icon-bookmark icon-white"></i> ');

  $('.delete_user_post').on('click', function() {
      $(this).toggleClass('hidden');
      $(this).siblings().toggleClass('hidden');
  });

  $('.user_post').on('click', function() {
      $(this).toggleClass('hidden');
      $(this).siblings().toggleClass('hidden');
  });

});


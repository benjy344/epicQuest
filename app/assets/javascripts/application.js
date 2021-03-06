// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// require rails-ujs
//= require jquery
//= require jquery_ujs
//= require vue
//= require vue-resource
//= require vuex
//= require ./main.coffee
//= require_tree .


Vue.development_mode = true


$('.js-toggle-nav').click(function(){
    Window.mainNav.toggle()
})

$('body').find('.js-item-to-extend').on('click', function(e) {
	$(this).parent().toggleClass('expend')
})

$('body').find('.inventoryButton, .js-close-bag').on('click', function(e) {
	$('body').find('#inventory').toggleClass('open')
})
init = function() {
	// $introScreen  = $('body').find( '.titleScreen' )
	// $starBtn      = $introScreen.find( '.js-start' )
	$rooms        = $('body').find( '.js-room' )
	$interactives = $rooms.find( '.interactive' )
	$nextRoomBtn  = $rooms.find( '.js-next-room' )
	$prevRoomBtn  = $rooms.find( '.js-prev-room' )
	$addItem      = $rooms.find( '.js-add-item' )
	$monster      = $rooms.find( '.monster' )
	$enterFight   = $rooms.find( '.js-get-fight' )
	$fightplace   = $('body').find( '.js-fightplace' )

	if($interactives.length) {
		$interactives.off('click')
		$interactives.on('click', toggleTooltip)
	}
	// if($nextRoomBtn.length) {
	// 	$nextRoomBtn.off('click')
	// 	$nextRoomBtn.on('click', ChangeRoom)
	// }

	// if($prevRoomBtn.length) {
	// 	$prevRoomBtn.off('click')
	// 	$prevRoomBtn.on('click', ChangeRoom)
	// }

	if($monster.length) {
		$monster.off('click')
		$monster.on('click', toggleTooltip)
		var divs = $monster.find('.smoke');

		for (var i = 0; i < divs.length; i++) {
		    var div = divs[i];

		    var animate = div.animate([{
		        transform: 'scale(0) translateX(' + Math.random() * (0 - 100) + 0 +'%) translateY(' + Math.random() * (0 - 100) + 0 + '%)',
		        opacity: 0,
		        offset: 0
		    }, {
		        transform: 'scale(' + Math.random() * (0 - 1) + 0 + ') translateX(' + Math.random() * (0 - 100) + 0 + '%) translateY(' + Math.random() * +-(0 - 100) + 0 + '%)',
		        opacity: 1,
		        offset: 1
		    }, ], {
		        duration: 2500,
		        easing: 'cubic-bezier(0.68, -0.55, 0.265, 1.55)',
		        delay: i * 100,
		        iterations: Infinity,
		        direction: 'alternate',
		        fill: 'both'
		    });
		}
	}

}


var ChangeRoom, skipIntro, toggleTooltip

// skipIntro = function() {
//   return $introScreen.css({
//     'display': 'none'
//   })
// }

toggleTooltip = function(e) {
  if (!$(this).hasClass('tooltip-active')) {
    $this = $(this)
    $interactives.removeClass('tooltip-active')
    if ($(this).hasClass('avatar') ) {
      $.get({
        url: "/avatars/"+$('.js-user-info').attr('data-avatar-id')+".json",
        success: (data) => {
          avatar      = JSON.parse(JSON.stringify(data.avatar))
          items       = JSON.parse(JSON.stringify(data.items))
          $this.find('.js-gold').text(avatar.gold+' Gold')
          for (k = 0, len1 = items.length; k < len1; k++) {
            item = items[k];
            switch (item.id) {
              case avatar.id_sword:
                $this.find('.js-sword').removeClass('hidden').text(item.name)
                break;
              case avatar.id_shield:
                $this.find('.js-shield').removeClass('hidden').text(item.name)
                break;
              case avatar.id_armor:
                $this.find('.js-armor').removeClass('hidden').text(item.name)
            }
            if (avatar.id_sword === null) {
              $this.find('.js-sword').addClass('hidden')
            }
            if (avatar.id_shield === null) {
              $this.find('.js-shield').addClass('hidden')
            }
            if (avatar.id_armor === null) {
              $this.find('.js-armor').addClass('hidden')
            }
          }
        }

      })
    }
    return $(this).toggleClass('tooltip-active')
  } else {
    return $(this).toggleClass('tooltip-active')
  }
}

ChangeRoom = function(e) {
  var $target, $trigger
  $trigger = $(this)
  $target = $('.js-room-' + $trigger.attr('data-next'))
  if ($target.length > 0) {
    $rooms.removeClass('active')
    return $target.addClass('active')
  }
}

init()

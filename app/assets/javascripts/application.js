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


$('.js-toggle-nav, .overlay').click(function(){
    $('.js-main-nav').toggleClass('open')
    return false
})

$('body').find('.js-item-to-extend').on('click', function(e) {
	$(this).parent().toggleClass('expend')
})

$('body').find('.inventoryButton, .js-close-bag').on('click', function(e) {
	$('body').find('#inventory').toggleClass('open')
})
init = function() {

	console.log('init')
	$introScreen  = $('body').find( '.titleScreen' )
	$starBtn      = $introScreen.find( '.js-start' )
	$rooms        = $('body').find( '.js-room' )
	$interactives = $rooms.find( '.interactive' )
	$nextRoomBtn  = $rooms.find( '.js-next-room' )
	$prevRoomBtn  = $rooms.find( '.js-prev-room' )
	$addItem      = $rooms.find( '.js-add-item' )
	$monster      = $rooms.find( '.monster' )
	$enterFight   = $rooms.find( '.js-get-fight' )
	$fightplace   = $('body').find( '.js-fightplace' )


	if($starBtn.length) {
		$starBtn.off('click')
		$starBtn.on('click', skipIntro)
	}
	if($interactives.length) {
		$interactives.off('click')
		$interactives.on('click', toggleTooltip)
	}
	if($nextRoomBtn.length) {
		$nextRoomBtn.off('click')
		$nextRoomBtn.on('click', ChangeRoom)
	}

	if($prevRoomBtn.length) {
		$prevRoomBtn.off('click')
		$prevRoomBtn.on('click', ChangeRoom)
	}

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

skipIntro = function() {
  return $introScreen.css({
    'display': 'none'
  })
}

toggleTooltip = function(e) {
  if (!$(this).hasClass('tooltip-active')) {
    $interactives.removeClass('tooltip-active')
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

initFight = function(monster) {
	console.log(monster)
}

init()

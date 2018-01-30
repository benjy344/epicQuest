# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$introScreen  = null
$starBtn      = null
$rooms        = null
$interactives = null

$(document).ready () ->
	$introScreen  = $('body').find '.titleScreen'
	$starBtn      = $introScreen.find '.js-start'

	$rooms        = $('body').find '.js-room'
	$interactives = $rooms.find '.interactive'

	$starBtn.on 'click', skipIntro

	$interactives.on 'click', toggleTooltip



skipIntro = () ->
	$introScreen.css {'display': 'none'}

toggleTooltip = (e) ->
	if !$(this).hasClass 'tooltip-active'
		$interactives.removeClass 'tooltip-active'
		$(this).toggleClass 'tooltip-active'
	else
		$(this).toggleClass 'tooltip-active'
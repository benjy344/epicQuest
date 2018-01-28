$(document).ready( ->
	$showLoginButton  = $('body').find('#showLogin')
	$showLogin        = $('body').find('.login')
	$showSignupButton = $('body').find('#showSignUp')
	$showSignup       = $('body').find('.signup')


	$showSignup.css({'display':'none'})

	$showLoginButton.on('click', (e) ->
		$showSignup.css({'display':'none'})
		$showLogin.css({'display':'block'})

	)
	$showSignupButton.on('click', (e) ->
		$showSignup.css({'display':'block'})
		$showLogin.css({'display':'none'})

	)

)


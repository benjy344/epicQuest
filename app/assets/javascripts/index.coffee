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


if !Window.town? && $('#town').length > 0
	Window.town = new Vue
		el: '#town'
		data:
			avatar        : {}
			items         : []
			avatarQuests  : []
			sortedItems   : []
			forge         : []
			loading       : true
			activeTooltip : null
			forgeOpen     : false
			guildOpen     : false
			expend        : null
			expendForge   : null
			expendGuild   : null
			quests        : []
		mounted: () ->
			_this = this
			this.loadData(-> _this.loading = false)
		methods:
			loadData: (cb) ->
				_this = this
				$.get
					url: "/avatars/#{$('#town').attr('data-avatar-id')}.json"
					success: (data)->
						_this.avatar       = JSON.parse(JSON.stringify(data.avatar))
						_this.items        = JSON.parse(JSON.stringify(data.items))
						_this.avatarQuests = JSON.parse(JSON.stringify(data.quests))
						_this.sortedItems  = []
						for item, index in _this.items
							item.count = 0
							for itemCount, indexCount in _this.items when itemCount.id is item.id
								item.count++
							aleradyExist = false
							for sortedItem in _this.sortedItems when item.id is sortedItem.id
								aleradyExist = true
							_this.sortedItems.push item if !aleradyExist

						cb() if cb? && typeof cb is "function"
						_this.$forceUpdate()
			setFocus: (index) ->
				this.expend = if this.expend == index then null else index
			setForgeFocus: (index) ->
				this.expendForge = if this.expendForge == index then null else index
			setGuildFocus: (index) ->
				this.expendGuild = if this.expendGuild == index then null else index
			isSitedObject: (id) ->
				return (id == this.avatar.id_sword || this.avatar.id_armor || this.avatar.id_shield)
			rest: ->
				_this = this
				_this.loading = true
				$.get
					url: "/rest"
					success: (data)->
						_this.loadData ->
							setTimeout ->
								_this.loading = false
							, 2000
			buy: (item) ->
				_this = this
				$.get
					url: "/buy?item_id=#{item.id}"
					success: (data)->
						_this.loadData()
			sale: (item) ->
				_this = this
				$.get
					url: "/sale?item_id=#{item.id}"
					success: (data)->
						_this.loadData()
			isActiveQuest: (id) ->
				for avQuest in this.avatarQuests
					if id is avQuest.id
						return true
				return false
			isFinishedQuest: (quest) ->
				for avQuest in this.avatarQuests when quest.id is avQuest.id
					return avQuest.done

			isCompletedQuest: (quest)->
				for item in this.items when item.id is quest.itemToFind
					return true
				return false
			CompletQuest: (id)->
				_this = this
				$.get
					url: "/completQuest?quest_id=#{id}"
					success: (data)->
						_this.loadData()
			startQuest: (id) ->
				_this = this
				$.get
					url: "/startQuest?quest_id=#{id}"
					success: (data)->
						_this.loadData()

			enterForge: ->
				_this = this
				if _this.forgeOpen
					_this.forgeOpen = false
				else
					_this.forgeOpen = true
					_this.loadData ->
						$.get
							url: "/getForge"
							success: (data) ->
								_this.forge = JSON.parse JSON.stringify data.items
			enterGuild: ->
				_this = this
				if _this.guildOpen
					_this.guildOpen = false
				else
					_this.guildOpen = true
					_this.loadData ->
						$.get
							url: "/quests.json"
							success: (data) ->
								_this.quests = JSON.parse JSON.stringify data.quests
			setTooltip: (index) ->
				if this.activeTooltip isnt parseInt index
					this.activeTooltip = parseInt index
				else
					this.activeTooltip = null


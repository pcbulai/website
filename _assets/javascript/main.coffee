do ->
  $ = document.querySelector.bind(document)

  navbar = $('.navdrawer-container')
  appbar = $('.app-bar')
  backdrop = $('.backdrop')
  burgerbutton = $('.menu')
  socialLinks = $('.social-items')

  closeMenu = ->
    appbar.classList.remove('open')
    navbar.classList.remove('open')
    backdrop.classList.remove('open')

  toggleMenu = ->
    appbar.classList.toggle('open')
    navbar.classList.toggle('open')
    backdrop.classList.toggle('open')

  capitalize = (string) ->
    string.charAt(0).toUpperCase() + string.slice(1)

  mpEventName = (evt) ->
    capitalize(evt.target.href.split('#')[1]);

  # Bind stuff now, make it functional, damn it!

  backdrop.addEventListener 'click', closeMenu
  burgerbutton.addEventListener 'click', toggleMenu

  # Ma' man let's close the menu and save MixPanel event when user clicks on items
  navbar.addEventListener 'click', (event) ->
    if event.target.nodeName == 'A' || event.target.nodeName == 'LI'
      mixpanel.track 'Click', 'Section': mpEventName(event)
      closeMenu()

  socialLinks.addEventListener 'click', (event) ->
    if event.target.nodeName == 'A' || event.target.nodeName == 'I'
      if event.target.id == 'email'
        mixpanel.track 'Clicked on email'
      else
        mixpanel.track 'Socializing', 'Social profile': capitalize(event.target.id)

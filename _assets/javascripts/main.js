(function() {

  var $ = document.querySelector.bind(document);

  var navdrawerContainer = $('.navdrawer-container');
  var appbarElement = $('.app-bar');
  var menuBtn = $('.menu');
  var main = $('main');
  var socialLinks = $('.social-items');

  function closeMenu() {
    appbarElement.classList.remove('open');
    navdrawerContainer.classList.remove('open');
  }

  function toggleMenu() {
    appbarElement.classList.toggle('open');
    navdrawerContainer.classList.toggle('open');
  }

  function capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
  }

  function mpEventName(input) {
    return capitalizeFirstLetter(input.target.href.split('#')[1]);
  }

  main.addEventListener('click', closeMenu);
  menuBtn.addEventListener('click', toggleMenu);
  navdrawerContainer.addEventListener('click', function(event) {
    if (event.target.nodeName === 'A' || event.target.nodeName === 'LI') {
      mixpanel.track('Click', {
        'Section': mpEventName(event)
      });
      closeMenu();
    }
  });
  socialLinks.addEventListener('click', function(event) {
    if (event.target.nodeName === 'A' || event.target.nodeName === 'I') {
      if (event.target.id === 'email') {
        mixpanel.track('Clicked on email');
      } else {
        mixpanel.track('Socializing', {
          'Social profile': capitalizeFirstLetter(event.target.id)
        });
      }
    }
  });
})();

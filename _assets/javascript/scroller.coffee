$ ->
  labels.forEach (label) ->
    $('#' + label + '-click').click ->

      $('html, body').animate
        scrollTop: $('#' + label).offset().top
        1000

      $('[data-spy=\'scroll\']').each ->
        $spy = $(@).scrollspy 'refresh'

    $('.to-' + label).click ->
      offset = $('#' + label).offset().top - $('.navbar').height() - 2
      if(window.innerWidth < 767)
        offset = $('#' + label).offset().top - $('.navbar').height() - 62

      $('html, body').animate
        scrollTop: offset
        1000

      $('[data-spy=\'scroll\']').each ->
        $spy = $(@).scrollspy 'refresh'


  # Fixed sidebar sucks. Set width to parent.
  sideResize = ->
    $('.sidebar').width($('.sidebar').parent().width())
  sideResize()

  # Add a listener on window reize
  $(window).resize ->
    sideResize()

  # $('table').addClass 'table table-striped table-bordered'

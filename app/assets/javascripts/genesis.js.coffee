class ApplicationView
  render: ->
    # do nothing, just overwrite this to do something

  cleanup: ->
    # do nothing, just overwrite this to do something

pageLoad = ->
  className = $('body').attr('data-js-class-name')
  window.currentView = try
    eval("new #{className}()")
  catch error
    new ApplicationView()
  window.currentView.render()

$ ->
  pageLoad()

  # turbolinks
  $(document).on 'page:load', pageLoad
  $(document).on 'page:before-change', ->
    window.currentView.cleanup()
    true
  $(document).on 'page:restore', ->
    window.currentView.cleanup()
    pageLoad()
    true


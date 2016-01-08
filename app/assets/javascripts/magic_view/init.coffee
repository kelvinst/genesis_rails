pageLoad = ->
  actionClassName = $('body').data('action-view')
  window.currentView = try
    eval("new #{actionClassName}()")
  catch error
    controllerClassName = $('body').data('controller-view')
    window.currentView = try
      eval("new #{controllerClassName}()")
    catch error
      new MagicView()
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


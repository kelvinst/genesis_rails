class window.<%= class_name %>View extends MagicView
  render: ->
    # override this method and initialize/bind your things for the index page
    # but don't forget to always call super
    super

  cleanup: ->
    # everything you initialize/bind on render, rather destroy/unbind in this
    # method, and don't forget the super
    super


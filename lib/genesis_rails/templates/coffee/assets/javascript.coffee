# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
# These are the suggested classes for the genesis js architecture, feel free to
# extract them to other files

class <%= class_name %>IndexView extends ApplicationView
  render: ->
    # override this method and initialize/bind your things for the index page
    # but don't forget to always call super
    super

  cleanup: ->
    # everything you initialize/bind on render, rather destroy/unbind in this
    # method, and don't forget the super
    super

class <%= class_name %>ShowView extends ApplicationView
  render: ->
    # override this method and initialize/bind your things for the show page
    # but don't forget to always call super
    super

  cleanup: ->
    # everything you initialize/bind on render, rather destroy/unbind in this
    # method, and don't forget the super
    super

class <%= class_name %>NewView extends ApplicationView
  render: ->
    # override this method and initialize/bind your things for the new page
    # but don't forget to always call super
    super

  cleanup: ->
    # everything you initialize/bind on render, rather destroy/unbind in this
    # method, and don't forget the super
    super

class <%= class_name %>EditView extends ApplicationView
  render: ->
    # override this method and initialize/bind your things for the edit page
    # but don't forget to always call super
    super

  cleanup: ->
    # everything you initialize/bind on render, rather destroy/unbind in this
    # method, and don't forget the super
    super


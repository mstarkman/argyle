class Modal
  show: (html) -> 
    @_addModalToDom(html)
    @_modal().modal('show')

  close: -> 
    @_modal().modal('hide')

  replaceForm: (formHtml) ->
    console.log "food"
    console.log @_modal().find(".modal-body form")
    @_modal().find(".modal-body form").replaceWith(formHtml)

  _addModalToDom: (html) ->
    $("body").append(html)
    @modalId = $(html).first().attr("id")
    @_bindEvents()

  _bindEvents: ->
    @_modal().on 'click', '[data-cancel]', (e) =>
      e.preventDefault()
      @close()

    @_modal().on 'hidden', => 
      @_removeFromDom()

  _removeFromDom: ->
    @_modal().remove()

  _modal: -> 
    $("##{@modalId}")

@Argyle.modal = new Modal()
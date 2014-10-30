class matinee.AdminImageRow
  formContainerSelector: '#image-rows tbody'
  formSelector: '.js-admin-image-row'
  addSelector: '.js-admin-image-row-add'
  rowCount: 0

  constructor: ->
    @setup()

  setup: =>
    $('body').on 'click', @addSelector, @onClickHandler
    $rows = $(@formSelector)
    @rowCount = $rows.length
    @html = "<tr>#{$rows.last().html()}</tr>"

  onClickHandler: (e) =>
    e.preventDefault()
    @html = @html.replace(@reg1(), "_#{@rowCount}_")
    @html = @html.replace(@reg2(), "[#{@rowCount}]")
    @html = @html.replace(@reg3(), "value=\"#{@rowCount}\"")
    $(@formContainerSelector).append @html
    @rowCount++

  reg1: ->
    new RegExp("_#{@rowCount - 1}_", "g")

  reg2: ->
    new RegExp("\\[#{@rowCount - 1}\\]", "g")

  reg3: ->
    new RegExp("value=\"#{@rowCount - 1}\"", "g")

$ ->
  matinee.adminImageRow = new matinee.AdminImageRow


React = require 'react'

{div, span, img, i} = React.DOM

module.exports = React.createClass
  displayName: 'lite-image'

  propTypes:
    onClick: React.PropTypes.func
    onLoaded: React.PropTypes.func
    src: React.PropTypes.string.isRequired
    width: React.PropTypes.number
    height: React.PropTypes.number

  getDetaultProps: ->
    width: 'auto'
    height: 'auto'

  getInitialState: ->
    stage: 'loading'

  componentDidMount: ->
    @loadImage @props.src

  componentWillReceiveProps: (props) ->
    if props.src isnt @props.src
      @loadImage props.src

  # methods

  loadImage: (src) ->
    isDataUri = @props.src.substring(0, 4) is 'data'
    if isDataUri
      @loadDataUrl src
    else
      @loadRemoteImage src

  loadRemoteImage: (src) ->
    @setState stage: 'loading'
    @imgEl = document.createElement 'img'
    @imgEl.onload = @onImageLoad
    @imgEl.onerror = @onImageError
    @imgEl.src = src

  loadDataUrl: (src) ->
    @setState stage: 'done'

  destroyImage: ->
    if @imgEl
      @imgEl.onload = null
      @imgEl.onerror = null
      @imgEl = null

  # internal event

  onImageLoad: (event) ->
    @setState stage: 'done'
    @onLoaded()
    # @destroyImage()

  onImageError: (event) ->
    @setState stage: 'error'
    # @destroyImage()

  # external events

  onClick: ->
    @props.onClick?()

  onLoaded: ->
    @props.onLoaded?()

  onReloadImage: (event) ->
    @setState stage: 'loading'
    @loadImage @props.src

  # renderers

  renderLoading: ->
    div className: 'image-loader',
      i className: 'icon icon-refresh'

  renderImage: ->
    img src: @props.src, onClick: @onClick, style:
      width: @props.width
      height: @props.height

  renderError: ->
    i className: 'image-reload icon icon-refresh', onClick: @onReloadImage

  render: ->
    style =
      width: @props.width
      height: @props.height
      opacity: if @state.stage is 'loading' then 0.4 else 1

    div className: 'lite-image', style: style,
      switch @state.stage
        when 'loading' then @renderLoading()
        when 'done' then @renderImage()
        when 'error' then @renderError()

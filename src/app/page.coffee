
React = require 'react'

{div, button} = React.DOM

Image = React.createFactory require './image'

localImage = require './local-image-url'

onlineImage = 'https://d13yacurqjgara.cloudfront.net/users/159888/screenshots/2301596/clearskies-01.png'
failedImage = 'asdf'

module.exports = React.createClass
  displayName: 'app-page'

  getInitialState: ->
    showLocalImage: true

  toggleLocal: ->
    @setState showLocalImage: not @state.showLocalImage

  renderImageLoading: ->
    div className: 'section',
      div className: 'title', 'Image Downloading'
      Image src: onlineImage, width: 400, height: 300

  renderImageLocal: ->
    div className: 'section',
      div className: 'title', 'Local Image'
      button className: 'button is-default is-small', onClick: @toggleLocal, 'Render Local Image'
      if @state.showLocalImage
        Image width: 225, height: 225, src: localImage

  renderImageFailed: ->
    div className: 'section',
      div className: 'title', 'Image Failed'
      Image src: failedImage, width: 80, height: 80

  render: ->
    div className: 'app-page',
      @renderImageLoading()
      @renderImageLocal()
      @renderImageFailed()

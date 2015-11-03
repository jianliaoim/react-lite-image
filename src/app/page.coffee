
React = require 'react'

{div, button} = React.DOM

Image = React.createFactory require './image'

localImage = require './local-image-url'
thinImage = require '../../images/thin.png'
narrowImage = require '../../images/narrow.png'

onlineImage = 'https://d13yacurqjgara.cloudfront.net/users/159888/screenshots/2301596/clearskies-01.png'
failedImage = 'https://dribbble.com/shots/2289888-Prototype'

module.exports = React.createClass
  displayName: 'app-page'

  getInitialState: ->
    showLocalImage: true

  toggleLocal: ->
    @setState showLocalImage: not @state.showLocalImage

  renderImageLoading: ->
    div className: 'section',
      div className: 'title', 'Image Downloading'
      if @state.showLocalImage
        Image src: onlineImage, width: 400, height: 300

  renderImageLocal: ->
    div className: 'section',
      div className: 'title', 'Local Image'
      if @state.showLocalImage
        Image width: 225, height: 225, src: localImage

  renderImageFailed: ->
    div className: 'section',
      div className: 'title', 'Image Failed'
      if @state.showLocalImage
        Image src: failedImage, width: 80, height: 80

  renderImageSpecial: ->
    div className: 'section',
      div className: 'title', 'Thin image'
        Image width: 14, height: 298, src: thinImage
      div className: 'title', 'narrow image'
        Image width: 179, height: 16, src: narrowImage
      div className: 'title', 'narrow image broken'
        Image width: 179, height: 16, src: failedImage

  render: ->
    div className: 'app-page',
      button className: 'button is-default is-small', onClick: @toggleLocal, 'Show/hide'
      @renderImageLoading()
      @renderImageLocal()
      @renderImageFailed()
      @renderImageSpecial()

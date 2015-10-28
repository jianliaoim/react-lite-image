
stir = require 'stir-template'
React = require 'react'
ReactDOM = require 'react-dom/server'

Page = React.createFactory require './src/app/page'

{html, head, title, body, meta, script, link, div, a, span} = stir

line = (text) ->
  div class: 'line', text

module.exports = (data) ->
  stir.render stir.doctype(),
    html null,
      head null,
        title null, "Coffee Webpack Starter"
        meta charset: 'utf-8'
        link
          rel: 'icon'
          href: 'http://tp4.sinaimg.cn/5592259015/180/5725970590/1'
        link
          rel: 'stylesheet'
          href: if data.dev then 'style/main.css' else data.style
        script src: data.vendor, defer: true
        script src: data.main, defer: true
      body null,
        div class: 'intro',
          div null,
            span null, "React Image Component, read more at "
            a href: 'http://github.com/teambition/react-lite-image',
              'github.com/teambition/react-lite-image'
            span null, '.'
        div class: 'demo',
          ReactDOM.renderToString Page()

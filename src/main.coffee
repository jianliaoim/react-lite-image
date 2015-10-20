
React = require 'react'

require 'volubile-ui/ui/index.less'
require '../style/main.css'

Page = React.createFactory require './app/page'

React.render Page(), document.querySelector('.demo')

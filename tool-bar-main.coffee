module.exports =
  activate: (state) ->
    require('atom-package-deps').install('tool-bar-main')

  deactivate: ->
    @toolBar?.removeItems()

  serialize: ->

  consumeToolBar: (toolBar) ->
    @toolBar = toolBar 'main-tool-bar'

    @toolBar.addButton
      icon: 'page'
      callback: 'application:new-file'
      tooltip: 'New File'
      iconset: 'fi'
    @toolBar.addButton
      icon: 'folder'
      callback: 'application:open-file'
      tooltip: 'Open...'
      iconset: 'fi'
    @toolBar.addButton
      icon: 'save'
      callback: 'core:save'
      tooltip: 'Save'
      iconset: 'fi'
    @toolBar.addButton
      icon: 'magnifying-glass'
      callback: 'find-and-replace:show'
      tooltip: 'Find in Buffer'
      iconset: 'fi'

      @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'shuffle'
      callback: 'find-and-replace:show-replace'
      tooltip: 'Replace in Buffer'
      iconset: 'fi'
    @toolBar.addButton
      icon: 'play'
      callback: 'script:run'
      tooltip: 'Run Script'
      iconset: 'fi'
    @toolBar.addButton
      icon: 'stop'
      callback: 'script:kill-process'
      tooltip: 'Stop Script'
      iconset: 'fi'
    @toolBar.addButton
      icon: 'play-circle'
      callback: 'hydrogen:run-all'
      tooltip: 'Run with Hydrogen'
      iconset: 'fi'

    @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'list'
      callback: 'command-palette:toggle'
      tooltip: 'Toggle Command Palette'
      iconset: 'fi'
    @toolBar.addButton
      icon: 'widget'
      callback: 'settings-view:open'
      tooltip: 'Open Settings View'
      iconset: 'fi'


    if atom.inDevMode()
      @toolBar.addSpacer()

      @toolBar.addButton
        icon: 'refresh'
        callback: 'window:reload'
        tooltip: 'Reload Window'
        iconset: 'fi'
      @toolBar.addButton
        icon: 'terminal'
        callback: ->
          require('remote').getCurrentWindow().toggleDevTools()
        tooltip: 'Toggle Developer Tools'

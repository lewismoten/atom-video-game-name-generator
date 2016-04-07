{CompositeDisposable} = require 'atom'

module.exports = AtomVideoGameNameGenerator =
  subscriptions: null
  wordList: null

  activate: (state) ->

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that generates a video game name
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-video-game-name-generator:generateSimilar': => @generate(true)
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-video-game-name-generator:generate': => @generate(false)

    @wordList = require('../assets/video_game_names.json')

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()

  serialize: ->

  randomWord: (list)  ->
    return list[Math.floor(Math.random()*list.length)]

  getSimilarWords: (wordEntry) ->
    return wordEntry.split('^')[1].split('|')

  getWord: (wordEntry) ->
    return wordEntry.split('^')[0]

  hasSimilarWords: (wordEntry)  ->
    return wordEntry.indexOf('^') != -1

  generate: (allowSimilarMatches) ->
    if editor = atom.workspace.getActiveTextEditor()
      firstWord = @randomWord(@wordList[0])
      secondWord = ''
      thirdWord = ''
      isSecondBad = true
      isThirdBad = true
      similarWords = []

      if @hasSimilarWords(firstWord)
        if !allowSimilarMatches
          similarWords = @getSimilarWords(firstWord)
        firstWord = @getWord(firstWord)

      while isSecondBad
        secondWord = @randomWord(@wordList[1])
        if @hasSimilarWords(secondWord)
          if !allowSimilarMatches
            similarWords.concat(@getSimilarWords(secondWord))
          secondWord = @getWord(secondWord)
        if secondWord == firstWord
          continue
        if(similarWords.indexOf(secondWord) != -1)
          continue
        isSecondBad = false

      while isThirdBad
        thirdWord = @randomWord(@wordList[2])
        if @hasSimilarWords(thirdWord)
          if !allowSimilarMatches
            similarWords.concat(@getSimilarWords(thirdWord))
          thirdWord = @getWord(thirdWord)
        if thirdWord == firstWord
          continue
        if thirdWord == secondWord
          continue
        if(similarWords.indexOf(thirdWord) != -1)
          continue
        isThirdBad = false

      editor.insertText(firstWord + ' ' + secondWord + ' ' + thirdWord)

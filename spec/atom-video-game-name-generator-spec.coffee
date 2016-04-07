AtomVideoGameNameGenerator = require '../lib/atom-video-game-name-generator'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "AtomVideoGameNameGenerator", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('atom-video-game-name-generator')

  it "successfully adds commands", ->
    runs ->
      AtomVideoGameNameGenerator.activate()
      expect(AtomVideoGameNameGenerator.subscriptions.disposables.size).toBeGreaterThan(1)

  describe "Activation Commands", ->
    [activationPromise] = []
    it "has an activation command for each subscription", ->
      runs ->
        activationPromise = atom.packages.activatePackage("atom-video-game-name-generator")
        atom.packages.getLoadedPackage('atom-video-game-name-generator').activateNow()

      waitsForPromise ->
        activationPromise

      runs ->
        activePackage = atom.packages.getActivePackage('atom-video-game-name-generator')
        activationCommands = activePackage.activationCommands['atom-workspace']

        expect(activationCommands).toContain('atom-video-game-name-generator:generate')
        expect(activationCommands).toContain('atom-video-game-name-generator:generateSimilar')

  describe "Menu Commands", ->
    [activationPromise] = []
    it "has an activation command for each subscription", ->
      runs ->
        activationPromise = atom.packages.activatePackage("atom-video-game-name-generator")
        atom.packages.getLoadedPackage('atom-video-game-name-generator').activateNow()

      waitsForPromise ->
        activationPromise

      runs ->
        activePackage = atom.packages.getActivePackage('atom-video-game-name-generator')
        subMenus = (m.command for m in activePackage.menus[0][1].menu[0].submenu[0].submenu)
        expect(subMenus).toContain('atom-video-game-name-generator:generate')
        expect(subMenus).toContain('atom-video-game-name-generator:generateSimilar')

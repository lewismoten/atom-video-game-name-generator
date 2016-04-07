# atom-video-game-name-generator package

![The Video Game Generator](/assets/the-video-game-generator.png)

This is a port of [The Video Game Name Generator](http://videogamena.me) (VGNG). This package allows you to generate random video game names in your text editor. This is great for test data and data entry. A few examples:

* Stoic Death Carnage
* Retro UFO Soldier
* Wild Graveyard Revolution
* Masters of the Karaoke - Gold Edition
* Advanced Fighter Ransom

Commands are accessible under the packages menu for VGNG and the context menu, as well as some key bindings and commands.

![A screenshot of the video game name generator in action](assets/demo.gif)

## Commands

* `atom-video-game-name-generator:generateSimilar` Generate and allow similar terms (e.g. Nighttime Night Nightmare)
* `atom-video-game-name-generator:generate` Generate and don't allow similar terms (e.g. Nighttime Night Nightmare)

## Key maps

* `cmd`-`shift`-`v`: `atom-video-game-name-generator:generate`
* `cmd`-`alt`-`v`: `atom-video-game-name-generator:generateSimilar`

## menus

* `Package`>`VGNG`>`Generate`: `atom-video-game-name-generator:generateSimilar`
* `Package`>`VGNG`>`Generate w/o similar terms`: `atom-video-game-name-generator:generate`

## context menus

* `VGNG`>`Generate`: `atom-video-game-name-generator:generateSimilar`
* `VGNG`>`Generate w/o similar terms`: `atom-video-game-name-generator:generate`

## License

License / Authorization of use from the original authors (Edward Younskevicius)
website:

```
If you'd like to use the VGNG on your website, feel free! If you want to make
your own version (or make a better one for me ;) ), the wordlist is called
video_game_names.txt, and the syntax should be simple enough to figure out
(three wordlists separated by dashes, with dupe protection listed after the
"^" and separated by pipes "|".) I only ask that, if you copy the VGNG for
your site, please don't use it for any profit-generating purpose (charging
for it or selling ads), and include a link back to this site.
```

http://videogamena.me/about.html

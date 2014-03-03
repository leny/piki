# piki

coded by leny @ flatLand!

started at 03/03/14

* * *

    do ( $ = jQuery ) ->

        "use strict"

        oInterval = null

        $.fn.tiki = ( sText, iSpeed ) ->

Killing previous timer

            if oInterval
                clearInterval oInterval
                oInterval = null

Displaying a loading warning.

            ( $target = @.find "span" )
                .html "<mark>...</mark>preparing..."

## Fetching the words

Firstly, we will parse the given text to separate words, and store them in an array.

Now, we will define were we will place the marker, coloring red this letter.
In our design, we have a `span` tag for the word, with a `mark` for spacing, and an `em` tag for the red-letter marker.
The vertical markers are placed for the seventh characters, so we need to adjust the `mark` spacer to fit in.

            aWords = for sWord in sText.split /\s/gi
                if sWord.length is 1
                    sMark = "......"
                    iPosition = 0
                else if sWord.length < 6
                    sMark = "....."
                    iPosition = 1
                else if sWord.length < 8
                    sMark = "...."
                    iPosition = 2
                else if sWord.length < 11
                    sMark = "..."
                    iPosition = 3
                else
                    sMark = ".."
                    iPosition = 4

                "<mark>#{ sMark }</mark>#{ sWord.slice( 0, iPosition ) }<em>#{ sWord.slice( iPosition, iPosition + 1 ) }</em>#{ sWord.slice( iPosition + 1 ) }"

### Countdown

We add a simple countdown before launching the text.

            aWords.unshift "<mark>......</mark><em>1</em>"
            aWords.unshift "<mark>......</mark><em>2</em>"
            aWords.unshift "<mark>......</mark><em>3</em>"
            aWords.unshift "<mark>......</mark><em>4</em>"
            aWords.unshift "<mark>......</mark><em>5</em>"

## Preparing Timer

Now, we will simply set an interval, displaying the next word.
The speed is simply the division of `60000` (a minute, in milliseconds) by the given speed.

            iSpeedInterval = 60000 / iSpeed
            iCurrentIndex = 0
            fNextWord = ->
                $target.html aWords[ iCurrentIndex++ ] if iCurrentIndex <= aWords.length

            oInterval = setInterval fNextWord, iSpeedInterval

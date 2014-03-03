(function($) {
  "use strict";
  var oInterval;
  oInterval = null;
  return $.fn.tiki = function(sText, iSpeed) {
    var $target, aWords, fNextWord, iCurrentIndex, iPosition, iSpeedInterval, sMark, sWord;
    if (oInterval) {
      clearInterval(oInterval);
      oInterval = null;
    }
    ($target = this.find("span")).html("<mark>...</mark>preparing...");
    aWords = (function() {
      var _i, _len, _ref, _results;
      _ref = sText.split(/\s/gi);
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        sWord = _ref[_i];
        if (sWord.length === 1) {
          sMark = "......";
          iPosition = 0;
        } else if (sWord.length < 6) {
          sMark = ".....";
          iPosition = 1;
        } else if (sWord.length < 8) {
          sMark = "....";
          iPosition = 2;
        } else if (sWord.length < 11) {
          sMark = "...";
          iPosition = 3;
        } else {
          sMark = "..";
          iPosition = 4;
        }
        _results.push("<mark>" + sMark + "</mark>" + (sWord.slice(0, iPosition)) + "<em>" + (sWord.slice(iPosition, iPosition + 1)) + "</em>" + (sWord.slice(iPosition + 1)));
      }
      return _results;
    })();
    aWords.unshift("<mark>......</mark><em>1</em>");
    aWords.unshift("<mark>......</mark><em>2</em>");
    aWords.unshift("<mark>......</mark><em>3</em>");
    aWords.unshift("<mark>......</mark><em>4</em>");
    aWords.unshift("<mark>......</mark><em>5</em>");
    iSpeedInterval = 60000 / iSpeed;
    iCurrentIndex = 0;
    fNextWord = function() {
      if (iCurrentIndex <= aWords.length) {
        return $target.html(aWords[iCurrentIndex++]);
      }
    };
    return oInterval = setInterval(fNextWord, iSpeedInterval);
  };
})(jQuery);

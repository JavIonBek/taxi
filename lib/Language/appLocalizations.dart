import 'package:my_cab/constance/constance.dart' as constance;

class AppLocalizations {
  static String of(String text, {String ignoreLanguageCode: 'uz'}) {
    String myLocale = constance.locale;

    // ignore: unnecessary_null_comparison
    if (constance.allTextData != null &&
        constance.allTextData.allText!.length > 0) {
      var newtext = '';
      int index = constance.allTextData.allText!
          .indexWhere((note) => note.textId == text);
      if (index != -1) {
        if (myLocale == 'uz') {
          newtext = constance.allTextData.allText![index].uz;
        } else if (myLocale == 'ru') {
          newtext = constance.allTextData.allText![index].ru;
        } else if (myLocale == 'fr') {
          newtext = constance.allTextData.allText![index].fr;
        }
        if (newtext != '') {
          return newtext;
        } else {
          return text;
        }
      } else {
        return text;
      }
    } else {
      return text;
    }
  }
}

class AllTextData {
  List<AllText>? allText;

  AllTextData({this.allText});

  AllTextData.fromJson(Map<String, dynamic> json) {
    if (json['allText'] != null) {
      allText = <AllText>[];
      json['allText'].forEach((v) {
        allText!.add(new AllText.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allText != null) {
      data['allText'] = this.allText!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllText {
  String textId = '';
  String uz = '';
  String ru = '';
  String fr = '';

  AllText({this.textId = '', this.uz = '', this.ru = '', this.fr = ''});

  AllText.fromJson(Map<String, dynamic> json) {
    textId = json['textId'] ?? '';
    if (json['languageTextList'] != null) {
      json['languageTextList'].forEach((text) {
        if (text["uz"] != null) {
          uz = text["uz"] ?? textId;
        }
        if (text["ru"] != null) {
          ru = text["ru"] ?? textId;
        }
        if (text["fr"] != null) {
          fr = text["fr"] ?? textId;
        }
      });
      if (uz == '') {
        uz = textId;
      }
      if (ru == '') {
        ru = textId;
      }
      if (fr == '') {
        fr = textId;
      }
    } else {
      uz = textId;
      ru = textId;
      fr = textId;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['textId'] = this.textId;
    data['fr'] = this.fr;
    data['uz'] = this.uz;
    data['ru'] = this.ru;
    return data;
  }
}

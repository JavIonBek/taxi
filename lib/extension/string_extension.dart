extension StringExtension on String {
  get stringToName {
    // ignore: unnecessary_null_comparison
    if (this != null) {
      if (this.length > 0) {
        return this[0].toUpperCase() + this.substring(1);
      } else {
        return this;
      }
    } else
      return this;
  }

  get removeZeroInNumber {
    // ignore: unnecessary_null_comparison
    if (this != null) {
      if (this.length > 0) {
        if (this[0] == "0") {
          return this.substring(1);
        } else {
          return this;
        }
      } else {
        return this;
      }
    } else
      return this;
  }
}

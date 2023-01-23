extension StringExtensions on String {
  String ellipsisOverflowFix() {
    return this.replaceAll('', '\u{200B}');
  }
}

extension StringExtension on String? {
  String removeTimeOffset() {
    if (this == null || this!.isEmpty) {
      return "";
    } else {
      if ((this?.length ?? 0) >= 19) {
        var result = this?.substring(0, 19);
        if (result != null && result.isNotEmpty) {
          return result;
        }
      }
      return this!;
    }
  }
  String toTitleCase() {
    if (this == null || this!.isEmpty) {
      return '';
    }
    return '${this![0].toUpperCase()}${this!.substring(1, this!.length).toLowerCase()}';
  }
}
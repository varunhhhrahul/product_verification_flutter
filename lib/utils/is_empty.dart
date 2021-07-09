isEmpty(value) {
  return value == null ||
      value.runtimeType is Map && value.length == 0 ||
      (value.runtimeType is String && value.trim().length == 0);
}

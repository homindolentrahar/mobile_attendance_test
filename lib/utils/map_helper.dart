Map<String, dynamic> convertDynamicMap(dynamic originalMap) {
  Map<String, dynamic> convertedMap = {};

  originalMap.forEach((key, value) {
    if (key is String) {
      convertedMap[key] = value;
    }
  });

  return convertedMap;
}

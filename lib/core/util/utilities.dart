class Utilities {
  static T enumFromString<T>(String key, List<T> values) => values.firstWhere(
        (v) => key == (v! as Enum).name,
      );
}

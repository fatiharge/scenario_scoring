import 'package:scenario_scoring/scenarios/array/array_filter.dart';
import 'package:scenario_scoring/scenarios/array/extension/array_filter_extension.dart';

/// Enum for StringAggregation operations
///
/// This enum is used to specify the type of string aggregation operation to be
/// performed.
/// Currently, only the 'sum' operation is supported, which concatenates all
/// the string values in the array.
enum StringAggregation {
  /// 'sum' operation
  ///
  /// When this operation is selected, the string values in the array will be
  /// concatenated.
  sum,
}

/// Extension on ArrayFilter for StringAggregation operations
///
/// This extension adds the ability to perform StringAggregation operations on
/// an ArrayFilter.
/// The [stringAggregationFilterFunction] method takes a StringAggregation enum
/// value and an array as parameters.
/// It applies the aggregation operation specified by the enum value to the
/// array.
extension StringAggregationExtension on ArrayFilter {
  /// Applies the specified StringAggregation operation to the array
  ///
  /// The method first filters the array using the [getFilteredArrayWithWhere]
  /// method.
  /// It then performs the specified StringAggregation operation on the
  /// filtered array.
  /// Currently, only the 'sum' operation is supported, which concatenates all
  /// the string values in the array.
  bool stringAggregationFilterFunction(
    StringAggregation stringAggregation,
    Array t,
  ) {
    final filteredList = getFilteredArrayWithWhere(t);

    switch (stringAggregation) {
      case StringAggregation.sum:
        return filterWithSum(filteredList);
    }
  }

  /// Concatenates all the string values in the array
  ///
  /// The method iterates over the filtered list and appends each string value
  /// to a StringBuffer.
  /// It then creates a map with the key from the aggregationFilter and the
  /// concatenated string.
  /// This map is then passed to the filter method of the aggregationFilter,
  /// and the result of this method is returned.
  bool filterWithSum(Array filteredList) {
    final buffer = StringBuffer();

    for (final element in filteredList) {
      buffer.write(element[aggregationFilter!.key] as String);
    }

    final map = {
      aggregationFilter!.key: buffer.toString(),
    };

    return aggregationFilter!.filter(t: map);
  }
}

import 'package:scenario_scoring/scenarios/array/array_filter.dart';

/// ArrayFilterExtension extension
///
/// This extension is used to add additional functionality to the ArrayFilter
/// class.
/// It adds three methods:
/// - [summingFilter]: This method filters the array [Array]<T> using the
/// objectFilter's filter method,
/// multiplies the success score by the length of the filtered array, and
/// returns whether the
/// filtered array is not empty.
/// - [containsFilter]: This method filters the array [Array]<T> using the
/// objectFilter's filter method,
/// and returns whether the filtered array is not empty.
/// - [getFilteredArrayWithWhere]: This method filters the array [Array]<T>
/// using the objectFilter's filter
/// method and returns the filtered array.

extension ArrayFilterExtension on ArrayFilter {
  /// summingFilter method
  ///
  /// This method applies the filter defined in the objectFilter to each element
  /// in the array [t].
  /// It then creates a new array that only includes the elements that meet the
  /// filter's conditions.
  /// The success score is then multiplied by the length of this new array.
  /// If the new array is not empty (meaning at least one element met the
  /// filter's conditions), the method returns true.
  /// If the new array is empty (meaning no elements met the filter's
  /// conditions),the method returns false.
  bool summingFilter(Array t) {
    final filteredList = getFilteredArrayWithWhere(t);
    successScore = filteredList.length * successScore;
    return filteredList.isNotEmpty;
  }

  /// containsFilter method
  ///
  /// This method applies the filter defined in the objectFilter to each element
  /// in the array [t].
  /// It then creates a new array that only includes the elements that meet the
  /// filter's conditions.
  /// If the new array is not empty (meaning at least one element met the
  /// filter's conditions), the method returns true.
  /// If the new array is empty (meaning no elements met the filter's
  /// conditions), the method returns false.
  bool containsFilter(Array t) {
    final filteredList = getFilteredArrayWithWhere(t);
    return filteredList.isNotEmpty;
  }

  /// getFilteredArrayWithWhere method
  ///
  /// This method applies the filter defined in the objectFilter to each element
  /// in the array [t].
  /// It then creates a new array that only includes the elements that meet the
  /// filter's conditions.
  /// This new array is then returned.
  Array getFilteredArrayWithWhere(Array t) {
    return t.where((element) => objectFilter.filter(t: element)).toList();
  }
}

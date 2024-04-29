import 'package:scenario_scoring/core/filter.dart';
import 'package:scenario_scoring/scenarios/array/array_filter.dart';
import 'package:scenario_scoring/scenarios/array/array_filter_operations.dart';
import 'package:scenario_scoring/scenarios/json/json_filter_exception.dart';
import 'package:scenario_scoring/scenarios/json/json_filter_operations.dart';

/// Typedef for Json
///
/// This typedef is used to simplify the type definition of a Map with String
/// keys and dynamic values.
/// Instead of writing `Map<String, dynamic>`, you can simply write `Json`.
typedef Json = Map<String, dynamic>;

/// JsonFilter class
///
/// This class extends the Filter class and is used to perform various
/// operations on a Json object.
/// The operations are specified by the JsonFilterOperations enum.
/// The class also contains a key, value, and operator, which are used
/// to filter the Json object.
class JsonFilter extends Filter<Json> {
  /// Constructor for JsonFilter
  ///
  /// This constructor initializes the key, value, operator, and successScore
  /// fields.
  /// It also sets the arrayFilter field to false.
  JsonFilter({
    required this.key,
    required this.value,
    required this.operator,
    required super.successScore,
  }) : arrayFilter = false;

  /// Constructor for JsonFilter with array
  ///
  /// This constructor initializes the key, value, arrayOperator, and
  /// successScore fields.
  /// It also sets the arrayFilter field to true and the operator field
  /// to JsonFilterOperations.contains.
  JsonFilter.array({
    required this.key,
    required this.value,
    required this.arrayOperator,
    required super.successScore,
  })  : arrayFilter = true,
        operator = JsonFilterOperations.contains;

  /// The key to be used for filtering.
  final String key;

  /// Indicates whether the filter is an array filter.
  final bool arrayFilter;

  /// The value to be used for filtering.
  final dynamic value;

  /// The operation to be performed on the Json object.
  final JsonFilterOperations operator;

  /// The operation to be performed on the array, if the filter is an
  /// array filter.
  ArrayFilterOperations? arrayOperator;

  /// The filter method
  ///
  /// This method performs the operation specified by the operator field
  /// on the Json object.
  /// The specific operation is determined by a switch statement.
  @override
  bool filter({required Json t}) {
    final key = this.key.split('.').first;
    if (!t.containsKey(key)) return false;
    final dynamic jsonValue = t[key];

    if (jsonValue is Json) {
      return JsonFilter(
        key: this.key.split('.').sublist(1).join('.'),
        value: value,
        operator: operator,
        successScore: successScore,
      ).filter(t: jsonValue);
    }

    if (arrayFilter) {
      if (jsonValue is! List<Json>) {
        throw InvalidArrayTypeException();
      }

      final arrayFilter = ArrayFilter(
        // ArrayFilter is true so arrayOperator will not be null
        arrayFilterOperations: arrayOperator!,
        successScore: successScore,
        objectFilter: JsonFilter(
          key: this.key.split('.').sublist(1).join('.'),
          value: value,
          operator: operator,
          successScore: successScore,
        ),
      );

      final result = arrayFilter.filter(t: jsonValue);

      successScore = arrayFilter.successScore;

      return result;
    }

    switch (operator) {
      // block: equals, contains, notEquals, isNull, notNUll
      case JsonFilterOperations.equals:
        return jsonValue == value;
      case JsonFilterOperations.contains:
        return jsonValue.toString().contains(value.toString());
      case JsonFilterOperations.notEquals:
        return jsonValue != value;
      case JsonFilterOperations.isNull:
        return jsonValue == null;
      case JsonFilterOperations.notNull:
        return jsonValue != null;
      // end block

      // block: greaterThanOrEqual, lessThanOrEqual, greaterThan, lessThan
      case JsonFilterOperations.greaterThanOrEqual:
        checkNumericValue(jsonValue);
        return (jsonValue as num) >= (value as num);
      case JsonFilterOperations.lessThanOrEqual:
        checkNumericValue(jsonValue);
        return (jsonValue as num) <= (value as num);
      case JsonFilterOperations.greaterThan:
        checkNumericValue(jsonValue);
        return (jsonValue as num) > (value as num);
      case JsonFilterOperations.lessThan:
        checkNumericValue(jsonValue);
        return (jsonValue as num) < (value as num);
      // end block

      // block: startsWith, endsWith
      case JsonFilterOperations.startsWith:
        return jsonValue.toString().startsWith(value.toString());
      case JsonFilterOperations.endsWith:
        return jsonValue.toString().endsWith(value.toString());
      // end block
      case JsonFilterOperations.equalsRoundedToTwoDecimals:
        checkNumericValue(jsonValue);
        return (jsonValue as num).toStringAsFixed(2) ==
            (value as num).toStringAsFixed(2);
      case JsonFilterOperations.equalsRounded:
        checkNumericValue(jsonValue);
        return (jsonValue as num).round() == (value as num).round();
    }
  }

  /// The checkNumericValue method
  ///
  /// This method checks if the provided value is a numeric value.
  /// If the value is not numeric, it throws a NonNumericValueException.
  void checkNumericValue(dynamic jsonValue) {
    if (jsonValue is! num || value is! num) {
      throw NonNumericValueException();
    }
  }
}

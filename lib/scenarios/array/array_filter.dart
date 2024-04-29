import 'package:scenario_scoring/core/filter.dart';
import 'package:scenario_scoring/scenarios/array/array_filter_operations.dart';
import 'package:scenario_scoring/scenarios/array/extension/array_filter_extension.dart';
import 'package:scenario_scoring/scenarios/array/extension/number_aggregation.dart';
import 'package:scenario_scoring/scenarios/array/extension/number_aggregation_extension.dart';
import 'package:scenario_scoring/scenarios/array/extension/string_aggregation_extension.dart';
import 'package:scenario_scoring/scenarios/json/json_filter.dart';

/// Typedef for Array
///
/// This typedef is used to simplify the type definition of a List of Json
/// objects.
/// Instead of writing `List<Json>`, you can simply write `Array`.
typedef Array = List<Json>;

/// ArrayFilter class
///
/// This class extends the Filter class and is used to perform various
/// operations on an array.
/// The operations are specified by the ArrayFilterOperations enum.
/// The class also contains a JsonFilter object, which is used to filter the
/// array.
class ArrayFilter extends Filter<Array> {
  /// Constructor for ArrayFilter
  ///
  /// This constructor initializes the arrayFilterOperations and objectFilter
  /// fields.
  /// It also calls the superclass constructor with the successScore parameter.
  ArrayFilter({
    required this.arrayFilterOperations,
    required this.objectFilter,
    required super.successScore,
  });

  /// Constructor for ArrayFilter with number aggregation
  ///
  /// This constructor initializes the objectFilter, aggregationFilter, and
  /// numberAggregation fields.
  /// It also calls the superclass constructor with the successScore parameter.
  /// The arrayFilterOperations field is set to
  /// ArrayFilterOperations.numberAggregation.
  ArrayFilter.numberAggregation({
    required this.objectFilter,
    required this.aggregationFilter,
    required this.numberAggregation,
    required super.successScore,
  }) : arrayFilterOperations = ArrayFilterOperations.numberAggregation;

  /// Constructor for ArrayFilter with string aggregation
  ///
  /// This constructor initializes the objectFilter, aggregationFilter,
  /// and stringAggregation fields.
  /// It also calls the superclass constructor with the successScore parameter.
  /// The arrayFilterOperations field is set to
  /// ArrayFilterOperations.stringAggregation.
  ArrayFilter.stringAggregation({
    required this.objectFilter,
    required this.aggregationFilter,
    required this.stringAggregation,
    required super.successScore,
  }) : arrayFilterOperations = ArrayFilterOperations.stringAggregation;

  /// The operation to be performed on the array.
  final ArrayFilterOperations arrayFilterOperations;

  /// The filter to be applied to the array.
  final JsonFilter objectFilter;

  /// The filter to be used for aggregation operations.
  JsonFilter? aggregationFilter;

  /// The number aggregation operation to be performed.
  NumberAggregation? numberAggregation;

  /// The string aggregation operation to be performed.
  StringAggregation? stringAggregation;

  /// The filter method
  ///
  /// This method performs the operation specified by the arrayFilterOperations
  /// field on the array.
  /// The specific operation is determined by a switch statement.
  @override
  bool filter({required Array t}) {
    switch (arrayFilterOperations) {
      case ArrayFilterOperations.summing:
        return summingFilter(t);
      case ArrayFilterOperations.contains:
        return containsFilter(t);
      case ArrayFilterOperations.notContains:
        return !containsFilter(t);
      case ArrayFilterOperations.numberAggregation:
        // if arrayFilterOperations is numberAggregation, aggregationFilter
        //  should not be null

        // if arrayFilterOperations is numberAggregation, numberAggregation
        // should not be null
        return numberAggregationFilterFunction(numberAggregation!, t);

      case ArrayFilterOperations.stringAggregation:
        // if arrayFilterOperations is stringAggregation, aggregationFilter
        //  should not be null

        // if arrayFilterOperations is stringAggregation, stringAggregation
        // should not be null
        return stringAggregationFilterFunction(stringAggregation!, t);
    }
  }
}

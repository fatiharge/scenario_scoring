import 'package:flutter_test/flutter_test.dart';
import 'package:scenario_scoring/scenarios/array/array_filter.dart';
import 'package:scenario_scoring/scenarios/array/array_filter_operations.dart';
import 'package:scenario_scoring/scenarios/array/extension/number_aggregation.dart';
import 'package:scenario_scoring/scenarios/array/extension/string_aggregation_extension.dart';
import 'package:scenario_scoring/scenarios/json/json_filter.dart';
import 'package:scenario_scoring/scenarios/json/json_filter_operations.dart';

void main() {
  group('ArrayFilter Custom Test', () {
    test('ArrayFilter Test', () {
      final list = [
        {'testKey': 'testValue'},
        {'testKey': 'otherValue'},
      ];

      final arrayFilter = ArrayFilter(
        arrayFilterOperations: ArrayFilterOperations.summing,
        successScore: 10,
        objectFilter: JsonFilter(
          key: 'testKey',
          value: 'testValue',
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
      );

      final result = arrayFilter.filter(
        t: list,
      );

      expect(result, true);
    });
  });

  group('ArrayFilterOperations Test', () {
    test('ArrayFilterOperations.summing  Test', () {
      final list = [
        {'testKey': 'testValue'},
        {'testKey': 'otherValue'},
      ];

      final arrayFilter = ArrayFilter(
        arrayFilterOperations: ArrayFilterOperations.summing,
        successScore: 10,
        objectFilter: JsonFilter(
          key: 'testKey',
          value: 'testValue',
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
      );

      final result = arrayFilter.filter(
        t: list,
      );

      expect(result, true);
    });

    test('ArrayFilterOperations.contains  Test', () {
      final list = [
        {'testKey': 'testValue'},
        {'testKey': 'otherValue'},
      ];

      final arrayFilter = ArrayFilter(
        arrayFilterOperations: ArrayFilterOperations.contains,
        successScore: 10,
        objectFilter: JsonFilter(
          key: 'testKey',
          value: 'testValue',
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
      );

      final result = arrayFilter.filter(
        t: list,
      );

      expect(result, true);
    });

    test('ArrayFilterOperations.numberAggregation  Test', () {
      final list = [
        {'testKey': 10},
        {'testKey': 20},
      ];

      final arrayFilter = ArrayFilter.numberAggregation(
        numberAggregation: NumberAggregation.sum,
        successScore: 10,
        objectFilter: JsonFilter(
          key: 'testKey',
          value: 10,
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
        aggregationFilter: JsonFilter(
          key: 'testKey',
          value: 10,
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
      );

      final result = arrayFilter.filter(
        t: list,
      );

      expect(result, true);
      expect(arrayFilter.successScore, 10);
    });

    test('ArrayFilterOperations.stringAggregation  Test', () {
      final list = [
        {'testKey': 'testValue'},
        {'testKey': 'otherValue'},
      ];

      final arrayFilter = ArrayFilter.stringAggregation(
        stringAggregation: StringAggregation.sum,
        successScore: 10,
        objectFilter: JsonFilter(
          key: 'testKey',
          value: 'testValue',
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
        aggregationFilter: JsonFilter(
          key: 'testKey',
          value: 'testValue',
          operator: JsonFilterOperations.contains,
          successScore: 10,
        ),
      );

      final result = arrayFilter.filter(
        t: list,
      );

      expect(result, true);
      expect(arrayFilter.successScore, 10);
    });
  });

  group('StringAggregation Test', () {
    test('ArrayFilterOperations.stringAggregation  Test', () {
      final list = [
        {'testKey': 'testValue'},
        {'testKey': 'otherValue'},
      ];

      final arrayFilter = ArrayFilter.stringAggregation(
        stringAggregation: StringAggregation.sum,
        successScore: 10,
        objectFilter: JsonFilter(
          key: 'testKey',
          value: 'testValue',
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
        aggregationFilter: JsonFilter(
          key: 'testKey',
          value: 'testValue',
          operator: JsonFilterOperations.contains,
          successScore: 10,
        ),
      );

      final result = arrayFilter.filter(
        t: list,
      );

      expect(result, true);
      expect(arrayFilter.successScore, 10);
    });
  });

  group('NumberAggregation Test', () {
    test('ArrayFilterOperations.numberAggregation.sum  Test', () {
      final list = [
        {'testKey': 10},
        {'testKey': 20},
      ];

      final arrayFilter = ArrayFilter.numberAggregation(
        numberAggregation: NumberAggregation.sum,
        successScore: 10,
        objectFilter: JsonFilter(
          key: 'testKey',
          value: 10,
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
        aggregationFilter: JsonFilter(
          key: 'testKey',
          value: 10,
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
      );

      final result = arrayFilter.filter(
        t: list,
      );

      expect(result, true);
      expect(arrayFilter.successScore, 10);
    });

    test('ArrayFilterOperations.numberAggregation.average  Test', () {
      final list = [
        {'testKey': 10},
        {'testKey': 20},
      ];

      final arrayFilter = ArrayFilter.numberAggregation(
        numberAggregation: NumberAggregation.average,
        successScore: 10,
        objectFilter: JsonFilter(
          key: 'testKey',
          value: 50,
          operator: JsonFilterOperations.lessThan,
          successScore: 10,
        ),
        aggregationFilter: JsonFilter(
          key: 'testKey',
          value: 15,
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
      );

      final result = arrayFilter.filter(
        t: list,
      );

      expect(result, true);
      expect(arrayFilter.successScore, 10);
    });

    test('ArrayFilterOperations.numberAggregation.max  Test', () {
      final list = [
        {'testKey': 10},
        {'testKey': 20},
      ];

      final arrayFilter = ArrayFilter.numberAggregation(
        numberAggregation: NumberAggregation.max,
        successScore: 10,
        objectFilter: JsonFilter(
          key: 'testKey',
          value: 10,
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
        aggregationFilter: JsonFilter(
          key: 'testKey',
          value: 10,
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
      );

      final result = arrayFilter.filter(
        t: list,
      );

      expect(result, true);
      expect(arrayFilter.successScore, 10);
    });

    test('ArrayFilterOperations.numberAggregation.min  Test', () {
      final list = [
        {'testKey': 10},
        {'testKey': 20},
      ];

      final arrayFilter = ArrayFilter.numberAggregation(
        numberAggregation: NumberAggregation.min,
        successScore: 10,
        objectFilter: JsonFilter(
          key: 'testKey',
          value: 10,
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
        aggregationFilter: JsonFilter(
          key: 'testKey',
          value: 10,
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
      );

      final result = arrayFilter.filter(
        t: list,
      );

      expect(result, true);
      expect(arrayFilter.successScore, 10);
    });

    test('ArrayFilterOperations.numberAggregation.count  Test', () {
      final list = [
        {'testKey': 10},
        {'testKey': 10},
        {'testKey': 10},
        {'testKey': 20},
      ];

      final arrayFilter = ArrayFilter.numberAggregation(
        numberAggregation: NumberAggregation.count,
        successScore: 10,
        objectFilter: JsonFilter(
          key: 'testKey',
          value: 10,
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
        aggregationFilter: JsonFilter(
          key: 'testKey',
          value: 3,
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
      );

      final result = arrayFilter.filter(
        t: list,
      );

      expect(result, true);
      expect(arrayFilter.successScore, 10);
    });

    test('ArrayFilterOperations.numberAggregation.median  Test', () {
      final list = [
        {'testKey': 10},
        {'testKey': 20},
      ];

      final arrayFilter = ArrayFilter.numberAggregation(
        numberAggregation: NumberAggregation.median,
        successScore: 10,
        objectFilter: JsonFilter(
          key: 'testKey',
          value: 10,
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
        aggregationFilter: JsonFilter(
          key: 'testKey',
          value: 10,
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
      );

      final result = arrayFilter.filter(
        t: list,
      );

      expect(result, true);
      expect(arrayFilter.successScore, 10);
    });

    test('ArrayFilterOperations.numberAggregation.standardDeviation  Test', () {
      final list = [
        {'testKey': 60},
        {'testKey': 70},
        {'testKey': 80},
        {'testKey': 90},
        {'testKey': 100},
      ];

      final arrayFilter = ArrayFilter.numberAggregation(
        numberAggregation: NumberAggregation.standardDeviation,
        successScore: 10,
        objectFilter: JsonFilter(
          key: 'testKey',
          value: 110,
          operator: JsonFilterOperations.lessThan,
          successScore: 10,
        ),
        aggregationFilter: JsonFilter(
          key: 'testKey',
          value: 15.81,
          operator: JsonFilterOperations.equalsRoundedToTwoDecimals,
          successScore: 10,
        ),
      );

      final result = arrayFilter.filter(
        t: list,
      );

      expect(result, true);
      expect(arrayFilter.successScore, 10);
    });

    test('ArrayFilterOperations.numberAggregation.variance  Test', () {
      final list = [
        {'testKey': 60},
        {'testKey': 70},
        {'testKey': 80},
        {'testKey': 90},
        {'testKey': 100},
      ];

      final arrayFilter = ArrayFilter.numberAggregation(
        numberAggregation: NumberAggregation.variance,
        successScore: 10,
        objectFilter: JsonFilter(
          key: 'testKey',
          value: 110,
          operator: JsonFilterOperations.lessThan,
          successScore: 10,
        ),
        aggregationFilter: JsonFilter(
          key: 'testKey',
          value: 250,
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
      );

      final result = arrayFilter.filter(
        t: list,
      );

      expect(result, true);
      expect(arrayFilter.successScore, 10);
    });

    test('ArrayFilterOperations.numberAggregation.percentile  Test', () {
      final list = [
        {'testKey': 10},
        {'testKey': 20},
      ];

      final arrayFilter = ArrayFilter.numberAggregation(
        numberAggregation: NumberAggregation.percentile,
        successScore: 10,
        objectFilter: JsonFilter(
          key: 'testKey',
          value: 10,
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
        aggregationFilter: JsonFilter(
          key: 'testKey',
          value: 10,
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
      );

      final result = arrayFilter.filter(
        t: list,
      );

      expect(result, true);
      expect(arrayFilter.successScore, 10);
    });
  });
}

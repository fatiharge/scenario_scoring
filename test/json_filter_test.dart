import 'package:flutter_test/flutter_test.dart';
import 'package:scenario_scoring/core/scenario.dart';
import 'package:scenario_scoring/core/scenario_type.dart';
import 'package:scenario_scoring/scenarios/array/array_filter_operations.dart';
import 'package:scenario_scoring/scenarios/json/json_filter.dart';
import 'package:scenario_scoring/scenarios/json/json_filter_exception.dart';
import 'package:scenario_scoring/scenarios/json/json_filter_operations.dart';

void main() {
  group('JsonFilter Exception  Test', () {
    test('NonNumericValueException Test', () {
      final map = {'testKey': 'NonNumericValueException'};
      final jsonFilter = JsonFilter(
        key: 'testKey',
        value: 10,
        operator: JsonFilterOperations.greaterThanOrEqual,
        successScore: 10,
      );

      try {
        jsonFilter.filter(
          t: map,
        );
      } catch (e) {
        expect(e.toString(), 'NonNumericValueException: Non numeric value');
        expect(e, isA<NonNumericValueException>());
      }
    });
    test('InvalidArrayTypeException Test', () {
      final map = {'testKey': 'testValue'};
      final jsonFilter = JsonFilter.array(
        key: 'testKey',
        value: 10,
        arrayOperator: ArrayFilterOperations.summing,
        successScore: 10,
      );

      try {
        jsonFilter.filter(
          t: map,
        );
      } catch (e) {
        expect(e.toString(), 'InvalidArrayTypeException: Invalid array type');
        expect(e, isA<InvalidArrayTypeException>());
      }
    });
  });

  group('JsonFilter Custom Test', () {
    test('JsonFilter Test recursive', () {
      final jsonFilter = JsonFilter(
        key: 'testKey.testKey2',
        value: 'testValue',
        operator: JsonFilterOperations.equals,
        successScore: 10,
      );

      final result = jsonFilter.filter(
        t: {
          'testKey': {
            'testKey2': 'testValue',
          },
        },
      );

      expect(result, true);
    });
    test('JsonFilter.array Test', () {
      final json = {
        'key1': 10,
        'key2': [
          {
            'key3': 20,
          },
          {
            'key3': 20,
          },
          {
            'key6': 20,
          }
        ],
      };
      final filter = JsonFilter.array(
        key: 'key2.key3',
        value: 20,
        arrayOperator: ArrayFilterOperations.summing,
        successScore: 11,
      );

      final scenario = Scenario<Json>(filter: filter);

      final result = scenario.calculateScore(json);

      expect(result.score, 22);
      expect(result.type, ScenarioType.json);
    });
  });

  group('JsonFilterOperations Test', () {
    test('JsonFilterOperations.equals Test', () {
      final map = {'testKey': 'testValue'};
      final jsonFilter = JsonFilter(
        key: 'testKey',
        value: 'testValue',
        operator: JsonFilterOperations.equals,
        successScore: 10,
      );

      final result = jsonFilter.filter(
        t: map,
      );

      expect(result, true);
    });
    test('JsonFilterOperations.contains Test', () {
      final map = {'testKey': 'testValue'};
      final jsonFilter = JsonFilter(
        key: 'testKey',
        value: 'test',
        operator: JsonFilterOperations.contains,
        successScore: 10,
      );

      final result = jsonFilter.filter(
        t: map,
      );

      expect(result, true);
    });
    test('JsonFilterOperations.notEquals Test', () {
      final map = {'testKey': 'testValue'};
      final jsonFilter = JsonFilter(
        key: 'testKey',
        value: 'test',
        operator: JsonFilterOperations.notEquals,
        successScore: 10,
      );

      final result = jsonFilter.filter(
        t: map,
      );

      expect(result, true);
    });
    test('JsonFilterOperations.isNull Test', () {
      final map = {'testKey': null};
      final jsonFilter = JsonFilter(
        key: 'testKey',
        value: null,
        operator: JsonFilterOperations.isNull,
        successScore: 10,
      );

      final result = jsonFilter.filter(
        t: map,
      );

      expect(result, true);
    });
    test('JsonFilterOperations.notNull Test', () {
      final map = {'testKey': 'testValue'};
      final jsonFilter = JsonFilter(
        key: 'testKey',
        value: null,
        operator: JsonFilterOperations.notNull,
        successScore: 10,
      );

      final result = jsonFilter.filter(
        t: map,
      );

      expect(result, true);
    });
    test('JsonFilterOperations.greaterThanOrEqual Test', () {
      final map = {'testKey': 10};
      final jsonFilter = JsonFilter(
        key: 'testKey',
        value: 10,
        operator: JsonFilterOperations.greaterThanOrEqual,
        successScore: 10,
      );

      final result = jsonFilter.filter(
        t: map,
      );

      expect(result, true);
    });
    test('JsonFilterOperations.lessThanOrEqual Test', () {
      final map = {'testKey': 10};
      final jsonFilter = JsonFilter(
        key: 'testKey',
        value: 10,
        operator: JsonFilterOperations.lessThanOrEqual,
        successScore: 10,
      );

      final result = jsonFilter.filter(
        t: map,
      );

      expect(result, true);
    });
    test('JsonFilterOperations.greaterThan Test', () {
      final map = {'testKey': 11};
      final jsonFilter = JsonFilter(
        key: 'testKey',
        value: 10,
        operator: JsonFilterOperations.greaterThan,
        successScore: 10,
      );

      final result = jsonFilter.filter(
        t: map,
      );

      expect(result, true);
    });
    test('JsonFilterOperations.lessThan Test', () {
      final map = {'testKey': 9};
      final jsonFilter = JsonFilter(
        key: 'testKey',
        value: 10,
        operator: JsonFilterOperations.lessThan,
        successScore: 10,
      );

      final result = jsonFilter.filter(
        t: map,
      );

      expect(result, true);
    });
    test('JsonFilterOperations.startsWith Test', () {
      final map = {'testKey': 'testValue'};
      final jsonFilter = JsonFilter(
        key: 'testKey',
        value: 'test',
        operator: JsonFilterOperations.startsWith,
        successScore: 10,
      );

      final result = jsonFilter.filter(
        t: map,
      );

      expect(result, true);
    });
    test('JsonFilterOperations.endsWith Test', () {
      final map = {'testKey': 'testValue'};
      final jsonFilter = JsonFilter(
        key: 'testKey',
        value: 'Value',
        operator: JsonFilterOperations.endsWith,
        successScore: 10,
      );

      final result = jsonFilter.filter(
        t: map,
      );

      expect(result, true);
    });
    test('JsonFilterOperations.equalsRoundedToTwoDecimals Test', () {
      final map = {'testKey': 10.123456};
      final jsonFilter = JsonFilter(
        key: 'testKey',
        value: 10.12,
        operator: JsonFilterOperations.equalsRoundedToTwoDecimals,
        successScore: 10,
      );

      final result = jsonFilter.filter(
        t: map,
      );

      expect(result, true);
    });
    test('JsonFilterOperations.equalsRounded Test', () {
      final map = {'testKey': 10.123456};
      final jsonFilter = JsonFilter(
        key: 'testKey',
        value: 10.123456,
        operator: JsonFilterOperations.equalsRounded,
        successScore: 10,
      );

      final result = jsonFilter.filter(
        t: map,
      );

      expect(result, true);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:scenario_scoring/scenarios/concatenate/concatenate_filter.dart';
import 'package:scenario_scoring/scenarios/concatenate/concatenate_operations.dart';
import 'package:scenario_scoring/scenarios/json/json_filter.dart';
import 'package:scenario_scoring/scenarios/json/json_filter_operations.dart';

void main() {
  group('ConcatenateFilter Test', () {
    test('ConcatenateFilter.and', () {
      final map = {
        'key1': '10',
        'key2': '10',
      };
      final filters = [
        JsonFilter(
          key: 'key1',
          value: '10',
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
        JsonFilter(
          key: 'key1',
          value: '10',
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
      ];
      final concatenateFilter = ConcatenateFilter(
        concatenateOperator: ConcatenateOperations.and,
        filters: filters,
      );

      final result = concatenateFilter.filter(
        t: map,
      );

      expect(result, true);
    });

    test('ConcatenateFilter.or', () {
      final map = {
        'key1': '10',
        'key2': '10',
      };
      final filters = [
        JsonFilter(
          key: 'key1',
          value: '10',
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
        JsonFilter(
          key: 'key1',
          value: '10',
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
      ];
      final concatenateFilter = ConcatenateFilter(
        concatenateOperator: ConcatenateOperations.or,
        filters: filters,
      );

      final result = concatenateFilter.filter(
        t: map,
      );

      expect(result, true);
    });
  });
}

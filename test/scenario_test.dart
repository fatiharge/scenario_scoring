import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scenario_scoring/core/scenario.dart';
import 'package:scenario_scoring/core/scenario_type.dart';

import 'package:scenario_scoring/scenarios/array/array_filter.dart';
import 'package:scenario_scoring/scenarios/array/array_filter_operations.dart';
import 'package:scenario_scoring/scenarios/concatenate/concatenate_filter.dart';
import 'package:scenario_scoring/scenarios/concatenate/concatenate_operations.dart';
import 'package:scenario_scoring/scenarios/json/json_filter.dart';
import 'package:scenario_scoring/scenarios/json/json_filter_operations.dart';

void main() {
  group('Scenario Test', () {
    test('Scenario JsonFilter test recursive', () {
      final json = {
        'key1': 10,
        'key2': {
          'key3': 20,
        },
      };
      final filter = JsonFilter(
        key: 'key2.key3',
        value: 20,
        operator: JsonFilterOperations.equals,
        successScore: 11,
      );

      final scenario = Scenario<Json>(filter: filter);

      final result = scenario.calculateScore(json);

      expect(result.score, 11);
      expect(result.type, ScenarioType.json);
    });

    test('Scenario ArrayFilter Test ', () {
      final ary = [
        {'key1': '10'},
        {'key1': '12'},
        {'key1': '10'},
        {'key2': '32'},
      ];

      final filter = ArrayFilter(
        arrayFilterOperations: ArrayFilterOperations.summing,
        successScore: 10,
        objectFilter: JsonFilter(
          key: 'key1',
          value: '10',
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
      );

      final scenario = Scenario<List<Map<String, dynamic>>>(filter: filter);

      final result = scenario.calculateScore(ary);

      expect(result.score, 20);
      expect(result.type, ScenarioType.json);
    });

    test('Scenario ConcatenateFilter Test ', () {
      final map = {
        'key1': 10,
      };
      final filters = [
        JsonFilter(
          key: 'key1',
          value: 10,
          operator: JsonFilterOperations.equals,
          successScore: 10,
        ),
        JsonFilter(
          key: 'key1',
          value: 5,
          operator: JsonFilterOperations.greaterThan,
          successScore: 5,
        ),
      ];
      final concatenateFilter = ConcatenateFilter(
        concatenateOperator: ConcatenateOperations.and,
        filters: filters,
      );

      final scenario = Scenario<dynamic>(filter: concatenateFilter);

      final result = scenario.calculateScore(map);

      expect(result.score, 15);

      expect(result.type, ScenarioType.json);
    });

    test('Real life example Test 1 ', () {
      final data1 = {
        'name': 'John Doe',
        'age': 30,
        'skills': [
          {'language': 'Java'},
          {'language': 'Dart'},
          {'language': 'Python'},
        ],
        'address': {
          'street': '20 W 34th St',
          'city': 'New York',
          'country': 'United States',
        },
        'projects': [
          {
            'name': 'Project 1',
            'description': 'Description of Project 1',
            'languages': 'Python',
          },
          {
            'name': 'Project 2',
            'description': 'Description of Project 2',
            'languages': 'C++',
          },
          {
            'name': 'Project 3',
            'description': 'Description of Project 3',
            'languages': 'Dart',
          },
        ],
      };

      final filter = ConcatenateFilter(
        concatenateOperator: ConcatenateOperations.and,
        filters: [
          JsonFilter(
            key: 'age',
            value: 45,
            operator: JsonFilterOperations.lessThanOrEqual,
            successScore: 1,
          ),
          JsonFilter.array(
            key: 'skills.language',
            value: 'Dart',
            arrayOperator: ArrayFilterOperations.contains,
            successScore: 0,
          ),
          JsonFilter(
            key: 'address.country',
            value: 'United States',
            operator: JsonFilterOperations.equals,
            successScore: 0,
          ),
          JsonFilter(
            key: 'age',
            value: 18,
            operator: JsonFilterOperations.greaterThanOrEqual,
            successScore: 0,
          ),
          JsonFilter.array(
            key: 'skills.language',
            value: 'C#',
            arrayOperator: ArrayFilterOperations.notContains,
            successScore: 0,
          ),
          ConcatenateFilter(
            concatenateOperator: ConcatenateOperations.or,
            filters: [
              ConcatenateFilter(
                concatenateOperator: ConcatenateOperations.and,
                successScore: 10,
                filters: [
                  JsonFilter(
                    key: 'age',
                    value: 23,
                    operator: JsonFilterOperations.greaterThanOrEqual,
                    successScore: 0,
                  ),
                  JsonFilter(
                    key: 'age',
                    value: 33,
                    operator: JsonFilterOperations.lessThan,
                    successScore: 0,
                  ),
                ],
              ),
              JsonFilter.array(
                key: 'skills.language',
                value: 'Java',
                arrayOperator: ArrayFilterOperations.contains,
                successScore: 20,
              ),
              JsonFilter.array(
                key: 'skills.language',
                value: 'Python',
                arrayOperator: ArrayFilterOperations.contains,
                successScore: 15,
              ),
              JsonFilter.array(
                key: 'projects.languages',
                value: 'Dart',
                arrayOperator: ArrayFilterOperations.summing,
                successScore: 40,
              ),
              JsonFilter.array(
                key: 'projects.languages',
                value: 'Assembly',
                arrayOperator: ArrayFilterOperations.summing,
                successScore: 23,
              ),
            ],
          ),
        ],
      );

      final scenario = Scenario<dynamic>(filter: filter);

      final response1 = scenario.calculateScore(data1);

      if (kDebugMode) {
        print(response1);
      }
    });
    test('Real life example Test 2 ', () {
      final data1 = {
        'name': 'John Doe',
        'age': 35,
        'skills': [
          {'language': 'Java'},
          {'language': 'Dart'},
          {'language': 'Python'},
        ],
        'address': {
          'street': '20 W 34th St',
          'city': 'New York',
          'country': 'United States',
        },
        'projects': [
          {
            'name': 'Project 1',
            'description': 'Description of Project 1',
            'languages': 'Python',
          },
          {
            'name': 'Project 2',
            'description': 'Description of Project 2',
            'languages': 'Dart',
          },
          {
            'name': 'Project 3',
            'description': 'Description of Project 3',
            'languages': 'Dart',
          },
        ],
      };

      final filter = ConcatenateFilter(
        concatenateOperator: ConcatenateOperations.and,
        filters: [
          JsonFilter(
            key: 'age',
            value: 45,
            operator: JsonFilterOperations.lessThanOrEqual,
            successScore: 1,
          ),
          JsonFilter.array(
            key: 'skills.language',
            value: 'Dart',
            arrayOperator: ArrayFilterOperations.contains,
            successScore: 0,
          ),
          JsonFilter(
            key: 'address.country',
            value: 'United States',
            operator: JsonFilterOperations.equals,
            successScore: 0,
          ),
          JsonFilter(
            key: 'age',
            value: 18,
            operator: JsonFilterOperations.greaterThanOrEqual,
            successScore: 0,
          ),
          JsonFilter.array(
            key: 'skills.language',
            value: 'C#',
            arrayOperator: ArrayFilterOperations.notContains,
            successScore: 0,
          ),
          ConcatenateFilter(
            concatenateOperator: ConcatenateOperations.or,
            filters: [
              ConcatenateFilter(
                concatenateOperator: ConcatenateOperations.and,
                successScore: 10,
                filters: [
                  JsonFilter(
                    key: 'age',
                    value: 23,
                    operator: JsonFilterOperations.greaterThanOrEqual,
                    successScore: 0,
                  ),
                  JsonFilter(
                    key: 'age',
                    value: 33,
                    operator: JsonFilterOperations.lessThan,
                    successScore: 0,
                  ),
                ],
              ),
              JsonFilter.array(
                key: 'skills.language',
                value: 'Java',
                arrayOperator: ArrayFilterOperations.contains,
                successScore: 20,
              ),
              JsonFilter.array(
                key: 'skills.language',
                value: 'Python',
                arrayOperator: ArrayFilterOperations.contains,
                successScore: 15,
              ),
              JsonFilter.array(
                key: 'projects.languages',
                value: 'Dart',
                arrayOperator: ArrayFilterOperations.summing,
                successScore: 40,
              ),
              JsonFilter.array(
                key: 'projects.languages',
                value: 'Assembly',
                arrayOperator: ArrayFilterOperations.summing,
                successScore: 23,
              ),
            ],
          ),
        ],
      );

      final scenario = Scenario<dynamic>(filter: filter);

      final response1 = scenario.calculateScore(data1);

      if (kDebugMode) {
        print(response1);
      }
    });
  });
}

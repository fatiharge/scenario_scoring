# Scenario Scoring

This project is a dynamic software that scores certain types of data and generates reports.

## Description

This software scores data according to specified rules and generates a report based on these scores.
The software has the ability to process various types of data and rules. This means that the
software can handle a wide range of data and complex business rules. The software supports JSON,
array, and merge scenarios. This allows the software to work with different data structures. There
are customizable filters for each scenario. These filters determine which data a particular scenario
will process.

There is customizable scoring for each filter. This means that a specific scoring algorithm can be
applied for each filter. The software also calculates the total scoring time. This determines how
long each scenario is completed.

The software generates a report based on the scores. This report contains a summary and analysis of
the scores. The report can be generated in different formats. This means that the report can be
customized according to various needs.

In conclusion, this software is a dynamic tool that scores data according to specified rules and
generates a report based on these scores. The flexibility and customizable of the software allows it
to process a wide set of data and rules.

## Features

- Supports JSON, array, and merge scenarios
- Customizable filters for each scenario
- Customizable scoring for each filter
- Calculates total scoring time

## Dependencies

- Dart: '>=3.3.3 <4.0.0'
- Flutter SDK
- very_good_analysis: ^5.1.0

## Usage

You can find the scenarios and filters in the `lib/scenarios` directory. There is a Dart file for
each scenario. These files determine how the scenario works and which filters are used.

## Real Life Example

This example represents test scenarios used to filter and score a specific data set. These scenarios
determine data that meet certain conditions using a series of filters, and each of these filters
results in a specific score.

Firstly, a data set named `data1` has been created. This data set contains information such as a
person's name, age, skills, address, and projects.

Then, a filter named `ConcatenateFilter` has been created. This filter serves as an upper filter
that combines a series of sub-filters. In this example, sub-filters have been created
using `JsonFilter` and `JsonFilter.array`. These filters check whether a specific key has a specific
value. For instance, the `JsonFilter` filter checks whether the value of the 'age' key is less than
or equal to 45.

The `ConcatenateFilter` filter uses an operation to combine the results of the sub-filters. In this
example, the 'and' operation has been used, meaning all the results of the sub-filters must be '
true'.

Finally, an object named `Scenario` has been created. This object runs the scenario by applying the
filters and calculating the results. In this example, the `calculateScore` function calculates the
score of the data set.

These pieces of code demonstrate how to create and run a scenario to filter and score a specific
data set. Such a scenario can be used to determine data that meet certain conditions and assign a
score to these data.

```dart

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

print(response1);
```

## License

This project is licensed under the [MIT](LICENSE) license.
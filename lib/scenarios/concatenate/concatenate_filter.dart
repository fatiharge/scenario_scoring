import 'package:scenario_scoring/core/filter.dart';
import 'package:scenario_scoring/scenarios/concatenate/concatenate_operations.dart';

/// `ConcatenateFilter` is a class that extends the `Filter` class.
/// It is used to apply a set of filters to a given input and combine the
/// results using a specified operation.
/// The operation can be either 'and' or 'or'.
class ConcatenateFilter extends Filter<dynamic> {
  /// Creates a new instance of `ConcatenateFilter`.
  ///
  /// The [concatenateOperator] parameter specifies the operation to use when
  /// combining the results of the filters.
  /// The [filters] parameter is a list of filters to apply to the input.
  /// The [successScore] parameter is the initial score for a successful filter
  /// operation. It defaults to 1.
  ConcatenateFilter({
    required this.concatenateOperator,
    required this.filters,
    super.successScore = 1,
  });

  /// The operation to use when combining the results of the filters.
  final ConcatenateOperations concatenateOperator;

  /// The list of filters to apply to the input.
  final List<Filter<dynamic>> filters;

  /// Applies the filters to the input and combines the results using the
  /// specified operation.
  ///
  /// The [t] parameter is the input to apply the filters to.
  ///
  /// Returns `true` if the combined result of the filters is `true`, and
  /// `false` otherwise.
  @override
  bool filter({required dynamic t}) {
    switch (concatenateOperator) {
      case ConcatenateOperations.and:
        var score = 0;
        final result = filters.any((element) {
          final result = !element.filter(t: t);
          if (!result) {
            score += element.successScore;
          }

          return result;
        });
        if (successScore == 1) {
          successScore = score;
        }

        return !result;
      case ConcatenateOperations.or:
        var score = 0;

        filters.where((element) => element.filter(t: t)).forEach((element) {
          score += element.successScore;
        });

        if (successScore == 1) {
          successScore = score;
        }
        return score != 0;
    }
  }
}

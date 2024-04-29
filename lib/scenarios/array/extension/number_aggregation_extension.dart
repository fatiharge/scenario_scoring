import 'dart:math' as math;

import 'package:scenario_scoring/scenarios/array/array_filter.dart';
import 'package:scenario_scoring/scenarios/array/extension/array_filter_extension.dart';
import 'package:scenario_scoring/scenarios/array/extension/number_aggregation.dart';

/// NumberAggregationExtension extension
///
/// This extension is used to add additional functionality to the ArrayFilter
/// class.
/// It adds several methods that perform different types of aggregation
/// operations on an array.
///
/// The [numberAggregationFilterFunction] method takes a NumberAggregation
/// enum value and an array as parameters.
/// It applies the aggregation operation specified by the enum value to
/// the array.
///
/// The other methods in this extension ([filterWithPercentile],
/// [filterWithVariance], [filterWithStandardDeviation],
/// [filterWithMedian], [filterWithMax], [filterWithMin], [filterWithSum],
/// [filterWithCount], [filterWithAverage]) are helper methods
/// used by the [numberAggregationFilterFunction] method to perform
/// the specific aggregation operations.

extension NumberAggregationExtension on ArrayFilter {
  /// This method takes a NumberAggregation enum value and an array as
  /// parameters.
  /// It applies the aggregation operation specified by the enum value to the
  /// array.
  bool numberAggregationFilterFunction(
    NumberAggregation numberOperation,
    Array t,
  ) {
    final filteredList = getFilteredArrayWithWhere(t);

    switch (numberOperation) {
      case NumberAggregation.count:
        return filterWithCount(filteredList);
      case NumberAggregation.sum:
        return filterWithSum(filteredList);
      case NumberAggregation.average:
        return filterWithAverage(filteredList);
      case NumberAggregation.min:
        return filterWithMin(filteredList);
      case NumberAggregation.max:
        return filterWithMax(filteredList);
      case NumberAggregation.median:
        return filterWithMedian(filteredList);
      case NumberAggregation.standardDeviation:
        return filterWithStandardDeviation(filteredList);
      case NumberAggregation.variance:
        return filterWithVariance(filteredList);
      case NumberAggregation.percentile:
        return filterWithPercentile(filteredList);
    }
  }

  /// filterWithPercentile method
  ///
  /// This method sorts the filtered list in ascending order based on the value
  /// of the key specified in the aggregationFilter.
  /// It then calculates the index of the percentile specified in the
  /// aggregationFilter's value.
  /// The method then creates a map with the key from the aggregationFilter
  /// and the value from the element at the percentile index in the sorted list.
  /// This map is then passed to the filter method of the aggregationFilter,
  /// and the result of this method is returned.

  bool filterWithPercentile(Array filteredList) {
    final sortedList = filteredList
      ..sort(
        (a, b) => (a[aggregationFilter!.key] as num)
            .compareTo(b[aggregationFilter!.key] as num),
      );

    final percentile =
        sortedList.length * (aggregationFilter!.value as num) / 100;

    final map = {
      aggregationFilter!.key: sortedList[percentile.toInt()]
          [aggregationFilter!.key],
    };

    return aggregationFilter!.filter(t: map);
  }

  /// filterWithVariance method
  ///
  /// This method calculates the mean of the values of the key specified in
  /// the aggregationFilter for all elements in the filtered list.
  /// It then calculates the variance of these values.
  /// The method then creates a map with the key from the aggregationFilter and
  /// the calculated variance.
  /// This map is then passed to the filter method of the aggregationFilter,
  /// and the result of this method is returned.

  bool filterWithVariance(Array filteredList) {
    final mean = filteredList
            .map((e) => e[aggregationFilter!.key] as num)
            .reduce((a, b) => a + b) /
        filteredList.length;

    final variance = filteredList
            .map((e) => e[aggregationFilter!.key] as num)
            .map((e) => math.pow(e - mean, 2))
            .reduce((a, b) => a + b) /
        (filteredList.length - 1);

    final map = {
      aggregationFilter!.key: variance,
    };

    return aggregationFilter!.filter(t: map);
  }

  /// filterWithStandardDeviation method
  ///
  /// This method calculates the mean of the values of the key specified in the
  /// aggregationFilter for all elements in the filtered list.
  /// It then calculates the variance of these values and takes the square root
  /// of this variance to get the standard deviation.
  /// The method then creates a map with the key from the aggregationFilter and
  /// the calculated standard deviation.
  /// This map is then passed to the filter method of the aggregationFilter,
  /// and the result of this method is returned.

  bool filterWithStandardDeviation(Array filteredList) {
    final mean = filteredList
            .map((e) => e[aggregationFilter!.key] as num)
            .reduce((a, b) => a + b) /
        (filteredList.length);

    final variance = filteredList
            .map((e) => e[aggregationFilter!.key] as num)
            .map((e) => math.pow(e - mean, 2))
            .reduce((a, b) => a + b) /
        (filteredList.length - 1);

    final standardDeviation = math.sqrt(variance);

    final map = {
      aggregationFilter!.key: standardDeviation,
    };

    return aggregationFilter!.filter(t: map);
  }

  /// filterWithMedian method
  ///
  /// This method sorts the filtered list in ascending order based on the value
  /// of the key specified in the aggregationFilter.
  /// It then calculates the median of these values.
  /// The method then creates a map with the key from the aggregationFilter and
  /// the calculated median.
  /// This map is then passed to the filter method of the aggregationFilter,
  /// and the result of this method is returned.
  bool filterWithMedian(Array filteredList) {
    final sortedList = filteredList
      ..sort(
        (a, b) => (a[aggregationFilter!.key] as num)
            .compareTo(b[aggregationFilter!.key] as num),
      );

    final middle = sortedList.length ~/ 2;

    final median = sortedList.length.isEven
        ? ((sortedList[middle - 1][aggregationFilter!.key] as num) +
                (sortedList[middle][aggregationFilter!.key] as num)) /
            2
        : sortedList[middle][aggregationFilter!.key] as num;

    final map = {
      aggregationFilter!.key: median,
    };

    return aggregationFilter!.filter(t: map);
  }

  /// filterWithMax method
  ///
  /// This method iterates over the filtered list and finds the maximum value
  /// based on the key specified in the aggregationFilter.
  /// The method then creates a map with the key from the aggregationFilter and
  /// the maximum value.
  /// This map is then passed to the filter method of the aggregationFilter,
  /// and the result of this method is returned.
  bool filterWithMax(Array filteredList) {
    num maxValue = double.negativeInfinity;

    for (final element in filteredList) {
      if ((element[aggregationFilter!.key] as num) > maxValue) {
        maxValue = element[aggregationFilter!.key] as num;
      }
    }

    final map = {
      aggregationFilter!.key: maxValue,
    };

    return aggregationFilter!.filter(t: map);
  }

  /// filterWithMin method
  ///
  /// This method iterates over the filtered list and finds the minimum value
  /// based on the key specified in the aggregationFilter.
  /// The method then creates a map with the key from the aggregationFilter and
  /// the minimum value.
  /// This map is then passed to the filter method of the aggregationFilter,
  /// and the result of this method is returned.
  bool filterWithMin(Array filteredList) {
    num minValue = double.infinity;

    for (final element in filteredList) {
      if ((element[aggregationFilter!.key] as num) < minValue) {
        minValue = element[aggregationFilter!.key] as num;
      }
    }

    final map = {
      aggregationFilter!.key: minValue,
    };

    return aggregationFilter!.filter(t: map);
  }

  /// filterWithSum method
  ///
  /// This method calculates the sum of the values of the key specified in
  /// the aggregationFilter for all elements in the filtered list.
  /// The method then creates a map with the key from the aggregationFilter and
  /// the calculated sum.
  /// This map is then passed to the filter method of the aggregationFilter,
  /// and the result of this method is returned.
  bool filterWithSum(Array filteredList) {
    num valueTotal = 0;
    for (final element in filteredList) {
      valueTotal += element[aggregationFilter!.key] as num;
    }

    final map = {
      aggregationFilter!.key: valueTotal,
    };

    return aggregationFilter!.filter(t: map);
  }

  /// filterWithCount method
  ///
  /// This method calculates the count of the elements in the filtered list.
  /// The method then creates a map with the key from the aggregationFilter and
  /// the calculated count.
  /// This map is then passed to the filter method of the aggregationFilter,
  /// and the result of this method is returned.
  bool filterWithCount(Array filteredList) {
    final map = {
      aggregationFilter!.key: filteredList.length,
    };

    return aggregationFilter!.filter(t: map);
  }

  /// filterWithAverage method
  ///
  /// This method calculates the average of the values of the key specified in
  /// the aggregationFilter for all elements in the filtered list.
  /// The method then creates a map with the key from the aggregationFilter and
  /// the calculated average.
  /// This map is then passed to the filter method of the aggregationFilter,
  /// and the result of this method is returned.
  bool filterWithAverage(Array filteredList) {
    num valueTotal = 0;
    for (final element in filteredList) {
      valueTotal += element[aggregationFilter!.key] as num;
    }

    final map = {
      aggregationFilter!.key: valueTotal / filteredList.length,
    };

    return aggregationFilter!.filter(t: map);
  }
}

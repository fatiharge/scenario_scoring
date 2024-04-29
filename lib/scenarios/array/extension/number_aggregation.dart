/// NumberAggregation enum
///
/// This enum is used to define the type of aggregation operation to be
/// performed on a number array.
/// It has nine possible values:
/// - [count]: Represents the operation of counting the number of elements
/// in the array.
/// - [sum]: Represents the operation of summing all the elements in the array.
/// - [average]: Represents the operation of calculating the average of all
/// the elements in the array.
/// - [min]: Represents the operation of finding the smallest element in
/// the array.
/// - [max]: Represents the operation of finding the largest element in
/// the array.
/// - [median]: Represents the operation of finding the median of the
/// elements in the array.
/// - [standardDeviation]: Represents the operation of calculating the
/// standard deviation of the elements in the array.
/// - [variance]: Represents the operation of calculating the variance
/// of the elements in the array.
/// - [percentile]: Represents the operation of calculating a certain
/// percentile of the elements in the array.
enum NumberAggregation {
  ///  Represents the operation of counting the number of elements in the array.
  count,

  ///  Represents the operation of summing all the elements in the array.
  sum,

  ///  Represents the operation of calculating the average of all the elements
  ///  in the array.
  average,

  ///  Represents the operation of finding the smallest element in the array.
  min,

  ///  Represents the operation of finding the largest element in the array.
  max,

  ///  Represents the operation of finding the median of the elements in the
  ///  array.
  median,

  ///  Represents the operation of calculating the standard deviation of the
  ///  elements in the array.
  standardDeviation,

  ///  Represents the operation of calculating the variance of the elements
  ///  in the array.
  variance,

  ///  Represents the operation of calculating a certain percentile of the
  ///  elements in the array.
  percentile,
}

import 'dart:math';

/// A method returns a human readable string representing a file _size
String filesize(dynamic size, [int round = 2]) {
  /** 
   * [size] can be passed as number or as string
   *
   * the optional parameter [round] specifies the number 
   * of digits after comma/point (default is 2)
   */
  final divider = 1024;
  int _size;
  try {
    _size = int.parse(size.toString());
  } catch (e) {
    throw ArgumentError('Can not parse the size parameter: $e');
  }

  final _round = _size < divider || _size % divider == 0 ? 0 : round;
  final units = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];
  final idx = (log(_size.abs()) ~/ log(divider)).clamp(0, units.length - 1);

  return '${(_size / pow(divider, idx)).toStringAsFixed(_round)} ${units[idx]}';
}

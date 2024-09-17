import 'package:logger/logger.dart';

abstract class DefaultLogger {
  static Logger logger = Logger(
      printer: PrettyPrinter(
    colors: true,
    printEmojis: true,
    methodCount: 0,
  ));
}

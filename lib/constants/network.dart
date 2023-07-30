// Imports
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Network {
  static String baseUrl = dotenv.env['BASE_URL'] ?? '';
  static String searchNumber = '${baseUrl}v1/numberLookup/check/';
}

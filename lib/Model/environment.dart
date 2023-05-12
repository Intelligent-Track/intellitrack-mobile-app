import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  static String get filename {
    if (kReleaseMode) {
      return '.env.production';
    }

    return '.env.development';
  }

  static String get apiUrl {
    return dotenv.env['API_URL'] ?? 'NOT FOUND';
  }

  static String get loginPath {
    return dotenv.env['LOGIN_PATH'] ?? 'NOT FOUND';
  }

  static String get signPath {
    return dotenv.env['SIGNUP_PATH'] ?? 'NOT FOUND';
  }

  static String get forgotPath {
    return dotenv.env['FORGOTPASS_PATH'] ?? 'NOT FOUND';
  }

  static String get quoutationPath {
    return dotenv.env['QUOTATION_PATH'] ?? 'NOT FOUND';
  }

  static String get deliverybyNit {
    return dotenv.env['DELIVERY_PATH'] ?? 'NOT FOUND';
  }
  static String get infoUserPath {
    return dotenv.env['INFOUSER_PATH'] ?? 'NOT FOUND';
  }

}


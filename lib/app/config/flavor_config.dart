import 'dart:convert';

import 'package:flutter/services.dart';

enum Flavor {
  dev,
  staging,
  prod,
}

class FlavorConfig {
  final Flavor flavor;
  final String baseUrl;

  static FlavorConfig? _instance;

  factory FlavorConfig({required Flavor flavor, required String baseUrl}) {
    _instance ??= FlavorConfig._internal(flavor, baseUrl);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.baseUrl);

  static FlavorConfig get instance {
    if (_instance == null) {
      throw Exception(
          "FlavorConfig has not been initialized. Call FlavorConfig() in your main entry point.");
    }
    return _instance!;
  }

  static bool isProduction() => _instance?.flavor == Flavor.prod;
  static bool isDevelopment() => _instance?.flavor == Flavor.dev;
  static bool isStaging() => _instance?.flavor == Flavor.staging;

  static Future<void> initialize(Flavor flavor) async {
    final String configPath = 'assets/config/${flavor.name}.json';
    final String configString = await rootBundle.loadString(configPath);
    final Map<String, dynamic> config = json.decode(configString);
    _instance = FlavorConfig(flavor: flavor, baseUrl: config['baseUrl']);
  }
}

import 'package:flutter/material.dart';
import 'package:project_counselling/app/config/flavor_config.dart';
import 'package:project_counselling/main.dart' as app;

void main() {
  FlavorConfig(flavor: Flavor.prod, baseUrl: "https://api.yourapi.com");
  app.main();
}


import 'package:flutter/material.dart';

import 'app.dart';
import 'common/BusinessLayer/DataAccess/Http/Core/Di/di.dart';

void main() {
  configureDependencies();

  runApp(MyApp());
}


import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'dependencies.config.dart';

final getIt = GetIt.instance;

@InjectableInit(asExtension: false)
GetIt configureDependencies() => init(GetIt.I);



import 'package:get_it/get_it.dart';
import 'package:programmingebook/screens/categories/blocs/category_view_model.dart';
import 'package:programmingebook/screens/home/blocs/popular_view_model.dart';
import 'package:programmingebook/services/networks/repositories/app_repository.dart';

GetIt appConfig = GetIt.I;

void setupAppConfig() {
  appConfig.registerFactory(() => AppRepository());

  //Register ViewModel
  appConfig.registerFactory(() => PopularViewModel(appConfig<AppRepository>()));
  appConfig.registerFactory(() => CategoryViewModel(appConfig<AppRepository>()));


}

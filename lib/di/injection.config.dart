// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import '../core/data/datasource/base_local_datasource.dart' as _i24;
import '../core/data/datasource/base_remote_datasource.dart' as _i25;
import '../core/data/datasource/theme_local_datasource.dart' as _i17;
import '../core/data/network/network_Info.dart' as _i9;
import '../core/data/repository/device_repository.dart' as _i5;
import '../core/data/repository/push_notification_repository.dart' as _i15;
import '../core/domain/presentation/blocs/theme_bloc/theme_bloc.dart' as _i31;
import '../core/services/location_helper.dart' as _i8;
import '../core/services/notification_handler.dart' as _i10;
import '../core/utils/handler/auth_handler.dart' as _i3;
import '../features/auth/data/datasource/local_datasource/auth_local_datasource.dart'
    as _i19;
import '../features/auth/data/datasource/remote_datasource/auth_remote_datasource.dart'
    as _i20;
import '../features/auth/data/datasource/remote_datasource/auth_remote_datasource_impl.dart'
    as _i21;
import '../features/auth/data/repository/auth_repository_impl.dart' as _i23;
import '../features/auth/domain/repository/auth_repository.dart' as _i22;
import '../features/auth/domain/usecase/login_usecase.dart' as _i30;
import '../features/auth/presentation/cubits/authentication_cubit.dart' as _i4;
import '../features/splash/domain/usecase/change_is_first_time_usecase.dart'
    as _i26;
import '../features/Task/data/datasource/order_remote_datasource.dart' as _i11;
import '../features/Task/data/datasource/order_remote_datasource_impl.dart'
    as _i12;
import '../features/Task/data/repository/order_repository_impl.dart' as _i14;
import '../features/Task/domain/repository/order_repositpry.dart' as _i13;
import '../features/Task/domain/usecase/add_task_usecase.dart' as _i18;
import '../features/Task/domain/usecase/delete_task.dart' as _i27;
import '../features/Task/domain/usecase/edit_task_usecase.dart' as _i28;
import '../features/Task/domain/usecase/get_my_occasions_usecase.dart' as _i29;
import 'modules/injectable_module.dart'
    as _i32; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final injectableModule = _$InjectableModule();
  gh.singleton<_i3.AuthHandler>(_i3.AuthHandler());
  gh.singleton<_i4.AuthenticationCubit>(
      _i4.AuthenticationCubit(get<_i3.AuthHandler>()));
  gh.singleton<_i5.DeviceRepository>(_i5.DeviceRepository());
  gh.lazySingleton<_i6.Dio>(() => injectableModule.dioInstance);
  gh.lazySingleton<_i7.InternetConnectionChecker>(
      () => injectableModule.connectionChecker);
  gh.factory<_i8.LocationHelper>(() => _i8.LocationHelper());
  gh.lazySingleton<_i9.NetworkInfo>(
      () => _i9.NetworkInfoImpl(get<_i7.InternetConnectionChecker>()));
  gh.singleton<_i10.NotificationHandler>(_i10.NotificationHandler());
  gh.singleton<_i11.OrderRemoteDataSource>(
      _i12.FavoriteRemoteDataSourceImpl(dio: get<_i6.Dio>()));
  gh.singleton<_i13.OrderRepository>(
      _i14.OrderRepositoryImpl(get<_i11.OrderRemoteDataSource>()));
  gh.singleton<_i15.PushNotificationRepository>(
      _i15.PushNotificationRepository());
  await gh.lazySingletonAsync<_i16.SharedPreferences>(
    () => injectableModule.sharedPref,
    preResolve: true,
  );
  gh.lazySingleton<_i17.ThemeLocalDataSource>(
      () => _i17.ThemeLocalDataSourceImpl(get<_i16.SharedPreferences>()));
  gh.factory<_i18.AddTaskUseCase>(
      () => _i18.AddTaskUseCase(repository: get<_i13.OrderRepository>()));
  gh.lazySingleton<_i19.AuthLocalDataSource>(
      () => _i19.AuthLocalDataSourceImp(get<_i16.SharedPreferences>()));
  gh.singleton<_i20.AuthRemoteDataSource>(
      _i21.AuthRemoteDataSourceImpl(dio: get<_i6.Dio>()));
  gh.singleton<_i22.AuthRepository>(_i23.AuthRepositoryImpl(
    get<_i20.AuthRemoteDataSource>(),
    get<_i19.AuthLocalDataSource>(),
    get<_i3.AuthHandler>(),
  ));
  gh.lazySingleton<_i24.BaseLocalDataSource>(
      () => _i24.BaseLocalDataSourceImp(get<_i16.SharedPreferences>()));
  gh.lazySingleton<_i25.BaseRemoteDataSourceImpl>(
      () => _i25.BaseRemoteDataSourceImpl(dio: get<_i6.Dio>()));
  gh.factory<_i26.ChangeIsFirstTimeUseCase>(() =>
      _i26.ChangeIsFirstTimeUseCase(repository: get<_i22.AuthRepository>()));
  gh.factory<_i27.DeleteTaskUseCase>(
      () => _i27.DeleteTaskUseCase(repository: get<_i13.OrderRepository>()));
  gh.factory<_i28.EditTaskUseCase>(
      () => _i28.EditTaskUseCase(repository: get<_i13.OrderRepository>()));
  gh.factory<_i29.GetMyOccasionsUseCase>(() =>
      _i29.GetMyOccasionsUseCase(repository: get<_i13.OrderRepository>()));
  gh.factory<_i30.LoginUseCase>(
      () => _i30.LoginUseCase(repository: get<_i22.AuthRepository>()));
  gh.singleton<_i31.ThemeBloc>(
      _i31.ThemeBloc(baseLocalDataSourcel: get<_i17.ThemeLocalDataSource>()));
  return get;
}

class _$InjectableModule extends _i32.InjectableModule {}

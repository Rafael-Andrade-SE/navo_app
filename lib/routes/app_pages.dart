import 'package:get/get.dart';
import 'package:navo_app/modules/auth/bindings/auth_binding.dart';
import 'package:navo_app/modules/auth/views/cadastro_view.dart';
import 'package:navo_app/modules/auth/views/login_view.dart';
import 'package:navo_app/modules/config/binding/config_binding.dart';
import 'package:navo_app/modules/config/views/config_view.dart';
import 'package:navo_app/modules/home/bindings/home_binding.dart';
import 'package:navo_app/modules/home/views/home_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.cadastro,
      page: () => CadastroView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(name: AppRoutes.config, binding: ConfigBinding(), page: () =>  ConfigView()),
  ];
}

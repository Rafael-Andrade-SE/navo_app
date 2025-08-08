import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ConfigController extends GetxController {
  final storage = GetStorage();
  final RxString metaDiaria = ''.obs;

  @override
  void onInit() {
    metaDiaria.value = storage.read('metaDiaria') ?? '';
    super.onInit();
  }

  void salvarMeta(String valor) {
    metaDiaria.value = valor;
    storage.write('metaDiaria', valor);
    Get.snackbar('Sucesso', 'Meta diária atualizada!');
  }
}

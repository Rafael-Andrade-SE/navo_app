import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final isLoading = false.obs;

  Future<void> login(String email, String senha) async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    // Aqui você chama o AuthService e trata resposta
    isLoading.value = false;
    Get.offAllNamed('/home');
  }

  Future<void> cadastrar(
    String nome,
    String email,
    String senha,
    List<Map<String, String>>? veiculos,
  ) async {
    isLoading.value = true;

    try {
      // final payload = {
      //   'nome': nome,
      //   'email': email,
      //   'senha': senha,
      //   'role': 'MOTORISTA', // ou o que você desejar fixar
      //   if (veiculos != null && veiculos.isNotEmpty) 'veiculos': veiculos,
      // };

      // Exemplo com API usando Dio (ou troque por http)
      // final response = await dio.post('/api/v1/usuarios', data: payload);

      await Future.delayed(
        const Duration(seconds: 2),
      ); // remover quando integrar com backend

      // Após cadastro com sucesso, redireciona
      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
        'Erro ao cadastrar',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navo_app/routes/app_routes.dart';
import 'package:navo_app/theme/app_theme.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.lock_outline,
                  size: 64,
                  color: AppTheme.primaryColor,
                ),
                const SizedBox(height: 20),
                Text(
                  'Bem-vindo de volta 👋',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Faça login para continuar usando o Navo',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.textColor.withAlpha((0.7 * 255).toInt()),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Campo de e-mail
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),

                // Campo de senha
                TextField(
                  controller: _senhaController,
                  decoration: const InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                ),
                const SizedBox(height: 24),

                // Botão de login ou loading
                Obx(
                  () => controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: () {
                            final email = _emailController.text.trim();
                            final senha = _senhaController.text.trim();
                            controller.login(email, senha);
                          },
                          child: const Text('Entrar'),
                        ),
                ),
                const SizedBox(height: 16),

                // Ação para cadastro
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Não tem uma conta?"),
                    TextButton(
                      onPressed: () => Get.toNamed(AppRoutes.cadastro),
                      child: const Text('Criar conta'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/app_theme.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_MenuItem> menuItems = [
      _MenuItem(title: 'Transações', icon: Icons.swap_horiz, route: '/transacoes'),
      _MenuItem(title: 'Painel', icon: Icons.pie_chart_outline, route: '/painel'),
      _MenuItem(title: 'Dashboard', icon: Icons.dashboard_outlined, route: '/dashboard'),
    ];

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Botão de configurações alinhado à direita
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.settings, size: 28, color: AppTheme.primaryColor),
                      tooltip: 'Configurações',
                      onPressed: () => Get.toNamed('/configuracoes'),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Título de boas-vindas
                  const Text(
                    'Olá!',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Escolha uma opção abaixo:',
                    style: TextStyle(fontSize: 16, color: AppTheme.textColor),
                  ),
                  const SizedBox(height: 30),

                  // Menu de botões
                  Expanded(
                    child: ListView.separated(
                      itemCount: menuItems.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        final item = menuItems[index];
                        return ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: Icon(item.icon, size: 28),
                          label: Text(
                            item.title,
                            style: const TextStyle(fontSize: 18),
                          ),
                          onPressed: () => Get.toNamed(item.route),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final IconData icon;
  final String route;

  _MenuItem({required this.title, required this.icon, required this.route});
}

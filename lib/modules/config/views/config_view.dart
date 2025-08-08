import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navo_app/modules/config/controllers/config_controller.dart';
import 'package:navo_app/theme/app_theme.dart';

class ConfigView extends StatelessWidget {
  const ConfigView({super.key});

  @override
  Widget build(BuildContext context) {
    final configController = Get.find<ConfigController>();

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Configurações'),
        backgroundColor: AppTheme.appBarBackgroundColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text(
            'Preferências',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 12),

          // Modo escuro (sem ação por enquanto)
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text('Modo escuro'),
            trailing: Switch(
              value: false,
              onChanged: null,
            ),
          ),
          const Divider(),

          // Meta diária (com abertura de modal)
          Obx(() => ListTile(
                leading: const Icon(Icons.flag_outlined),
                title: const Text('Meta diária (R\$)'),
                subtitle: configController.metaDiaria.value.isNotEmpty
                    ? Text('R\$ ${configController.metaDiaria.value}')
                    : const Text('Não definida'),
                trailing: const Icon(Icons.edit),
                onTap: () => _abrirModalMetaDiaria(context, configController),
              )),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.notifications_active_outlined),
            title: const Text('Notificações'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Get.snackbar('Notificações', 'Funcionalidade em desenvolvimento');
            },
          ),
          const Divider(),

          const SizedBox(height: 30),

          const Text(
            'Conta',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 12),

          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Dados da conta'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Get.snackbar('Dados da conta', 'Funcionalidade em breve');
            },
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair do app'),
            textColor: AppTheme.errorColor,
            iconColor: AppTheme.errorColor,
            onTap: () {
              Get.defaultDialog(
                title: 'Sair',
                middleText: 'Deseja realmente sair do aplicativo?',
                textCancel: 'Cancelar',
                textConfirm: 'Sair',
                confirmTextColor: Colors.white,
                onConfirm: () => Get.offAllNamed('/login'),
              );
            },
          ),
        ],
      ),
    );
  }

  void _abrirModalMetaDiaria(
      BuildContext context, ConfigController controller) {
    final TextEditingController metaController = TextEditingController(
      text: controller.metaDiaria.value,
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return Padding(
          padding: MediaQuery.of(ctx).viewInsets,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Definir meta diária',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: metaController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Valor em R\$',
                    prefixIcon: Icon(Icons.attach_money),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text('Salvar'),
                  onPressed: () {
                    final meta = metaController.text.trim();
                    if (meta.isNotEmpty) {
                      controller.salvarMeta(meta);
                      Get.back();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

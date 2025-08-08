import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/app_theme.dart';
import '../controllers/auth_controller.dart';

class VeiculoFormModel {
  final TextEditingController modelo = TextEditingController();
  final TextEditingController marca = TextEditingController();
  final TextEditingController ano = TextEditingController();
  final RxString cor = ''.obs;

  void dispose() {
    modelo.dispose();
    marca.dispose();
    ano.dispose();
  }
}

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  final controller = Get.find<AuthController>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  final RxBool exibirVeiculos = false.obs;
  final RxList<VeiculoFormModel> veiculos = <VeiculoFormModel>[].obs;

  bool validarAno(String value) {
    if (value.length != 4) return false;
    final ano = int.tryParse(value);
    final limite = DateTime.now().year + 1;
    return ano != null && ano >= 1990 && ano <= limite;
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    for (var v in veiculos) {
      v.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro', style: theme.textTheme.titleLarge),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Campos de usuário
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _senhaController,
              decoration: const InputDecoration(
                labelText: 'Senha',
                prefixIcon: Icon(Icons.lock_outline),
              ),
              obscureText: true,
            ),

            const SizedBox(height: 24),

            // Botão para mostrar veículo
            Obx(() => !exibirVeiculos.value
                ? OutlinedButton.icon(
                    icon: const Icon(Icons.directions_car),
                    label: const Text('Cadastrar com veículo'),
                    onPressed: () {
                      exibirVeiculos.value = true;
                      veiculos.add(VeiculoFormModel());
                    },
                  )
                : const SizedBox.shrink()),

            // Lista de veículos
            Obx(() => Column(
                  children: veiculos.asMap().entries.map((entry) {
                    final index = entry.key;
                    final veiculo = entry.value;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        Text('Veículo ${index + 1}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 12),
                        TextField(
                          controller: veiculo.modelo,
                          decoration: const InputDecoration(
                            labelText: 'Modelo',
                            prefixIcon: Icon(Icons.directions_car),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: veiculo.marca,
                          decoration: const InputDecoration(
                            labelText: 'Marca',
                            prefixIcon: Icon(Icons.directions_bus),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: veiculo.ano,
                          decoration: const InputDecoration(
                            labelText: 'Ano de Fabricação',
                            prefixIcon: Icon(Icons.date_range),
                            counterText: '',
                          ),
                          maxLength: 4,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (value.length > 4) {
                              veiculo.ano.text = value.substring(0, 4);
                              veiculo.ano.selection = TextSelection.fromPosition(
                                TextPosition(offset: veiculo.ano.text.length),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 12),
                        Obx(() => DropdownButtonFormField<String>(
                              value: veiculo.cor.value.isEmpty
                                  ? null
                                  : veiculo.cor.value,
                              items: [
                                'Preto',
                                'Branco',
                                'Cinza',
                                'Prata',
                                'Vermelho',
                                'Azul',
                                'Verde',
                                'Amarelo',
                                'Outro',
                              ]
                                  .map((cor) => DropdownMenuItem(
                                        value: cor,
                                        child: Text(cor),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                if (value != null) veiculo.cor.value = value;
                              },
                              decoration: const InputDecoration(
                                labelText: 'Cor',
                                prefixIcon: Icon(Icons.color_lens),
                              ),
                            )),
                      ],
                    );
                  }).toList(),
                )),

            // Botão adicionar novo veículo
            Obx(() => veiculos.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text('Adicionar outro veículo'),
                      onPressed: () {
                        final ultimo = veiculos.last;
                        if (ultimo.modelo.text.isEmpty ||
                            ultimo.marca.text.isEmpty ||
                            !validarAno(ultimo.ano.text) ||
                            ultimo.cor.value.isEmpty) {
                          Get.snackbar(
                            'Campos incompletos',
                            'Preencha todos os campos corretamente antes de adicionar outro veículo.',
                            backgroundColor: AppTheme.errorColor,
                            colorText: Colors.white,
                          );
                          return;
                        }
                        veiculos.add(VeiculoFormModel());
                      },
                    ),
                  )
                : const SizedBox.shrink()),

            const SizedBox(height: 24),

            // Botão Cadastrar usuário
            Obx(() => controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ElevatedButton.icon(
                    icon: const Icon(Icons.person_add),
                    label: const Text('Cadastrar'),
                    onPressed: () {
                      final nome = _nomeController.text.trim();
                      final email = _emailController.text.trim();
                      final senha = _senhaController.text.trim();

                      final listaVeiculos = veiculos
                          .map((v) => {
                                "modelo": v.modelo.text.trim(),
                                "marca": v.marca.text.trim(),
                                "ano": v.ano.text.trim(),
                                "cor": v.cor.value.trim(),
                              })
                          .toList();

                      controller.cadastrar(nome, email, senha, listaVeiculos);
                    },
                  )),

            const SizedBox(height: 24),

            // Botão Voltar
            TextButton.icon(
              onPressed: () => Get.offAllNamed('/login'),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Voltar para Login'),
            ),
          ],
        ),
      ),
    );
  }
}

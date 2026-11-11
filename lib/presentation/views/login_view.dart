
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../widgets/app_primary_button.dart';
import '../widgets/app_text_field.dart';
import 'dashboard_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _rememberMe = true;
  bool _hidePassword = true;
  bool _isStudent = true;
  bool _useEmail = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => const DashboardView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.school_rounded,
                    size: 64,
                    color: colors.primary,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'TARMAX',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: colors.primary,
                    ),
                  ),
                  Text(
                    'CAMPUS MARKET',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.labelLarge,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Aplikasi Belanja Kebutuhan Kampus & Kantin',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  Text(
                    'Pilih Peran Akun',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _roleTile(
                    title: 'Mahasiswa',
                    subtitle: 'Akses sebagai pembeli & jelajah katalog',
                    icon: Icons.school_outlined,
                    selected: _isStudent,
                    onTap: () {
                      setState(() => _isStudent = true);
                    },
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _roleTile(
                    title: 'Mitra Toko & Kantin',
                    subtitle: 'Akses pengelolaan produk dan pesanan',
                    icon: Icons.storefront_outlined,
                    selected: !_isStudent,
                    onTap: () {
                      setState(() => _isStudent = false);
                    },
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SegmentedButton<bool>(
                              segments: const [
                                ButtonSegment(
                                  value: true,
                                  label: Text('Email SSO Kampus'),
                                ),
                                ButtonSegment(
                                  value: false,
                                  label: Text('WhatsApp / HP'),
                                ),
                              ],
                              selected: {_useEmail},
                              onSelectionChanged: (values) {
                                setState(() {
                                  _useEmail = values.first;
                                });
                              },
                            ),
                            const SizedBox(height: AppSpacing.md),
                            AppTextField(
                              label: _useEmail
                                  ? 'NIM / Email SSO Kampus'
                                  : 'Nomor WhatsApp / HP',
                              controller: _emailController,
                              prefixIcon: _useEmail
                                  ? Icons.email_outlined
                                  : Icons.phone_outlined,
                              keyboardType: _useEmail
                                  ? TextInputType.emailAddress
                                  : TextInputType.phone,
                              validator: (value) {
                                if (value == null ||
                                    value.trim().isEmpty) {
                                  return 'Kolom ini wajib diisi';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: AppSpacing.md),
                            AppTextField(
                              label: 'Kata Sandi',
                              controller: _passwordController,
                              prefixIcon: Icons.lock_outline,
                              obscureText: _hidePassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _hidePassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                ),
                                tooltip: _hidePassword
                                    ? 'Tampilkan kata sandi'
                                    : 'Sembunyikan kata sandi',
                                onPressed: () {
                                  setState(() {
                                    _hidePassword = !_hidePassword;
                                  });
                                },
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Masukkan kata sandi';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            CheckboxListTile(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value ?? false;
                                });
                              },
                              title: const Text(
                                'Ingat saya di perangkat ini',
                              ),
                              controlAffinity:
                                  ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.zero,
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            AppPrimaryButton(
                              label: 'Masuk Sekarang',
                              icon: Icons.arrow_forward,
                              onPressed: _login,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    'Dilindungi oleh Sistem Autentikasi Kampus Terpadu',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _roleTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: colors.primary,
        ),
        title: Text(
          title,
          style: theme.textTheme.titleMedium,
        ),
        subtitle: Text(subtitle),
        trailing: Icon(
          selected
              ? Icons.check_circle
              : Icons.radio_button_unchecked,
          color: selected ? colors.primary : colors.outline,
        ),
      ),
    );
  }
}

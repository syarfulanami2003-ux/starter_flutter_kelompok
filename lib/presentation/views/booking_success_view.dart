
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../widgets/app_primary_button.dart';
import 'dashboard_view.dart';

class BookingSuccessView extends StatelessWidget {
  final String nama;
  final String harga;
  final int jumlah;
  final String total;
  final String pengambilan;

  const BookingSuccessView({
    super.key,
    required this.nama,
    required this.harga,
    required this.jumlah,
    required this.total,
    required this.pengambilan,
  });

  void _backToHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<void>(
        builder: (_) => const DashboardView(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pemesanan Berhasil'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    size: 100,
                    color: colors.primary,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Pesanan Berhasil!',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Terima kasih sudah melakukan pemesanan '
                    'melalui TARMAX Campus Market.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ringkasan Pesanan',
                            style: theme.textTheme.titleLarge,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          _summaryRow(
                            context,
                            'Produk',
                            nama,
                          ),
                          const Divider(),
                          _summaryRow(
                            context,
                            'Harga Satuan',
                            harga,
                          ),
                          const Divider(),
                          _summaryRow(
                            context,
                            'Jumlah',
                            '$jumlah',
                          ),
                          const Divider(),
                          _summaryRow(
                            context,
                            'Pengambilan',
                            pengambilan,
                          ),
                          const Divider(),
                          _summaryRow(
                            context,
                            'Total',
                            total,
                            emphasize: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Ini adalah simulasi pemesanan. '
                    'Belum ada data yang dikirim ke server.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  AppPrimaryButton(
                    label: 'Kembali ke Beranda',
                    icon: Icons.home_outlined,
                    onPressed: () => _backToHome(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _summaryRow(
    BuildContext context,
    String label,
    String value, {
    bool emphasize = false,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.sm,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: emphasize
                  ? theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    )
                  : theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

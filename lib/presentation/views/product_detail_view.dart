
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../widgets/app_primary_button.dart';
import 'booking_form_view.dart';

class ProductDetailView extends StatelessWidget {
  final String nama;
  final String lokasi;
  final String harga;

  const ProductDetailView({
    super.key,
    required this.nama,
    required this.lokasi,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    color: colors.primaryContainer,
                    borderRadius: BorderRadius.circular(AppSpacing.md),
                  ),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 90,
                    color: colors.primary,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  nama,
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  harga,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: colors.primary,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    Icon(
                      Icons.storefront_outlined,
                      color: colors.primary,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: Text(
                        lokasi,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'Deskripsi Produk',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Produk kebutuhan mahasiswa yang tersedia '
                  'melalui TARMAX Campus Market. '
                  'Pesanan dapat diambil di mitra kampus '
                  'sesuai jadwal yang dipilih.',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.lg),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Informasi Produk',
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        const Row(
                          children: [
                            Icon(Icons.check_circle_outline),
                            SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Text('Tersedia untuk pemesanan'),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        const Row(
                          children: [
                            Icon(Icons.local_shipping_outlined),
                            SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Text('Pengambilan di area kampus'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                AppPrimaryButton(
                  label: 'Pesan Sekarang',
                  icon: Icons.arrow_forward,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (_) => BookingFormView(
                          nama: nama,
                          lokasi: lokasi,
                          harga: harga,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

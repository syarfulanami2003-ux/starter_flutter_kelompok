
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../widgets/hunian_card.dart';
import 'product_detail_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  void _openProduct(
    BuildContext context, {
    required String nama,
    required String lokasi,
    required String harga,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ProductDetailView(
          nama: nama,
          lokasi: lokasi,
          harga: harga,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarmax Kampus'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
            tooltip: 'Notifikasi',
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle_outlined),
            tooltip: 'Profil',
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                Text(
                  'Halo, Budi 👋',
                  style: theme.textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Mahasiswa FT • Semester 5',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.md),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari buku, jas lab, modul, nasi ayam...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: Icon(
                      Icons.tune,
                      color: colors.primary,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: colors.primaryContainer,
                    borderRadius: BorderRadius.circular(AppSpacing.md),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '⚡ KAMPUS EXPRESS',
                        style: theme.textTheme.labelLarge,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        'Belanja Kebutuhan Kuliah Tanpa Antre!',
                        style: theme.textTheme.titleLarge,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      const Text(
                        'Pesan online, ambil di kantin kampus, '
                        'atau kirim langsung ke gedung kuliahmu.',
                      ),
                      const SizedBox(height: AppSpacing.md),
                      FilledButton(
                        onPressed: () => _openProduct(
                          context,
                          nama: 'Buku Pemrograman Web Dasar',
                          lokasi: 'Toko Buku Kampus',
                          harga: 'Rp68.000',
                        ),
                        child: const Text('Mulai Belanja Sekarang'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'Layanan Cepat Kampus',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: AppSpacing.md),
                Row(
                  children: [
                    _serviceItem(
                      context,
                      Icons.storefront_outlined,
                      'Ambil di Kantin',
                    ),
                    _serviceItem(
                      context,
                      Icons.print_outlined,
                      'Print & Modul',
                    ),
                    _serviceItem(
                      context,
                      Icons.science_outlined,
                      'Jas Lab',
                    ),
                    _serviceItem(
                      context,
                      Icons.delivery_dining_outlined,
                      'Antar Gedung',
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'Produk Populer Kampus',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: AppSpacing.md),
                HunianCard(
                  nama: 'Buku Pemrograman Web Dasar',
                  lokasi: 'Toko Buku Kampus',
                  harga: 'Rp68.000',
                  onTap: () => _openProduct(
                    context,
                    nama: 'Buku Pemrograman Web Dasar',
                    lokasi: 'Toko Buku Kampus',
                    harga: 'Rp68.000',
                  ),
                ),
                HunianCard(
                  nama: 'Jas Laboratorium FT',
                  lokasi: 'Mitra Atribut Kampus',
                  harga: 'Rp95.000',
                  onTap: () => _openProduct(
                    context,
                    nama: 'Jas Laboratorium FT',
                    lokasi: 'Mitra Atribut Kampus',
                    harga: 'Rp95.000',
                  ),
                ),
                HunianCard(
                  nama: 'Kalkulator Scientific FX-991',
                  lokasi: 'Toko Alat Tulis Kampus',
                  harga: 'Rp185.000',
                  onTap: () => _openProduct(
                    context,
                    nama: 'Kalkulator Scientific FX-991',
                    lokasi: 'Toko Alat Tulis Kampus',
                    harga: 'Rp185.000',
                  ),
                ),
                HunianCard(
                  nama: 'Paket Nasi Ayam Geprek',
                  lokasi: 'Kantin FT Barokah',
                  harga: 'Rp20.000',
                  onTap: () => _openProduct(
                    context,
                    nama: 'Paket Nasi Ayam Geprek',
                    lokasi: 'Kantin FT Barokah',
                    harga: 'Rp20.000',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        
onDestinationSelected: (index) {
  if (index == 0) return;

  final menu = ['Beranda', 'Pesanan', 'Favorit', 'Profil'];

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Halaman ${menu[index]} belum tersedia pada demo Pertemuan 7.',
      ),
    ),
  );
},

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Pesanan',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            label: 'Favorit',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget _serviceItem(
    BuildContext context,
    IconData icon,
    String label,
  ) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xs,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: colors.secondaryContainer,
                borderRadius: BorderRadius.circular(AppSpacing.md),
              ),
              child: Icon(
                icon,
                color: colors.onSecondaryContainer,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              label,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}

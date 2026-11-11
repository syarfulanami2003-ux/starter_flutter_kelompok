
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../widgets/app_primary_button.dart';
import '../widgets/app_text_field.dart';
import 'booking_success_view.dart';

class BookingFormView extends StatefulWidget {
  final String nama;
  final String lokasi;
  final String harga;

  const BookingFormView({
    super.key,
    required this.nama,
    required this.lokasi,
    required this.harga,
  });

  @override
  State<BookingFormView> createState() => _BookingFormViewState();
}

class _BookingFormViewState extends State<BookingFormView> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _catatanController = TextEditingController();

  int _jumlah = 1;
  String _pengambilan = 'Ambil di Kantin';

  int get _hargaSatuan {
    final angka = widget.harga.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(angka) ?? 0;
  }

  int get _total => _hargaSatuan * _jumlah;

  String _rupiah(int nilai) {
    final angka = nilai.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    );
    return 'Rp$angka';
  }

  @override
  void dispose() {
    _namaController.dispose();
    _catatanController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => BookingSuccessView(
          nama: widget.nama,
          harga: widget.harga,
          jumlah: _jumlah,
          total: _rupiah(_total),
          pengambilan: _pengambilan,
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
        title: const Text('Formulir Pemesanan'),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(AppSpacing.md),
                children: [
                  Text(
                    'Rincian Produk',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.shopping_bag_outlined,
                        color: colors.primary,
                      ),
                      title: Text(widget.nama),
                      subtitle: Text(widget.lokasi),
                      trailing: Text(
                        widget.harga,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Data Pemesan',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  AppTextField(
                    label: 'Nama Pemesan',
                    hint: 'Masukkan nama lengkap',
                    controller: _namaController,
                    prefixIcon: Icons.person_outline,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Nama pemesan wajib diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Jumlah Pesanan',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: _jumlah > 1
                              ? () => setState(() => _jumlah--)
                              : null,
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.lg,
                          ),
                          child: Text(
                            '$_jumlah',
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                        IconButton(
                          onPressed: () => setState(() => _jumlah++),
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Metode Pengambilan',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  RadioGroup<String>(
                    groupValue: _pengambilan,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _pengambilan = value;
                        });
                      }
                    },
                    child: const Column(
                      children: [
                        RadioListTile<String>(
                          title: Text('Ambil di Kantin'),
                          subtitle: Text('Ambil di lokasi mitra kampus'),
                          value: 'Ambil di Kantin',
                        ),
                        RadioListTile<String>(
                          title: Text('Antar ke Gedung'),
                          subtitle: Text('Simulasi layanan antar kampus'),
                          value: 'Antar ke Gedung',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    label: 'Catatan untuk Penjual (Opsional)',
                    hint: 'Tulis catatan pesanan',
                    controller: _catatanController,
                    maxLines: 3,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Harga Satuan'),
                              Text(widget.harga),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Jumlah'),
                              Text('$_jumlah'),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Pembayaran',
                                style: theme.textTheme.titleMedium,
                              ),
                              Text(
                                _rupiah(_total),
                                style: theme.textTheme.titleLarge?.copyWith(
                                  color: colors.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  AppPrimaryButton(
                    label: 'Konfirmasi Pemesanan',
                    icon: Icons.check_circle_outline,
                    onPressed: _submit,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

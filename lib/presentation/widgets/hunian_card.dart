
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class HunianCard extends StatelessWidget {
  final String nama;
  final String lokasi;
  final String harga;
  final VoidCallback? onTap;

  const HunianCard({
    super.key,
    required this.nama,
    required this.lokasi,
    required this.harga,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.home_rounded,
                size: AppSpacing.xl,
                color: colors.primary,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                nama,
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: colors.onSurfaceVariant,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: Text(
                      lokasi,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                harga,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

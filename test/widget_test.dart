
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:starter_flutter_kelompok/app/app.dart';

void main() {
  testWidgets('Halaman utama Flutter berhasil ditampilkan',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(
      find.text('Starter Project Flutter MVVM Berhasil!'),
      findsOneWidget,
    );

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}

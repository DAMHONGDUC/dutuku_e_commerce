import 'package:dutuku_e_commerce/src/core/resources/custom_theme_ext/app_color_theme_ext.dart';
import 'package:dutuku_e_commerce/src/core/widgets/empty/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('EmptyView renders the given message', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        // EmptyView only reads context.colorTheme (AppColorThemeExt), so
        // AppTextThemeExt.light() is intentionally omitted here: it calls
        // GoogleFonts internally, which needs font assets unavailable to
        // the test asset bundle.
        theme: ThemeData(extensions: [AppColorThemeExt.light()]),
        home: const Scaffold(body: EmptyView(message: 'No data available')),
      ),
    );

    expect(find.text('No data available'), findsOneWidget);
  });
}

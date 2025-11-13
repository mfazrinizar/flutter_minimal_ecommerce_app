# [minimal_ecommerce_app](https://github.com/mfazrinizar/flutter_minimal_ecommerce_app)

A minimal Flutter e-commerce demo with light/dark themes, persistent theme setting, and simple cart functionality.

## Quick start

Prerequisites: Flutter SDK.

Install dependencies and run:

```sh
flutter pub get
flutter run
```

Run unit & widget tests:

```sh
flutter test
flutter analyze
```

CI runs tests on pushes to `main` and PRs via [.github/workflows/flutter-test.yml](.github/workflows/flutter-test.yml).

## Project overview

- App entry: [lib/main.dart](lib/main.dart) — sets up providers and routes.
- Theme:
  - [`ThemeProvider`](lib/themes/theme_provider.dart) — persists choice using shared_preferences.
  - [`ThemeSwitch`](lib/component/theme_switch.dart) — animated toggle widget.
  - Light / dark theme files: [lib/themes/light_mode.dart](lib/themes/light_mode.dart), [lib/themes/dark_mode.dart](lib/themes/dark_mode.dart).
- Pages:
  - [`IntroPage`](lib/pages/intro_page.dart)
  - [`ShopPage`](lib/pages/shop_page.dart)
  - [`CartPage`](lib/pages/cart_page.dart)
- Models:
  - [`Shop`](lib/models/shop.dart) — shop data + cart management.
  - [`Product`](lib/models/product.dart)
- UI components:
  - [`MyProductTile`](lib/component/my_product_tile.dart)
  - [`MyDrawer`](lib/component/my_drawer.dart)
  - [`MyListTile`](lib/component/my_list_tile.dart)
  - [`MyButton`](lib/component/my_button.dart)

## Tests

All tests live under `test/`. Notable tests:
- Theme provider tests: [test/themes/theme_provider_test.dart](test/themes/theme_provider_test.dart)
- Widget tests: [test/widgets/theme_switch_test.dart](test/widgets/theme_switch_test.dart), [test/widgets/my_product_tile_test.dart](test/widgets/my_product_tile_test.dart), [test/widgets/my_list_tile_test.dart](test/widgets/my_list_tile_test.dart)
- Page tests: [test/pages/intro_page_test.dart](test/pages/intro_page_test.dart), [test/pages/shop_page_test.dart](test/pages/shop_page_test.dart), [test/pages/cart_page_test.dart](test/pages/cart_page_test.dart)
- Model tests: [test/models/shop_test.dart](test/models/shop_test.dart)

Run them with `flutter test`.

## Platform runners

Desktop platform runners are available under:
- Windows native runner: [windows/runner/win32_window.h](windows/runner/win32_window.h), [windows/runner/win32_window.cpp](windows/runner/win32_window.cpp), [windows/runner/flutter_window.h](windows/runner/flutter_window.h), [windows/runner/flutter_window.cpp](windows/runner/flutter_window.cpp)
- macOS / Linux scaffolding present under [macos/](macos) and [linux/](linux).

## Notes

- Theme persistence uses `shared_preferences` in [`ThemeProvider`](lib/themes/theme_provider.dart).
- Tests use `SharedPreferences.setMockInitialValues` where needed.
- Exit confirmation dialogs are implemented on main pages (Intro / Shop / Cart).
- Make sure `org.gradle.java.home` value in [`android\gradle.properties`](android\gradle.properties) is set to your Java JDK path or remove it.

Contributions: open a PR; CI will run tests automatically via [.github/workflows/flutter-test.yml](.github/workflows/flutter-test.yml).
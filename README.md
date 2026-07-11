# dutuku_e_commerce

## Figma inspired

- inspired by:
  https://www.figma.com/design/MWXnUlavawxNQSMaYIsRRh/Kutuku----eCommerce-Mobile-App-UI-Kit-Figma-High-Quality-Template--Community-?node-id=0-1&p=f

## Tech Stack

- Flutter
- Firebase
- Fastlane
- Feature-based Clean Architecture
- Bloc for state management

## Getting Started

### 1. Clone with submodules

This project depends on the shared design system package [`system_design_flutter`](https://github.com/DAMHONGDUC/system_design_flutter), included as a **git submodule** at `packages/system_design_flutter` and referenced from `pubspec.yaml` as a path dependency. `flutter pub get` will fail if the submodule is not checked out.

Clone the repo together with its submodules:

```
git clone --recurse-submodules https://github.com/DAMHONGDUC/dutuku_e_commerce_3.git
```

If you already cloned without `--recurse-submodules`, initialize the submodule afterwards:

```
git submodule update --init --recursive
```

To update the submodule to the latest commit on its `main` branch later:

```
git submodule update --remote packages/system_design_flutter
```

Then commit the new submodule pointer (`git add packages/system_design_flutter && git commit`).

### 2. Set up Flutter with FVM

The Flutter version is pinned in `.fvmrc`. With [FVM](https://fvm.app) installed:

```
fvm install
fvm use
```

Alternatively, use a global Flutter matching the [Version](#version) section.

### 3. Install dependencies and generate code

```
fvm flutter pub get
fvm flutter gen-l10n
fvm dart run build_runner build --delete-conflicting-outputs
```

### 4. Run the app

```
fvm flutter run
```

## Architecture

The project follows a **feature-based Clean Architecture**: instead of one global `domain`/`data`/`presentation` split, each business feature owns its own domain/data/presentation slice under `lib/src/features/<feature>/`. `core` holds truly cross-cutting building blocks, and `di` only bootstraps the features.

```
lib/src
├── features
│   ├── banner/
│   │   ├── domain/          # entities, repository interface, usecases
│   │   ├── data/            # mock, repository impl
│   │   ├── presentation/    # banner_carousel_section (Cubit + widgets)
│   │   └── banner_di.dart   # registers this feature's whole DI chain
│   ├── category/            # same shape, own CategoryRepository/data source (no longer piggybacks on product)
│   ├── product/             # product detail, search, recommended products — the biggest feature
│   ├── order/                # my orders + order detail
│   ├── notification/
│   ├── profile/
│   ├── home/                 # presentation-only: composes banner/category/product widgets, no domain/data of its own
│   └── splash/, tutorial/, login/, register/, bottom_tab/, preview_media/  # presentation-only, no business logic yet
├── core                     # constants, enums, l10n, resources, exceptions, shared widgets/utils used by 2+ features
└── di/injector.dart          # entry point: calls each feature's own *Di.config()
```

Inside a feature, the shape mirrors classic Clean Architecture:

```
features/<feature>/
├── domain/
│   ├── entities/       # business models
│   ├── repositories/   # abstract contract (e.g. ProductRepository)
│   ├── usecases/       # 1 usecase = 1 business action
│   └── domain.dart     # barrel — the only thing other features should import
├── data/
│   ├── mock/           # fake data (core/mock/* used to live centrally; now each feature owns its own)
│   ├── models/         # DTOs
│   ├── mapper/         # Model -> Entity
│   ├── data_sources/   # abstract + impl reading from mock (or, later, an HTTP client)
│   └── repositories/   # implements the domain's repository interface
└── presentation/       # screens, Cubit controllers/states, feature-local widgets
```

### Dependency rule

`domain` never imports `data` or `presentation`, inside a feature or across features. Dependencies always point inward, and features only ever expose their `domain/domain.dart` barrel to the outside:

```
presentation → domain ← data          (inside one feature)
featureA.domain → featureB.domain     (only when truly a shared business concept)
```

- A feature's `presentation` and `data` only depend on that same feature's `domain`, accessed through `getIt`.
- Cross-feature dependencies are only allowed at the `domain` level, and only for real shared concepts — e.g. `OrderEntity` (order feature) embeds `ProductColor`/`ProductSize` (product feature) because an order is a snapshot of a chosen product variant. No feature imports another feature's `data` or `presentation`.
- `home` is presentation-only: it composes `BannerCarouselSection`, `CategoriesSection` and `RecommendProductsSection` from their owning features, but registers no DI of its own — each of those controllers is registered by its own feature.
- `category` used to reuse `ProductRepository.getCategories()`; it now has its own `CategoryRepository` + `CategoryRemoteDataSource`, fully decoupled from `product`.

### Data flow for a single request

Example: `RecommendProductsController` (in the `product` feature) loading recommended products:

```
UI (RecommendProductsSection)
  → Controller (Cubit) calls GetRecommendProductUsecase
    → Usecase calls ProductRepository (interface, product/domain)
      → ProductRepositoryImpl (product/data) calls ProductRemoteDataSource
        → DataSourceImpl reads mock data (product/data/mock/product_mock.dart)
      ← returns a Model, the Repository uses a Mapper to convert Model → Entity
    ← Either<Failure, Entity> flows back up to the Usecase → Controller
  ← Controller emits a new State, UI rebuilds via Bloc/Cubit state
```

### Mock data in the data layer

Every feature's `data/mock/*` (e.g. `ProductMock`, `OrderMock`, `CategoryMock`) stands in for a real API. Because `domain` only depends on interfaces (`ProductRepository`, `OrderRepository`, ...), swapping mock data for a real API later only requires changes inside that feature's `data` layer (re-implementing its `DataSource`/`RepositoryImpl` to call an HTTP client), without touching `domain` or `presentation` — in that feature or any other.

### Dependency Injection

`lib/src/di/injector.dart` just calls each feature's own DI class:

```dart
BannerDi.config();
CategoryDi.config();
ProductDi.config();
OrderDi.config();
NotificationDi.config();
ProfileDi.config();
SplashDi.config();
TutorialDi.config();
```

Each `<Feature>Di.config()` registers its own chain in dependency order internally (data source → repository → usecases → controllers). There's no cross-feature ordering to worry about: `home` and `bottom_tab` only compose other features' presentation widgets and own no DI.

Everything relies on `get_it` as a service locator; `presentation` retrieves instances via `getIt<XController>()` instead of constructing controllers/usecases directly.

## Testing

The Clean Architecture split makes each layer trivial to test in isolation with mocks — no widget pumping or real network/mock delays required for domain/data logic. Test structure mirrors `lib/src/features/`:

```
test/
├── features/<feature>/domain/usecases/*_test.dart     # every usecase: verifies it delegates to the repository and passes through Either<Failure, T> unchanged
├── features/<feature>/data/repositories/*_test.dart   # repository impls: mock data source in/out mapping, pagination logic, mock-cache lookups
├── features/<feature>/presentation/**/*_controller_test.dart  # bloc_test coverage per Cubit: loading/loaded/error states, load-more accumulation
├── helpers/                                            # shared Mock*Repository / Mock*Usecase classes (mocktail), reused across features
└── widget_test.dart                                    # a plain widget test
```

- Mocking: [`mocktail`](https://pub.dev/packages/mocktail) for `Repository`/`UseCase` fakes — no code generation needed.
- Bloc/Cubit: [`bloc_test`](https://pub.dev/packages/bloc_test) to assert the exact state sequence emitted by each controller (including failure paths, which now all emit an explicit error state instead of failing silently).
- Run everything with:

```
flutter test
```

## CI/CD

Two GitHub Actions workflows live under `.github/workflows/`:

- **`ci.yml`** — runs on every push/PR to `main`: `flutter analyze` + `flutter test`. Needs no secrets.
- **`deploy.yml`** — manual (`workflow_dispatch`) release pipeline. Restores the gitignored signing/config files from repo secrets, then runs Fastlane to build and push the build to **Firebase App Distribution**.
  - `deploy-android` (Fastfile: `android/fastlane/Fastfile`, lane `firebase_distribute`) — builds a release APK via `flutter build apk` and uploads it. Fully wired since the release keystore already exists in this repo (gitignored).
  - `deploy-ios` (Fastfile: `ios/fastlane/Fastfile`, lane `firebase_distribute`) — builds a release IPA via `flutter build ipa` and uploads it. Gated behind the `IOS_DEPLOY_ENABLED` repo variable (`false` by default) until Apple signing secrets are configured, so it doesn't fail forks/clones that only care about Android.

### Required secrets

| Secret | Used by | Description |
| --- | --- | --- |
| `ANDROID_KEYSTORE_BASE64` | Android | `base64 android/app/dutuku-upload-keystore.jks` |
| `ANDROID_KEYSTORE_PASSWORD` | Android | `storePassword` from `android/key.properties` |
| `ANDROID_KEY_PASSWORD` | Android | `keyPassword` from `android/key.properties` |
| `ANDROID_KEY_ALIAS` | Android | `keyAlias` from `android/key.properties` |
| `ANDROID_GOOGLE_SERVICES_JSON_BASE64` | Android | `base64 android/app/google-services.json` |
| `IOS_GOOGLE_SERVICE_INFO_PLIST_BASE64` | iOS | `base64 ios/Runner/GoogleService-Info.plist` |
| `FIREBASE_SERVICE_ACCOUNT_JSON_BASE64` | both | base64 of a Firebase service account JSON with the "Firebase App Distribution Admin" role — used by the `firebase_app_distribution` fastlane plugin to authenticate |
| `ENV_DART_DEFINE_JSON_BASE64` | both, optional | `base64 env/dev.json` — passed to `flutter build` as `--dart-define-from-file` so `AppEnv`/Firebase options aren't empty at runtime |
| `APPLE_TEAM_ID` | iOS | Apple Developer Team ID |
| `APPLE_PROVISIONING_PROFILE_NAME` | iOS | Name of the ad-hoc provisioning profile to sign with |
| `APPLE_PROVISIONING_PROFILE_BASE64` | iOS | `base64` of the `.mobileprovision` file |
| `APPLE_CERTIFICATE_BASE64` | iOS | `base64` of the distribution certificate `.p12` |
| `APPLE_CERTIFICATE_PASSWORD` | iOS | Password for the `.p12` above |

Repo **variables** (Settings → Secrets and variables → Actions → Variables):

| Variable | Default | Description |
| --- | --- | --- |
| `FIREBASE_DISTRIBUTION_GROUPS` | `testers` | Firebase App Distribution tester group name |
| `IOS_DEPLOY_ENABLED` | unset (falsy) | set to `true` once the Apple secrets above are configured |

To encode a binary secret for GitHub: `base64 -i path/to/file | pbcopy` (macOS) then paste into the secret value.

## Version

- Flutter: 3.32.1
- Dart: 3.8.1
- Android Studio: 2024.3
- Java: java 17.0.12 2024-07-16 LTS
- Xcode: 16.3
- CocoaPods: 1.16.2

## DB Design

- https://drive.google.com/file/d/1vY04Wm6R2z69D4JhJ8cdIqszU7TTXFpA/view?usp=sharing

## Screenshots

<!-- Screenshots Table -->
<table>
  <tr>
    <td><img src="./screenshots/0.png" width="400"></td>
    <td><img src="./screenshots/1.png" width="400"></td>
  </tr>
  <tr>
    <td><img src="./screenshots/2.png" width="400"></td>
    <td><img src="./screenshots/3.png" width="400"></td>
  </tr>
  <tr>
    <td><img src="./screenshots/4.png" width="400"></td>
    <td><img src="./screenshots/5.png" width="400"></td>
  </tr>
  <tr>
    <td><img src="./screenshots/6.png" width="400"></td>
    <td><img src="./screenshots/7.png" width="400"></td>
  </tr>
  <tr>
    <td><img src="./screenshots/8.png" width="400"></td>
    <td></td>
  </tr>
</table>

## Command

```
flutter pub run build_runner build --delete-conflicting-outputs
```

```
flutter gen-l10n
```

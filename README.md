# dutuku_e_commerce

## DI

```
flutter pub run build_runner build --delete-conflicting-outputs
```

## Multi language

```
flutter gen-l10n
```

## Gen android apk

```
flutter build apk \
  --release \
  --obfuscate \
  --split-debug-info=build/app/outputs/symbols \
  --build-name=1.0.1 \
  --build-number=1
```

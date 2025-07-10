# flutter_ride_hail_challenge

Ride-hailing app UI challenge. Built this to practice Flutter and state management.

## Quick Start

1. Get dependencies:
   ```sh
   flutter pub get
   ```

2. Run on Chrome:
   ```sh
   flutter run -d chrome
   ```

3. For Android (if you have an emulator):
   ```sh
   flutter run -d <device_id>
   ```

4. Desktop:
   ```sh
   flutter run -d windows
   ```

## What's Used

- provider: for state management (keeps things simple)
- cupertino_icons: just for icons
- flutter/material.dart: the usual stuff

## How It Works

Pretty straightforward - Provider handles all the state, UI just shows stuff and calls methods. When you tap something, it updates the provider, UI rebuilds automatically.

## Files

- `lib/providers/ride_hail_provider.dart` — all the logic lives here
- `lib/screens/` — main screens
- `lib/components/` — reusable bits

## Tests

```sh
flutter test
```

Basic tests for the provider. Could add more later.

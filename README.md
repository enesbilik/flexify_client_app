<div align="center">

# 📱 Flexify — Client App

**Flutter mobile application for end-users on the Flexify appointment platform**

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![GetX](https://img.shields.io/badge/GetX-9C27B0?style=for-the-badge&logo=dart&logoColor=white)]()

</div>

---

## 📖 Overview

The **Flexify Client App** is the end-user side of the Flexify ecosystem. Clients can discover service providers, book appointments, manage their schedules, and track their history — all from a clean, intuitive mobile experience.

## ✨ Features

- 🔍 Browse & discover consultants / service providers
- 📅 Book, reschedule, or cancel appointments
- 🕐 View upcoming & past appointment history
- 🔔 Push notifications for booking updates
- 🔐 Secure login & token-based session management
- 🌐 Integrated with Flexify REST API

## 🛠️ Tech Stack

| Area | Technology |
|------|-----------|
| Framework | Flutter 3.x |
| Language | Dart |
| State Management | GetX |
| HTTP Client | Dio |
| Local Storage | GetStorage |
| Animations | Lottie |
| UI Carousel | carousel_slider |

## 🏗️ Project Structure

```
lib/
├── app/
│   ├── data/          # Models, providers, repositories
│   ├── modules/       # Feature screens (home, explore, bookings...)
│   ├── routes/        # Navigation routes
│   └── widgets/       # Reusable components
└── main.dart
```

## 🚀 Getting Started

```bash
git clone https://github.com/enesbilik/flexify_client_app.git
cd flexify_client_app
flutter pub get
flutter run
```

> Requires Flexify API to be running. See [Flexify-api](https://github.com/enesbilik/Flexify-api)

## 🔗 Related

- [Flexify Consultant App](https://github.com/enesbilik/flexify_consultant_app) — Service-provider mobile app
- [Flexify API](https://github.com/enesbilik/Flexify-api) — Backend service

## 📄 License

MIT

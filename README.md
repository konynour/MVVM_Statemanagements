# 🎬 Movies App — Flutter MVVM with State Management

A modern Flutter movies application built with the **MVVM (Model-View-ViewModel)** architecture pattern, demonstrating clean code practices and multiple state management approaches. The app fetches popular movies from [TMDB API](https://www.themoviedb.org/documentation/api) and provides a rich browsing experience with features like favorites, dark/light theme toggling, and detailed movie views.

---

## ✨ Features

- **Browse Popular Movies** — Fetch and display trending movies from TMDB
- **Movie Details** — View detailed information including overview, rating, release date, and genres
- **Favorites** — Save your favorite movies for quick access
- **Dark / Light Theme** — Toggle between themes with user preference persistence via `SharedPreferences`
- **Splash Screen** — Smooth app loading experience with error handling
- **Cached Images** — Efficient image loading and caching with `cached_network_image`
- **Global Navigation** — Centralized navigation service accessible via dependency injection

---

## 🏗️ Architecture — MVVM

The project follows the **MVVM** (Model-View-ViewModel) pattern to ensure a clean separation of concerns:

```
lib/
├── constants/          # App-wide constants (API, colors, icons, themes)
├── enums/              # Enumerations (e.g., ThemeEnums)
├── models/             # Data models (MovieModel, MoviesGenre)
├── repository/         # Repository layer — bridges ViewModels and Services
├── screens/            # UI screens (Views)
├── service/            # Services (API, navigation, dependency injection)
├── utils/              # Utility/helper functions
├── view_models/        # ViewModels / State Notifiers (business logic)
├── widgets/            # Reusable UI components
│   └── movies/         # Movie-specific widgets
└── main.dart           # App entry point
```

| Layer          | Responsibility                                      | Example                        |
|----------------|------------------------------------------------------|--------------------------------|
| **Model**      | Data structures & JSON serialization                 | `MovieModel`, `MoviesGenre`    |
| **View**       | UI rendering, user interaction                       | `MoviesScreen`, `MovieDetailsScreen` |
| **ViewModel**  | State management, business logic                     | `ThemeProvider`                |
| **Repository** | Abstraction over data sources                        | `MoviesRepository`             |
| **Service**    | Low-level operations (HTTP, navigation, DI)          | `ApiService`, `NavigationService` |

---

## 📦 State Management

This project showcases multiple state management solutions working together:

| Package               | Usage                                         |
|----------------------|-----------------------------------------------|
| **Riverpod** (`flutter_riverpod`) | Theme state management via `StateNotifier` |
| **Provider** (`provider`)         | Available for additional state management needs |
| **GetIt** (`get_it`)              | Service locator / Dependency injection          |

---

## 🔧 Dependencies

| Package                  | Purpose                                |
|--------------------------|----------------------------------------|
| `http`                   | HTTP networking (REST API calls)       |
| `flutter_riverpod`       | Reactive state management              |
| `provider`               | State management                       |
| `get_it`                 | Dependency injection / service locator |
| `cached_network_image`   | Image caching and loading              |
| `shared_preferences`     | Persistent local storage (theme pref)  |
| `flutter_dotenv`         | Environment variable management        |

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) `^3.10.1`
- A [TMDB API Key](https://www.themoviedb.org/settings/api) (free to obtain)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/<your-username>/MVVM_Statemanagements.git
   cd MVVM_Statemanagements
   ```

2. **Create the environment file**

   Create a file at `assets/.env` with your TMDB credentials:
   ```env
   MOVIES_API_KEY=your_api_key_here
   MOVIES_BEARERTOKEN=your_bearer_token_here
   ```

3. **Install dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 🗂️ Key Files

| File                             | Description                                   |
|----------------------------------|-----------------------------------------------|
| `lib/main.dart`                  | App entry point, GetIt setup, MaterialApp config |
| `lib/service/api_service.dart`   | TMDB API integration (movies & genres)        |
| `lib/service/init_getit.dart`    | Dependency injection setup                    |
| `lib/service/navigation_service.dart` | Centralized navigation, dialogs & snackbars |
| `lib/repository/movies_repo.dart`| Repository pattern over API service           |
| `lib/view_models/theme_provider.dart` | Theme toggle logic with persistence      |
| `lib/models/movies_model.dart`   | Movie data model with JSON serialization      |
| `lib/screens/movies_screen.dart` | Home screen — popular movies list             |
| `lib/screens/movie_details.dart` | Movie detail view with backdrop image         |
| `lib/screens/favorites_screen.dart` | Saved favorites list                       |

---

## 🌐 API

This app uses the [TMDB API v3](https://developer.themoviedb.org/docs):

| Endpoint                                  | Description              |
|-------------------------------------------|--------------------------|
| `GET /movie/popular`                      | Fetch popular movies     |
| `GET /genre/movie/list`                   | Fetch movie genres       |

> **Note:** You must provide your own API key and bearer token in the `assets/.env` file. Never commit this file to version control.

---

## 🎨 Theming

The app supports both **light** and **dark** themes, managed via Riverpod's `StateNotifier`:

- Theme preference is persisted using `SharedPreferences`
- Toggle is available in the app bar of the home screen
- Custom `ThemeData` is defined in `lib/constants/my_theme_data.dart`

---

## 📄 License

This project is for educational purposes. Feel free to use it as a reference for learning Flutter MVVM architecture and state management patterns.

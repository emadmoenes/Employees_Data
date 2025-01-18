# Employee Management App

A Flutter application that fetches employee data from an API, caches it locally, and displays it in a user-friendly interface with advanced UI and animations.

---

## Features

- **Fetch Employee Data**: Fetches employee data from the [DummyJSON API](https://dummyjson.com/users).
- **Caching**: Caches employee data locally using `shared_preferences` for offline access.
- **Advanced UI**:
  - Custom gradient AppBar.
  - Employee list items with profile images, names, and usernames.
  - Collapsing header with Hero animations on the detail screen.
- **Error Handling**: handles API errors and displays cached data if available.

# API Integration & Project Architecture Guide

## Overview
This project uses a layered architecture (Clean Architecture simplified) to ensure scalability, maintainability, and ease of testing.
The structure separates the UI (Presentation), Business Logic (Providers), and Data (Services/Repositories).

## Project Structure

```
lib/
├── common/             # Reusable UI components (buttons, headers, etc.)
├── data/               # Data layer
│   ├── models/         # Data models (JSON serialization)
│   ├── network/        # API Client, Endpoints, Exceptions
│   └── services/       # Business logic for API calls
├── providers/          # State management (ChangeNotifiers)
├── ui/                 # UI Screens
│   └── templates/      # Base templates for screens
└── utils/              # Helper classes, Theme, Constants
```

## How to Add a New API Call

1.  **Define Endpoint**: Add the endpoint URL to `lib/data/network/api_endpoints.dart`.
    ```dart
    static const String myNewEndpoint = '/api/v1/resource';
    ```

2.  **Create Model**: Create a model class in `lib/data/models/` to parse the JSON response.
    ```dart
    class MyModel {
      final String id;
      // ...
      factory MyModel.fromJson(Map<String, dynamic> json) { ... }
    }
    ```

3.  **Create/Update Service**: Add a method to a service in `lib/data/services/` (or create a new service).
    ```dart
    class MyService {
      final ApiClient _client = ApiClient();

      Future<MyModel> fetchData() async {
        final data = await _client.get(ApiEndpoints.myNewEndpoint);
        return MyModel.fromJson(data);
      }
    }
    ```

4.  **Create/Update Provider**: Create a Provider that calls this service and manages state (loading, error, success).
    ```dart
    class MyProvider extends BaseProvider {
       final MyService _service = MyService();
       MyModel? data;

       Future<void> loadData() async {
         setState(ViewState.busy);
         try {
           data = await _service.fetchData();
           setState(ViewState.idle);
         } catch (e) {
           setError(e.toString());
         }
       }
    }
    ```

5.  **Bind in UI**: Use `Consumer<MyProvider>` in your widget to display data or loading indicators.

## Using the Base Page Template

For any new screen, use `BasePageTemplate` to ensure consistency.

```dart
class MyNewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, child) {
        return BasePageTemplate(
          title: 'My Screen',
          isLoading: provider.state == ViewState.busy,
          errorMessage: provider.errorMessage,
          onErrorDismissed: provider.clearError,
          body: Center(child: Text('Content goes here')),
        );
      },
    );
  }
}
```

## Industry Standards Checklist
- [x] **State Management**: Uses `Provider` pattern.
- [x] **Networking**: Uses `Dio` with interceptors for auth and error handling.
- [x] **Error Handling**: Centralized `ApiException` handling.
- [x] **Architecture**: Separation of concerns (UI -> Provider -> Service -> Network).
- [x] **Reusability**: `BasePageTemplate` and common components.

## Future Development
- Update `ApiEndpoints.baseUrl` with the real backend URL.
- Implement `SecureStorage` instead of `SharedPreferences` for sensitive tokens if needed (add `flutter_secure_storage`).
- Add Unit Tests for Providers and Services.

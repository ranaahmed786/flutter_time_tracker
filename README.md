# ChronoTracker

A comprehensive Flutter-based time tracking application designed for professionals, freelancers, and teams to monitor project time allocation with precision. Featuring an intuitive interface, detailed analytics, and robust project management capabilities.

## Overview

ChronoTracker is a modern time tracking solution that enables users to efficiently log work hours across multiple projects, analyze productivity patterns, and generate detailed time reports. Built with Flutter's cross-platform framework, the application delivers consistent performance across mobile, desktop, and web platforms while maintaining enterprise-grade functionality.

## Features

- **Project Management**: Create, organize, and manage multiple projects with detailed tracking capabilities
- **Time Logging**: Precise time entry with hour and minute granularity using intuitive Cupertino-style time pickers
- **Task Management**: Comprehensive task creation with project association, descriptions, and date tracking
- **Visual Analytics**: Interactive charts and statistics powered by FL Chart for productivity insights
- **Cross-Platform Compatibility**: Native performance on Android, iOS, Web, Windows, Linux, and macOS
- **Theme Support**: Professional light and dark theme options with Material 3 design system
- **State Management**: Robust state management using Riverpod for scalable application architecture
- **Data Persistence**: Reliable data storage with automatic task and project persistence
- **Dismissible Actions**: Swipe-to-delete functionality with undo capabilities for enhanced user experience
- **Responsive Design**: Optimized layouts for various screen sizes and orientations

## User Interface

The ChronoTracker application features a professional interface designed with Material 3 principles, providing an elegant and efficient user experience for time tracking professionals.

### Design Philosophy
- **Professional Aesthetics**: Clean, minimal design focused on productivity and clarity
- **Consistent Navigation**: Intuitive bottom navigation with distinct sections for projects and tasks
- **Interactive Elements**: Thoughtfully designed components with smooth transitions and visual feedback
- **Accessibility**: High contrast ratios and readable typography ensuring universal accessibility

### Screen Overview

<div align="center">

<table>
  <tr>
    <td><strong>Projects Overview</strong></td>
    <td><strong>Task Logging</strong></td>
    <td><strong>New Task Entry</strong></td>
  </tr>
  <tr>
    <td>
      <img src="screenshots/projects-screen.png" alt="Projects Overview" width="200" height="400"/>
    </td>
    <td>
      <img src="screenshots/task-logs-screen.png" alt="Task Logging" width="200" height="400"/>
    </td>
    <td>
      <img src="screenshots/new-task-screen.png" alt="New Task Entry" width="200" height="400"/>
    </td>
  </tr>
  <tr>
    <td><strong>Analytics Dashboard</strong></td>
    <td><strong>Settings</strong></td>
    <td><strong>Dark Theme</strong></td>
  </tr>
  <tr>
    <td>
      <img src="screenshots/analytics-screen.png" alt="Analytics Dashboard" width="200" height="400"/>
    </td>
    <td>
      <img src="screenshots/settings-screen.png" alt="Settings" width="200" height="400"/>
    </td>
    <td>
      <img src="screenshots/dark-theme-screen.png" alt="Dark Theme" width="200" height="400"/>
    </td>
  </tr>
</table>

</div>

### Color Scheme
```
Light Theme:
Primary: #6750A4 (Purple)
Background: #FFFFFF (White)
Surface: #F7F2FA (Light Purple Tint)
Text: #1C1B1F (Dark Gray)

Dark Theme:
Primary: #D0BCFF (Light Purple)
Background: #141218 (Dark)
Surface: #1D1B20 (Dark Gray)
Text: #E6E0E9 (Light Gray)
```

### Typography
- **Primary Font**: Inter (Google Fonts)
- **Heading Sizes**: 24px for main titles, 20px for section headers
- **Body Text**: 16px for content, 14px for secondary information
- **Button Text**: 16px with medium weight for interactive elements
- **Weight Variations**: Regular (400) to Bold (700) for proper hierarchy

### Interactive Elements
- **Material 3 Cards**: Elevated cards with 12px border radius and subtle shadows
- **Cupertino Time Pickers**: iOS-style time selection with smooth scrolling
- **Dismissible Lists**: Swipe-to-delete with visual feedback and undo functionality
- **Floating Action Buttons**: Consistent placement for primary actions
- **Bottom Navigation**: Clear section separation with active state indicators

### Responsive Design
- **Adaptive Layouts**: Seamless experience across phone, tablet, and desktop
- **Touch Targets**: Appropriately sized interactive elements for mobile use
- **Scrollable Content**: Smooth scrolling with proper list performance
- **Cross-Platform Consistency**: Identical functionality across all supported platforms

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.8.1 or higher)
- [Dart SDK](https://dart.dev/get-dart) (version 2.17.0 or higher)
- Android Studio, VS Code, or any compatible IDE with Flutter extensions

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/ranaahmed786/flutter_time_tracker.git
   cd flutter_time_tracker
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

4. **Build for production**
   ```bash
   # For Android
   flutter build apk --release
   
   # For iOS
   flutter build ios --release
   
   # For Web
   flutter build web --release
   
   # For Windows
   flutter build windows --release
   ```

## Project Architecture

```
flutter_time_tracker/
├── lib/
│   ├── main.dart                           # Application entry point with theme configuration
│   ├── models/
│   │   ├── project.dart                    # Project data model
│   │   └── task.dart                       # Task data model with UUID generation
│   ├── providers/
│   │   ├── project_list_provider.dart      # Project state management
│   │   ├── tasks_list_provider.dart        # Task state management
│   │   ├── theme_mode_provider.dart        # Theme switching logic
│   │   └── taskEntryFormProviders/
│   │       └── time_spent_provider.dart    # Time selection state management
│   ├── screens/
│   │   ├── home_screen.dart                # Main navigation and screen coordination
│   │   ├── project_overview_screen.dart    # Project management interface
│   │   ├── task_log_screen.dart            # Task logging and history
│   │   ├── new_task_screen.dart            # Task creation form
│   │   └── settings_screen.dart            # Application settings and preferences
│   └── widgets/
│       ├── bottom_adding_button.dart       # Reusable action button component
│       ├── app_main_drawer.dart            # Navigation drawer component
│       ├── chart/
│       │   ├── chart.dart                  # Main chart component
│       │   └── stats.dart                  # Statistics calculations
│       ├── projectOverviewWidgets/
│       │   ├── project_lists.dart          # Project list display
│       │   ├── project_list_card.dart      # Individual project card
│       │   ├── project_adding_dialog.dart  # New project creation dialog
│       │   └── project_overview_stats.dart # Project statistics widget
│       ├── taskLogsWidgets/
│       │   ├── tasks_list.dart             # Task list with dismissible actions
│       │   ├── task_log_card.dart          # Individual task display card
│       │   └── task_logs_stats.dart        # Task analytics widget
│       └── taskFormWidgets/
│           ├── task_dropdown.dart          # Project selection dropdown
│           └── cupertino_timepickers.dart  # Time selection interface
├── test/
│   └── widget_test.dart                    # Widget testing suite
├── android/                                # Android-specific configuration
├── ios/                                    # iOS-specific configuration
├── web/                                    # Web-specific configuration
├── windows/                                # Windows-specific configuration
├── linux/                                  # Linux-specific configuration
├── macos/                                  # macOS-specific configuration
└── pubspec.yaml                            # Project dependencies and configuration
```

## Core Components

### Data Layer
- **`project.dart`**: Project model with time tracking and metadata
- **`task.dart`**: Task model with UUID generation, duration tracking, and project association

### State Management
- **Riverpod Providers**: Comprehensive state management for projects, tasks, and UI preferences
- **Theme Management**: Dynamic light/dark theme switching with persistent preferences
- **Form State**: Isolated state management for task creation and time selection

### Widget Architecture
- **Screen Components**: Modular screen architecture with clear separation of concerns
- **Reusable Widgets**: Consistent UI components for cards, buttons, and form elements
- **Chart Integration**: FL Chart integration for visual analytics and progress tracking

### Platform Integration
- **Cross-Platform Support**: Unified codebase with platform-specific optimizations
- **Material 3 Design**: Modern design system implementation with custom theming
- **Responsive Layouts**: Adaptive UI components for various screen configurations

## User Experience Flow

1. **Application Launch**: Users access the main dashboard with project overview and navigation
2. **Project Management**: Create and organize projects with comprehensive tracking setup
3. **Time Logging**: Log work sessions with precise time allocation and project association
4. **Task Creation**: Add detailed tasks with time investment, descriptions, and project links
5. **Analytics Review**: Monitor productivity patterns through interactive charts and statistics
6. **Data Management**: Edit, delete, or modify entries with intuitive swipe actions and confirmations

## Built With

- **[Flutter](https://flutter.dev/)** - Cross-platform UI framework for native performance
- **[Dart](https://dart.dev/)** - Client-optimized language for fast apps on any platform
- **[Riverpod](https://pub.dev/packages/flutter_riverpod)** - Reactive state management solution
- **[FL Chart](https://pub.dev/packages/fl_chart)** - Beautiful and powerful chart library
- **[Google Fonts](https://pub.dev/packages/google_fonts)** - Typography enhancement with Inter font family
- **[UUID](https://pub.dev/packages/uuid)** - Unique identifier generation for data integrity
- **[Intl](https://pub.dev/packages/intl)** - Internationalization and date formatting utilities
- **[Material 3](https://m3.material.io/)** - Google's latest design system for modern applications

## Feature Categories

The application encompasses comprehensive time tracking functionality:

- **Project Organization**: Hierarchical project structure with detailed metadata
- **Time Precision**: Hour and minute granularity for accurate time tracking
- **Visual Analytics**: Chart-based insights for productivity analysis
- **Data Persistence**: Reliable storage and retrieval of tracking information
- **User Experience**: Intuitive navigation and interaction patterns
- **Customization**: Theme preferences and personalization options

## Testing

The project includes comprehensive testing infrastructure:

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/widget_test.dart
```

### Test Coverage
- **Widget Tests**: UI component verification and interaction testing
- **Integration Tests**: End-to-end workflow validation
- **Unit Tests**: Business logic and data model testing

## Platform Support

| Platform | Status | Minimum Version |
|----------|--------|-----------------|
| Android | ✅ Supported | API 21 (Android 5.0) |
| iOS | ✅ Supported | iOS 11.0 |
| Web | ✅ Supported | Modern browsers with ES6 support |
| Windows | ✅ Supported | Windows 10 version 1903 |
| Linux | ✅ Supported | 64-bit distributions |
| macOS | ✅ Supported | macOS 10.14 |

## Configuration

### Environment Setup
1. Install Flutter SDK and configure development environment
2. Verify platform-specific requirements for target deployment
3. Configure IDE with Flutter and Dart plugins for optimal development experience

### Dependencies
- **flutter_riverpod**: Advanced state management with provider pattern
- **google_fonts**: Enhanced typography with Inter font integration
- **fl_chart**: Professional charting capabilities for analytics
- **uuid**: Unique identifier generation for data integrity
- **intl**: Date formatting and internationalization support

## Contributing

Contributions are welcome and encouraged. Please follow these guidelines:

1. **Fork the Project**
2. **Create a Feature Branch**
   ```bash
   git checkout -b feature/EnhancedAnalytics
   ```
3. **Implement Changes**
   - Follow Flutter best practices and architectural patterns
   - Maintain consistency with existing code style
   - Add appropriate tests for new functionality
4. **Commit Changes**
   ```bash
   git commit -m 'Add: Enhanced analytics dashboard with productivity metrics'
   ```
5. **Push to Branch**
   ```bash
   git push origin feature/EnhancedAnalytics
   ```
6. **Open a Pull Request**

### Contribution Guidelines
- Maintain code formatting using `flutter format`
- Follow established architectural patterns and state management practices
- Include comprehensive documentation for new features
- Ensure cross-platform compatibility for all changes

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for complete terms and conditions.

## Author

**Rana Ahmed**
- GitHub: [@ranaahmed786](https://github.com/ranaahmed786)
- Email: ranamuhammadahmed6@gmail.com
- Project Repository: [flutter_time_tracker](https://github.com/ranaahmed786/flutter_time_tracker)

## Acknowledgments

- Flutter team for the comprehensive cross-platform development framework
- Riverpod community for robust state management solutions
- FL Chart contributors for powerful data visualization capabilities
- Material Design team for modern UI/UX principles
- Open source community for inspiration and continuous improvement

## Future Enhancements

- **Export Functionality**: PDF and CSV report generation for client billing
- **Team Collaboration**: Multi-user support with shared project access
- **Time Tracking Automation**: Integration with development tools and calendars
- **Advanced Analytics**: Predictive insights and productivity recommendations
- **Cloud Synchronization**: Cross-device data synchronization and backup
- **Client Management**: Customer database integration with project association
- **Billing Integration**: Automated invoice generation based on tracked time
- **API Development**: REST API for third-party integrations and data access

---

**Star this repository if you found it useful for your time tracking needs.**

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

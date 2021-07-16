# Qonvex Responsive UI

A Flutter package made to ease and lessen time to develop for something that has the same main scheme with youtube and facebook and to achieve a responsive and vue like display.

# Installation
- it is already provided in [1]: https://pub.dev/packages/qonvex_responsive_ui/install/ "here"

## How to use

### Import
```dart
import 'package:qonvex_responsive_ui/qonvex_responsive_ui.dart';
```
- import the package to your page

### TYPES
Type | Command |
--- | --- |
Youtube | QonvexUIType.youtube |
Facebook | QonvexUIType.facebook |

**NOTE:** Default type is youtube

### Call
```dart
QonvexResponsiveUi(
      settings: QonvexUISettings(
        appHeaderActions: [
          <IF YOU HAVE HEADERS>
          <THIS IS OPTIONAL>
        ],
        appLogo: <YOUR IMAGE LOGO>,
        foregroundColor: <YOUR COLOR>,
      ),
      type: <Your Type>, ///if left null the default type is youtube
      items: [
        <REQUIRED QONVEXITEMs>
      ],
    );
```
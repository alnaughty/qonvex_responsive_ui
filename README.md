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
###TYPES
Attempt | #1 | #2 | #3 | #4 | #5 | #6 | #7 | #8 | #9 | #10 | #11
--- | --- | --- | --- |--- |--- |--- |--- |--- |--- |--- |---
Seconds | 301 | 283 | 290 | 286 | 289 | 285 | 287 | 287 | 272 | 276 | 269
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
      type: QonvexUIType.youtube,
      items: [
        <REQUIRED QONVEXITEMs>
      ],
    );
```
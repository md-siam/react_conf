<img src="screenshots/badges/built-with-love.svg" height="28px"/>&nbsp;&nbsp;
<img src="screenshots/badges/flutter-dart.svg" height="28px" />&nbsp;&nbsp;
<a href="https://choosealicense.com/licenses/mit/" target="_blank"><img src="screenshots/badges/license-MIT.svg" height="28px" /></a>&nbsp;&nbsp;
<img src="screenshots/badges/Flutter-3.svg" height="28px" />&nbsp;&nbsp;
<img src="screenshots/badges/dart-null_safety-blue.svg" height="28px"/>

# React Conf

<img align="right" src="screenshots/app_icon/playstore.png" height="190"></img>
This application is a Pre-assessment for the Mid-Level Flutter Developer position at [Lemon Hive](https://www.lemonhive.com/). It's an open-source project, hence use of the source code is governed by an MIT-style license that can be found in the LICENSE file or at [MIT LICENSE Info](https://choosealicense.com/licenses/mit/).

## Packages Used

This application is using one third-party package from the open-source community. Thanks to the developers of <a href = "https://pub.dev/packages/graphql_flutter">graphql_flutter: ^5.1.2 </a> for this amazing package. The purpose of using this package is to run GraphQL quartes in a flutter application.

```yaml
graphql_flutter: ^5.1.2   //For using graphQL API
```

<p align="center">
    <a href="-----" target="_blank"><img src="screenshots/download_apk/download.png" height="100" ></img></a>
  </p>

## App Demo

<p align="center"><img src="--------"></p>

## File Pattern Inside The `lib` Folder

```
lib/
├── core/
│   ├── config/
│   │   └── graphql_config.dart
│   ├── const/
│   │   ├── app_color.dart
│   │   └── text_style.dart
│   └── .DS_Store
├── features/
│   ├── conference/
│   │   ├── models/
│   │   │   ├── conference_model.dart
│   │   │   ├── organizer_model.dart
│   │   │   ├── schedule_model.dart
│   │   │   ├── speaker_model.dart
│   │   │   └── sponsor_model.dart
│   │   ├── pages/
│   │   │   ├── tabs/
│   │   │   │   ├── organizer_tab.dart
│   │   │   │   ├── schedule_tab.dart
│   │   │   │   ├── speaker_tab.dart
│   │   │   │   └── sponsor_tab.dart
│   │   │   ├── conference_detail_page.dart
│   │   │   └── conference_page.dart
│   │   ├── services/
│   │   │   ├── bronze_sponsor_gql_service.dart
│   │   │   ├── conf_page_gql_service.dart
│   │   │   ├── gold_sponsor_gql_service.dart
│   │   │   ├── organizer_gql_service.dart
│   │   │   ├── schedule_gql_service.dart
│   │   │   ├── silver_sponsor_gql_service.dart
│   │   │   └── speaker_gql_service.dart
│   │   └── widgets/
│   │       ├── custom_conf_card.dart
│   │       ├── custom_time_line.dart
│   │       ├── organizer_card.dart
│   │       ├── schedule_card.dart
│   │       ├── speaker_card.dart
│   │       └── sponsor_card.dart
│   └── sponsor/
│       ├── page/
│       │   └── sponsor_page.dart
│       └── widgets/
│           └── sponsor_card.dart
├── routing/
│   └── bottom_nav_bar.dart
└── main.dart
```

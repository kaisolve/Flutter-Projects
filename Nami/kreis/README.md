# Kreis
e-commerce flutter app

Project Design:
https://www.figma.com/proto/u0csWbiHObNaddvJbTIDuh/Circle?type=design&node-id=1-241&t=86wU1p4rlhKsbjpf-1&scaling=scale-down&page-id=0%3A1&starting-point-node-id=1%3A98&mode=design




```
kreis
├─ .gitignore
├─ .metadata
├─ analysis_options.yaml
├─ android
│  ├─ .gitignore
│  ├─ .gradle
│  │  ├─ 7.5
│  │  │  ├─ checksums
│  │  │  │  ├─ checksums.lock
│  │  │  │  ├─ md5-checksums.bin
│  │  │  │  └─ sha1-checksums.bin
│  │  │  ├─ dependencies-accessors
│  │  │  │  ├─ dependencies-accessors.lock
│  │  │  │  └─ gc.properties
│  │  │  ├─ executionHistory
│  │  │  │  ├─ executionHistory.bin
│  │  │  │  └─ executionHistory.lock
│  │  │  ├─ fileChanges
│  │  │  │  └─ last-build.bin
│  │  │  ├─ fileHashes
│  │  │  │  ├─ fileHashes.bin
│  │  │  │  ├─ fileHashes.lock
│  │  │  │  └─ resourceHashesCache.bin
│  │  │  ├─ gc.properties
│  │  │  └─ vcsMetadata
│  │  ├─ buildOutputCleanup
│  │  │  ├─ buildOutputCleanup.lock
│  │  │  ├─ cache.properties
│  │  │  └─ outputFiles.bin
│  │  ├─ file-system.probe
│  │  ├─ kotlin
│  │  │  ├─ errors
│  │  │  └─ sessions
│  │  └─ vcs-1
│  │     └─ gc.properties
│  ├─ app
│  │  ├─ build.gradle
│  │  ├─ google-services.json
│  │  └─ src
│  │     ├─ debug
│  │     │  └─ AndroidManifest.xml
│  │     ├─ main
│  │     │  ├─ AndroidManifest.xml
│  │     │  ├─ java
│  │     │  │  └─ io
│  │     │  │     └─ flutter
│  │     │  │        └─ plugins
│  │     │  │           └─ GeneratedPluginRegistrant.java
│  │     │  ├─ kotlin
│  │     │  │  └─ com
│  │     │  │     └─ example
│  │     │  │        └─ kreis
│  │     │  │           └─ MainActivity.kt
│  │     │  └─ res
│  │     │     ├─ drawable
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ drawable-v21
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ mipmap-hdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-mdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xxhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xxxhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ values
│  │     │     │  └─ styles.xml
│  │     │     └─ values-night
│  │     │        └─ styles.xml
│  │     └─ profile
│  │        └─ AndroidManifest.xml
│  ├─ build.gradle
│  ├─ gradle
│  │  └─ wrapper
│  │     ├─ gradle-wrapper.jar
│  │     └─ gradle-wrapper.properties
│  ├─ gradle.properties
│  ├─ gradlew
│  ├─ gradlew.bat
│  ├─ local.properties
│  └─ settings.gradle
├─ assets
│  ├─ fonts
│  │  ├─ MadaniArabic-Regular.ttf
│  │  └─ MadaniArabic-SemiBold.ttf
│  ├─ images
│  │  ├─ pngs
│  │  │  ├─ circle.png
│  │  │  ├─ contactus.png
│  │  │  ├─ order.png
│  │  │  ├─ otp.png
│  │  │  ├─ points.png
│  │  │  └─ profile.png
│  │  └─ svgs
│  │     ├─ about.svg
│  │     ├─ add.svg
│  │     ├─ address_pointer.svg
│  │     ├─ apple_pay.svg
│  │     ├─ arrow.svg
│  │     ├─ at.svg
│  │     ├─ basket.svg
│  │     ├─ branch.svg
│  │     ├─ calender.svg
│  │     ├─ can.svg
│  │     ├─ card_pay.svg
│  │     ├─ cart.svg
│  │     ├─ cash.svg
│  │     ├─ cash_pay.svg
│  │     ├─ categories.svg
│  │     ├─ categories2.svg
│  │     ├─ circle.svg
│  │     ├─ city.svg
│  │     ├─ clock.svg
│  │     ├─ close.svg
│  │     ├─ contact_us.svg
│  │     ├─ copy.svg
│  │     ├─ delete.svg
│  │     ├─ down.svg
│  │     ├─ edit_account.svg
│  │     ├─ heart.svg
│  │     ├─ home.svg
│  │     ├─ home2.svg
│  │     ├─ image.svg
│  │     ├─ language.svg
│  │     ├─ lcation.svg
│  │     ├─ like.svg
│  │     ├─ location.svg
│  │     ├─ logout.svg
│  │     ├─ mark.svg
│  │     ├─ message.svg
│  │     ├─ mincart.svg
│  │     ├─ minus.svg
│  │     ├─ notes.svg
│  │     ├─ notification.svg
│  │     ├─ notifications.svg
│  │     ├─ order.svg
│  │     ├─ person.svg
│  │     ├─ phone.svg
│  │     ├─ point.svg
│  │     ├─ points.svg
│  │     ├─ price.svg
│  │     ├─ qr.svg
│  │     ├─ rate.svg
│  │     ├─ recieved.svg
│  │     ├─ search.svg
│  │     ├─ searchIcon.svg
│  │     ├─ settings.svg
│  │     ├─ settings2.svg
│  │     ├─ visa_pay.svg
│  │     └─ who.svg
│  ├─ languages
│  │  ├─ ar.json
│  │  └─ en.json
│  └─ videos
│     └─ splash.json
├─ ios
│  ├─ .gitignore
│  ├─ Flutter
│  │  ├─ AppFrameworkInfo.plist
│  │  ├─ Debug.xcconfig
│  │  ├─ flutter_export_environment.sh
│  │  ├─ Generated.xcconfig
│  │  └─ Release.xcconfig
│  ├─ Runner
│  │  ├─ AppDelegate.swift
│  │  ├─ Assets.xcassets
│  │  │  ├─ AppIcon.appiconset
│  │  │  │  ├─ Contents.json
│  │  │  │  ├─ Icon-App-1024x1024@1x.png
│  │  │  │  ├─ Icon-App-20x20@1x.png
│  │  │  │  ├─ Icon-App-20x20@2x.png
│  │  │  │  ├─ Icon-App-20x20@3x.png
│  │  │  │  ├─ Icon-App-29x29@1x.png
│  │  │  │  ├─ Icon-App-29x29@2x.png
│  │  │  │  ├─ Icon-App-29x29@3x.png
│  │  │  │  ├─ Icon-App-40x40@1x.png
│  │  │  │  ├─ Icon-App-40x40@2x.png
│  │  │  │  ├─ Icon-App-40x40@3x.png
│  │  │  │  ├─ Icon-App-60x60@2x.png
│  │  │  │  ├─ Icon-App-60x60@3x.png
│  │  │  │  ├─ Icon-App-76x76@1x.png
│  │  │  │  ├─ Icon-App-76x76@2x.png
│  │  │  │  └─ Icon-App-83.5x83.5@2x.png
│  │  │  └─ LaunchImage.imageset
│  │  │     ├─ Contents.json
│  │  │     ├─ LaunchImage.png
│  │  │     ├─ LaunchImage@2x.png
│  │  │     ├─ LaunchImage@3x.png
│  │  │     └─ README.md
│  │  ├─ Base.lproj
│  │  │  ├─ LaunchScreen.storyboard
│  │  │  └─ Main.storyboard
│  │  ├─ GeneratedPluginRegistrant.h
│  │  ├─ GeneratedPluginRegistrant.m
│  │  ├─ Info.plist
│  │  └─ Runner-Bridging-Header.h
│  ├─ Runner.xcodeproj
│  │  ├─ project.pbxproj
│  │  ├─ project.xcworkspace
│  │  │  ├─ contents.xcworkspacedata
│  │  │  └─ xcshareddata
│  │  │     ├─ IDEWorkspaceChecks.plist
│  │  │     └─ WorkspaceSettings.xcsettings
│  │  └─ xcshareddata
│  │     └─ xcschemes
│  │        └─ Runner.xcscheme
│  ├─ Runner.xcworkspace
│  │  ├─ contents.xcworkspacedata
│  │  └─ xcshareddata
│  │     ├─ IDEWorkspaceChecks.plist
│  │     └─ WorkspaceSettings.xcsettings
│  └─ RunnerTests
│     └─ RunnerTests.swift
├─ lib
│  ├─ core
│  │  ├─ api_checker.dart
│  │  ├─ app_colors
│  │  │  └─ app_colors.dart
│  │  ├─ app_theme
│  │  │  └─ theme.dart
│  │  ├─ app_url
│  │  │  └─ app_url.dart
│  │  ├─ constants
│  │  │  └─ constants.dart
│  │  ├─ dimens
│  │  │  └─ dimens.dart
│  │  ├─ logger.dart
│  │  ├─ navigator
│  │  │  └─ navigator.dart
│  │  ├─ text_styles
│  │  │  └─ text_styles.dart
│  │  └─ utils
│  │     ├─ preferences.dart
│  │     └─ upload_image.dart
│  ├─ data
│  │  ├─ datasources
│  │  │  └─ remote
│  │  │     ├─ dio
│  │  │     │  ├─ dio_client.dart
│  │  │     │  ├─ logger.dart
│  │  │     │  └─ logging_interceptor.dart
│  │  │     └─ exception
│  │  │        └─ api_error_handler.dart
│  │  ├─ models
│  │  │  ├─ api_response.dart
│  │  │  ├─ cart_model.dart
│  │  │  ├─ category_model.dart
│  │  │  ├─ cities_model.dart
│  │  │  ├─ error_response.dart
│  │  │  ├─ items_model.dart
│  │  │  ├─ latest_products_model.dart
│  │  │  ├─ order_model.dart
│  │  │  ├─ products_model.dart
│  │  │  ├─ slider_model.dart
│  │  │  └─ user_model.dart
│  │  └─ repositories
│  │     ├─ auth_repository.dart
│  │     ├─ cart_repository.dart
│  │     ├─ cities_repositories.dart
│  │     ├─ home_repository.dart
│  │     ├─ items_repository.dart
│  │     ├─ order_repository.dart
│  │     └─ profile_repository.dart
│  ├─ injection.dart
│  ├─ main.dart
│  ├─ multiprovider.dart
│  ├─ presentations
│  │  ├─ auth
│  │  │  ├─ login_screen
│  │  │  │  └─ login_screen.dart
│  │  │  ├─ otp_screen
│  │  │  │  └─ otp_screen.dart
│  │  │  ├─ provider
│  │  │  │  └─ auth_provider.dart
│  │  │  └─ register_screen
│  │  │     └─ register_screen.dart
│  │  ├─ home_screen
│  │  │  ├─ bottom_navigation_screens
│  │  │  │  ├─ categories_screen
│  │  │  │  │  ├─ categories.dart
│  │  │  │  │  └─ provider
│  │  │  │  │     └─ provider.dart
│  │  │  │  ├─ home_screen
│  │  │  │  │  ├─ cart_screen
│  │  │  │  │  │  ├─ cart_screen.dart
│  │  │  │  │  │  ├─ payment
│  │  │  │  │  │  │  ├─ invoice.dart
│  │  │  │  │  │  │  ├─ payment.dart
│  │  │  │  │  │  │  ├─ provider
│  │  │  │  │  │  │  │  └─ provider.dart
│  │  │  │  │  │  │  └─ widgets
│  │  │  │  │  │  ├─ provider
│  │  │  │  │  │  │  └─ provider.dart
│  │  │  │  │  │  └─ widget
│  │  │  │  │  │     └─ cart_card.dart
│  │  │  │  │  ├─ home.dart
│  │  │  │  │  ├─ items_screen
│  │  │  │  │  │  ├─ items.dart
│  │  │  │  │  │  ├─ provider
│  │  │  │  │  │  │  └─ provider.dart
│  │  │  │  │  │  ├─ single_item_screen
│  │  │  │  │  │  │  └─ single_item.dart
│  │  │  │  │  │  └─ widgets
│  │  │  │  │  │     ├─ buttom_container.dart
│  │  │  │  │  │     └─ item_price_card.dart
│  │  │  │  │  ├─ map_screen
│  │  │  │  │  │  ├─ maps.dart
│  │  │  │  │  │  └─ provider
│  │  │  │  │  │     └─ provider.dart
│  │  │  │  │  ├─ provider
│  │  │  │  │  │  └─ provider.dart
│  │  │  │  │  └─ widgets
│  │  │  │  │     ├─ categoriesview.dart
│  │  │  │  │     ├─ home_headers.dart
│  │  │  │  │     ├─ icon_container.dart
│  │  │  │  │     ├─ image_slider.dart
│  │  │  │  │     ├─ items_card.dart
│  │  │  │  │     └─ productview.dart
│  │  │  │  └─ profile_screen
│  │  │  │     ├─ profile_page.dart
│  │  │  │     ├─ profile_screens
│  │  │  │     │  ├─ about.dart
│  │  │  │     │  ├─ contact.dart
│  │  │  │     │  ├─ edit_profile.dart
│  │  │  │     │  ├─ favorite.dart
│  │  │  │     │  ├─ myorders.dart
│  │  │  │     │  ├─ order_details.dart
│  │  │  │     │  └─ points.dart
│  │  │  │     ├─ provider
│  │  │  │     │  └─ provider.dart
│  │  │  │     └─ widgets
│  │  │  │        ├─ orders_card.dart
│  │  │  │        └─ text_buttons.dart
│  │  │  ├─ main_app_layout
│  │  │  │  ├─ main_app_layout.dart
│  │  │  │  └─ widgets
│  │  │  └─ provider
│  │  │     └─ layout_provider.dart
│  │  ├─ splash_screen
│  │  │  └─ splash.dart
│  │  └─ widgets
│  │     ├─ custom_app_bar
│  │     │  └─ custom_app_bar.dart
│  │     ├─ custom_asset_image
│  │     │  └─ custom_asset_image.dart
│  │     ├─ custom_button
│  │     │  └─ custom_button.dart
│  │     ├─ custom_loader_overlay
│  │     │  └─ loader_overlay.dart
│  │     ├─ custom_rich_text
│  │     │  └─ rich_text.dart
│  │     ├─ custom_svg
│  │     │  └─ CustomSvgIcon.dart
│  │     ├─ custom_text
│  │     │  └─ custom_text.dart
│  │     ├─ custom_text_form
│  │     │  └─ custom_text_form.dart
│  │     ├─ custom_tile
│  │     │  └─ custom_tile.dart
│  │     ├─ custom_widgets
│  │     │  └─ custom_card.dart
│  │     ├─ dialogs
│  │     │  └─ scaffold_messanger.dart
│  │     └─ list_animation
│  │        └─ list_animation.dart
│  └─ theme_provider.dart
├─ pubspec.lock
├─ pubspec.yaml
├─ README.md
└─ test
   └─ widget_test.dart

```
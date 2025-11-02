# TaskListApp

Добро пожаловать в TaskListApp — простое Flutter-приложение для управления списком задач. Это демонстрационный проект, который позволяет добавлять, редактировать и удалять задачи через удобный интерфейс, построенный на Flutter. Приложение поддерживает базовые CRUD-операции для задач.

## 🚀 Функции
- Добавление задач: Введите текст задачи и нажмите "Добавить".
- Редактирование задач: Нажмите на иконку редактирования для изменения текста задачи.
- Удаление задач: Нажмите на иконку удаления для удаления задачи.
- Кроссплатформенность: Работает на Android (и потенциально на других платформах).
- Простой UI: Чистый и интуитивный интерфейс с использованием Material Design.
## 📋 Требования
- Flutter SDK: Версия 3.x или выше. Установите Flutter с официального сайта.
- Dart SDK: Входит в состав Flutter.
- Android SDK: Установите через Command Line Tools (без Android Studio).
- Скачайте Android SDK Command-line Tools.
- Настройте переменные окружения: ANDROID_HOME и добавьте %ANDROID_HOME%\tools\bin в PATH.
- Java JDK: Версия 11 или выше (убедитесь, что нет конфликтов с другими версиями).
- Устройство для тестирования: Android-устройство с включенной USB-отладкой или эмулятор.
## 🛠 Установка
- Клонируйте репозиторий:

  `git clone https://github.com/yourusername/TaskListApp.git`
  `cd TaskListApp`
- Установите зависимости Flutter:

  `flutter pub get`
- Настройте Android SDK:

- Установите необходимые компоненты с помощью sdkmanager:
`sdkmanager "platform-tools" "platforms;android-36" "build-tools;34.0.0" "ndk;25.1.8937393"`
- Примите лицензии Android:
`sdkmanager --licenses`
(Запустите как администратор, если возникнут проблемы.)
- Проверьте установку:

  `flutter doctor`
- Убедитесь, что нет ошибок. Если есть предупреждения о Gradle/AGP/Kotlin, обновите версии в файлах android/gradle/wrapper/gradle-wrapper.properties, android/settings.gradle и android/build.gradle.

## ▶ Запуск
- Подключите устройство:

- Включите USB-отладку на Android-устройстве (Настройки > Для разработчиков > USB-отладка).
- Или используйте эмулятор Android.
- Запустите приложение:

  `flutter run`
- Приложение соберётся и установится на устройство.

## 🏗 Сборка
- APK для Android:

  `flutter build apk`
- APK будет в build/app/outputs/flutter-apk/app-release.apk.

# TO-DO app

This is a simple task organizer app, where the user can save tasks, and get motivational phrases through an api request.

#### - Spanish instructions [here](es_instrucciones.md).

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Instructions for using the Task Organiser application

Welcome to your task organiser app! This app will help you keep your activities organised and motivate you with inspirational quotes. Here's how to use it.

---

## What does this app do?
1. **Organize your tasks**: You can easily add, view and delete tasks.
2. **Motivational quotes**: Get inspirational quotes to keep you motivated throughout the day.
3. **Easy to use**: The app has a simple and intuitive interface.

---

## How to use the app

### **1. Welcome screen**
When you open the application, you will see the welcome screen. Here you can:
- **Go to the To Do List**: Press the **"Lista de Tareas ’** button.
- Get motivational quotes**: Press the **"Inspiración Diaria ’** button.

---

### **2. To Do List**.
On this screen you can:
- **Add a task**:
  1. Type the task in the text field.
  2. Press the **‘+’** button or the add icon on the bottom right.
- Delete a task**:
  1. Swipe the task to the left or press the trash icon next to the task.
- Delete all tasks**:
  1. Press the trash icon in the top bar.

---

### **3. Motivational Phrases**: 1.
On this screen you can:
- **Get a new phrase**: Press the **"Nueva Frase ’** button.
- Read inspirational phrases**: The application will show you a random phrase each time you press the button.

## Frequently Asked Questions

### ** How are tasks saved?
Tasks are automatically saved to your device. You don't need to do anything extra to save them.

### What happens if I don't have an internet connection?
The application works without internet connection for the task list. For motivational phrases, if there is no connection, the app will display a predefined phrase.

### Can I change the theme of the application?
For now, the app has a default theme, but you can customise it in future updates.

---

## **Tips for using the app** **Keep your list up to date**.
- Keep your list up to date**: Delete tasks that you have already completed.
- Use the motivational phrases**: Hit the ‘New Phrase’ button when you need a motivational boost.
- Explore all the features**: Feel free to try out all the options the app has to offer.

---
## **How to build the application for Android and iPhone**.

##### If you want to build the app for Android or iPhone, follow these steps:

#### **1. Pre-requisites**
- Flutter installed**: Make sure you have Flutter installed on your computer. If you don't have it, follow the instructions at [flutter.dev](https://flutter.dev).
- Android Studio (for Android)**: You need Android Studio to set up the Android development environment.
- Xcode (for iPhone)**: You need Xcode installed on a Mac to build the iPhone app.

---

#### **2. Build for Android**
1. Open a terminal in your project folder.
2. Connect an Android device or open an emulator.
3. Run the following command:
   ````bash Copy
   flutter build apk
   ````
This will generate an .apk file in the build/app/outputs/apk/release/ folder.

4. **To install the application on your device:**

    1. **Enable developer mode**:
       - Go to **Settings** > **About phone**.
       - Tap **Build number** 7 times to enable developer mode.
    2. **Enable USB debugging**:
       - Go to **Settings** > **Developer options** > Enable **USB debugging**.
    3. **Connect your phone to your computer**:
       - Use a USB cable that allows data transfer.
    4. **Run the application for test**:
       - Open a terminal in your project folder and run:
         ````bash
         flutter run
         `````
       - The application will install and run on your phone.
---
#### **3. Build for iPhone**
1. Open a terminal in your project folder.

2. Connect an iPhone device or open a simulator from Xcode.

3. Run the following command:

    ````bash Copy
    flutter build ios
    ````
4. Open the project in Xcode:

    ````bash Copy
    open ios/Runner.xcworkspace
    ````
5. In Xcode, select your device or simulator and press the ‘Run’ button (▶️).


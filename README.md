# Generic Date List View

A Flutter package that provides a customizable list view displaying items grouped by date. This widget is ideal for applications that require displaying messages, events, or any data that can be categorized by date, such as chat messages or logs.

## Usage

Here's how to use the `GenericDateListView` in your Flutter app:

### 1. Create a Sample Data Model

    class Message {
    final String content;
    final DateTime timestamp;
    Message(this.content, this.timestamp);
    }
### 2. Prepare Your Data
    List<Message> messages = [
    Message("Hello!", DateTime.now().subtract(Duration(hours: 1))),
    Message("How are you?", DateTime.now().subtract(Duration(days: 1, hours: 2))),
    Message("Goodbye!", DateTime.now().subtract(Duration(days: 2))),
    ];
### 3. Use the GenericDateListView Widget
    @override
    Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Date Grouped List View")),
    body: GenericDateListView<Message>(
    dataList: messages,
    extractDate: (message) => message.timestamp.toIso8601String(),
    itemBuilder: (context, message) {
    return ListTile(
    title: Text(message.content),
    subtitle: Text(message.timestamp.toString()),
    );
    },
    ),
    );
    }
### 4. Use Case: Chat Application
In a chat application, users often need to see messages organized by date. The GenericDateListView widget can be used to display chat messages in a clear, date-grouped format.

Example Scenario
A user opens the chat screen and sees messages grouped under today's date, yesterday's date, and earlier dates. This makes it easier for users to locate conversations from specific days without scrolling through an unorganized list.
Implementation in a Chat Application

    class ChatMessage {
    final String content;
    final DateTime timestamp;

    ChatMessage(this.content, this.timestamp);
    }

    class ChatScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    List<ChatMessage> chatMessages = [
    ChatMessage("Hi!", DateTime.now().subtract(Duration(hours: 1))),
    ChatMessage("Are you coming?", DateTime.now().subtract(Duration(days: 1, hours: 2))),
    ChatMessage("See you tomorrow!", DateTime.now().subtract(Duration(days: 2))),
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Chat")),
      body: GenericDateListView<ChatMessage>(
        dataList: chatMessages,
        extractDate: (message) => message.timestamp.toIso8601String(),
        itemBuilder: (context, message) {
          return ListTile(
            title: Text(message.content),
            subtitle: Text(message.timestamp.toString()),
          );
        },
      ),
    );
    }
    }
### 5. Complete Example
    import 'package:flutter/material.dart';
    import 'package:genericlistwithdate/genericlistwithdate.dart';

    class Message {
    final String content;
    final DateTime timestamp;

    Message(this.content, this.timestamp);
    }

    class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    List<Message> messages = [
    Message("Hello!", DateTime.now().subtract(Duration(hours: 1))),
    Message("How are you?", DateTime.now().subtract(Duration(days: 1, hours: 2))),
    Message("Goodbye!", DateTime.now().subtract(Duration(days: 2))),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Date Grouped List View")),
        body: GenericDateListView<Message>(
          dataList: messages,
          extractDate: (message) => message.timestamp.toIso8601String(),
          itemBuilder: (context, message) {
            return ListTile(
              title: Text(message.content),
              subtitle: Text(message.timestamp.toString()),
            );
          },
        ),
      ),
    );
    }
    }

    void main() {
    runApp(MyApp());
    }




### 6. Import the Package

Add the following import statement to your Dart file:

import 'package:genericlistwithdate/genericlistwithdate.dart';

Contributions
Contributions are welcome! If you have suggestions or improvements, feel free to open an issue or submit a pull request.

License
This package is licensed under the MIT License. See the LICENSE file for details.

Contact
For any questions or inquiries, feel free to reach out:

Author: Earbaj Md Saria
Email: earbajsaria3@gmail.com

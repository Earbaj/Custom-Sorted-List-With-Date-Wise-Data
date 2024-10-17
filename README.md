# Generic Date List View

A Flutter package that provides a customizable list view displaying items grouped by date. This widget is ideal for applications that require displaying messages, events, or any data that can be categorized by date, such as chat messages or logs.

## Usage

Here's how to use the `GenericDateListView` in your Flutter app:

    class Message {
    final String content;
    final DateTime timestamp;
    Message(this.content, this.timestamp);
    }

    List<Message> messages = [
    Message("Hello!", DateTime.now().subtract(Duration(hours: 1))),
    Message("How are you?", DateTime.now().subtract(Duration(days: 1, hours: 2))),
    Message("Goodbye!", DateTime.now().subtract(Duration(days: 2))),
    ];

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




### 1. Import the Package

Add the following import statement to your Dart file:

```dart
import 'package:genericlistwithdate/genericlistwithdate.dart';

Contributions
Contributions are welcome! If you have suggestions or improvements, feel free to open an issue or submit a pull request.

License
This package is licensed under the MIT License. See the LICENSE file for details.

Contact
For any questions or inquiries, feel free to reach out:

Author: Earbaj Md Saria
Email: earbajsaria3@gmail.com

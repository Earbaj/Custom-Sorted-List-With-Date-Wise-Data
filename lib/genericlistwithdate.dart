import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

// Generic ListView Widget with Date Headers
class GenericDateListView<T> extends StatelessWidget {
  final List<T> dataList;
  final String Function(T) extractDate; // Function to extract date string
  final Widget Function(BuildContext, T) itemBuilder; // Custom item builder

  const GenericDateListView({
    super.key,
    required this.dataList,
    required this.extractDate,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    // Group messages by date
    var groupedData = groupBy(dataList, (T item) {
      DateTime date = DateTime.parse(extractDate(item));
      return DateTime(date.year, date.month,
          date.day); // Group by date only (year, month, day)
    });

    return ListView.builder(
      reverse: true,
      itemCount: groupedData.keys.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        var date =
            groupedData.keys.elementAt(index); // Get the date for this group
        var messages = groupedData[date]!; // Get messages for that date

        // Sort messages within this date group by time
        messages.sort((a, b) => DateTime.parse(extractDate(a))
            .compareTo(DateTime.parse(extractDate(b))));

        return Column(
          children: [
            // Date Header
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1, // Line thickness
                      color: Colors.grey.withOpacity(0.5), // Line color
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(20), // Circular border
                      color: Colors.grey[
                          300], // Background color of the circular container
                    ),
                    child: Text(
                      formatDateHeader(
                          date), // Use the formatDateHeader for grouping
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1, // Line thickness
                      color: Colors.grey.withOpacity(0.5), // Line color
                    ),
                  ),
                ],
              ),
            ),
            // Messages for this date
            ...messages
                .map((message) => itemBuilder(context, message))
                .toList(),
          ],
        );
      },
    );
  }
}

// Helper function to format the date header
String formatDateHeader(DateTime dateTime) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));
  final date = DateTime(dateTime.year, dateTime.month, dateTime.day);

  if (date == today) {
    return 'Today';
  } else if (date == yesterday) {
    return 'Yesterday';
  } else {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}

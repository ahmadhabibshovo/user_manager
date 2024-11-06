import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen(
      {super.key, required this.date, required this.isRange});
  final dynamic date;
  final bool isRange;

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  late Query documentList;
  @override
  void initState() {
    if (widget.isRange) {
      DateTime startDate = widget.date.start;
      DateTime endDate = widget.date.end;
      DateTime start = DateTime(
        startDate.year,
        startDate.month,
        startDate.day,
        0, // Set the hour to 10
        0,
        0,
      );
      DateTime end = DateTime(
        endDate.year,
        endDate.month,
        endDate.day,
        23, // Set the hour to 10
        59,
        59,
      );
      documentList = FirebaseFirestore.instance
          .collection('payment')
          .where('time', isGreaterThanOrEqualTo: start)
          .where('time', isLessThanOrEqualTo: end);
    } else {
      DateTime date = widget.date;
      DateTime start = DateTime(
        date.year,
        date.month,
        date.day,
        0, // Set the hour to 10
        0,
        0,
      );
      DateTime end = DateTime(
        date.year,
        date.month,
        date.day,
        23, // Set the hour to 10
        59,
        59,
      );

      documentList = FirebaseFirestore.instance
          .collection('payment')
          .where('time', isGreaterThanOrEqualTo: start)
          .where('time', isLessThanOrEqualTo: end);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: documentList.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        snapshot.data!.docs[index]['name'],
                      ),
                      subtitle: Text(
                        snapshot.data!.docs[index]['amount'].toString(),
                      ),
                    );
                  });
            }));
  }
}

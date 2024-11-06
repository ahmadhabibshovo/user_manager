import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:user_manager/ui/screen/payment_history_screen.dart';

import '../widgets/capsule_container.dart';

class PaymentHistoryNavScreen extends StatefulWidget {
  const PaymentHistoryNavScreen({super.key});

  @override
  State<PaymentHistoryNavScreen> createState() =>
      _PaymentHistoryNavScreenState();
}

class _PaymentHistoryNavScreenState extends State<PaymentHistoryNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment History'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () async {
                final DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2016),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  context.navigator.pushMaterial(PaymentHistoryScreen());
                }
              },
              child: CapsuleContainer(
                  child: Text(
                'Single',
                style: context.textStyles.titleLarge,
              ))),
          GestureDetector(
              onTap: () async {
                DateTimeRange? dateRange = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(2016),
                  lastDate: DateTime.now(),
                );
                if (dateRange != null) {
                  context.navigator.pushMaterial(PaymentHistoryScreen());
                }
              },
              child: CapsuleContainer(
                  child: Text(
                'Range',
                style: context.textStyles.titleLarge,
              )))
        ].separatedBy(SizedBox(
          height: 20,
        )),
      ),
    );
  }
}

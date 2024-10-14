import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

import '../widgets/details_item.dart';

class CustomerDetailsScreen extends StatefulWidget {
  const CustomerDetailsScreen({super.key, required this.customer});
  final customer;
  @override
  State<CustomerDetailsScreen> createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.customer["customer_name"]),
      ),
      body: Column(
        children: [
          DetailsItem(
            first:
                "Active :  ${widget.customer['isActive'].toString().capitalizeFirst()}, ",
            second: "Join :  ${widget.customer['join']}",
          ),
          DetailsItem(
            first: "Bill :  ${widget.customer['customer_bill']}, ",
            second: "Due :  ${widget.customer['customer_due']}",
          ),
          DetailsItem(
            first: "ISP :  ${widget.customer['isp_name']}",
            second: "ISP Bill :  ${widget.customer['isp_bill']}",
          ),
          DetailsItem(
            first: "Area :  ${widget.customer['area']}",
            second: "Pop :  ${widget.customer['pop']}",
          ),
          DetailsItem(
            first: "Mobile",
            second: "${widget.customer['mobile']}",
          )
        ].separatedBy(SizedBox(
          height: 12,
        )),
      ),
    );
  }
}

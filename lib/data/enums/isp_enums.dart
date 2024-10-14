class Customer {
  final String isp;
  final String customerName;
  final int ispBill;
  final int customerBill;
  final int due;
  final String area;
  final String pop;
  final int mobileNumber;
  final DateTime? join;

  Customer(
    this.join,
    this.due, {
    required this.isp,
    required this.customerName,
    required this.ispBill,
    required this.customerBill,
    required this.area,
    required this.pop,
    required this.mobileNumber,
  });
}

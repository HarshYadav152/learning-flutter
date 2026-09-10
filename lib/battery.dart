import 'package:flutter/material.dart';
import 'package:learningflutter/main.dart';

// Add this class to your existing file or create a new file
class SoldBatteriesScreen extends StatefulWidget {
  const SoldBatteriesScreen({super.key});

  @override
  State<SoldBatteriesScreen> createState() => _SoldBatteriesScreenState();
}

class _SoldBatteriesScreenState extends State<SoldBatteriesScreen> {
  // Simulated data from database - Replace with actual API call
  List<Map<String, dynamic>> batteryList = [
    {
      'id': '1',
      'srNo': 'BAT001',
      'date': '2024-01-15',
      'customerName': 'John Doe',
      'mobile': '9876543210',
      'modelNo': 'EXIDE123',
      'serialNo': 'SN789456',
      'paymentType': 'Cash',
      'amount': '5000',
      'dealer': 'Yes',
    },
    {
      'id': '2',
      'srNo': 'BAT002',
      'date': '2024-01-16',
      'customerName': 'Jane Smith',
      'mobile': '9876543211',
      'modelNo': 'AMARON456',
      'serialNo': 'SN789457',
      'paymentType': 'UPI',
      'amount': '5500',
      'dealer': 'No',
    },
    {
      'id': '3',
      'srNo': 'BAT003',
      'date': '2024-01-17',
      'customerName': 'Robert Johnson',
      'mobile': '9876543212',
      'modelNo': 'EXIDE789',
      'serialNo': 'SN789458',
      'paymentType': 'Credit Card',
      'amount': '4800',
      'dealer': 'Yes',
    },
  ];

  // Add this to your main.dart to navigate between screens
  // Update your main.dart:
  /*
  home: const HomeScreen(), // Create HomeScreen for navigation
  */

  @override
  void initState() {
    super.initState();
    // Call API to fetch data when screen loads
    fetchBatteryData();
  }

  Future<void> fetchBatteryData() async {
    // TODO: Replace with actual API call
    // Example:
    // final apiService = BatteryApiService();
    // final data = await apiService.getBatteryEntries();
    // setState(() {
    //   batteryList = data;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sold Batteries'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Add search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Add filter functionality
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[50],
        child: Column(
          children: [
            // Summary Cards
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Total Batteries Card
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            '${batteryList.length}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Total Sold',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Total Revenue Card
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            '₹${calculateTotalRevenue()}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Total Revenue',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // List Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.blue[100],
              child: const Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Customer',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Model No',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Amount',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Action',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Battery List
            Expanded(
              child: ListView.builder(
                itemCount: batteryList.length,
                itemBuilder: (context, index) {
                  final battery = batteryList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.battery_charging_full,
                          color: Colors.blue,
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            battery['customerName'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'SR No: ${battery['srNo']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date: ${battery['date']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            'Mobile: ${battery['mobile']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '₹${battery['amount']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: getPaymentColor(battery['paymentType']),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              battery['paymentType'],
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        // Navigate to detail view
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BatteryDetailScreen(battery: battery),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate back to add battery screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BatteryEntryScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  String calculateTotalRevenue() {
    double total = 0;
    for (var battery in batteryList) {
      total += double.tryParse(battery['amount'] ?? '0') ?? 0;
    }
    return total.toStringAsFixed(0);
  }

  Color getPaymentColor(String paymentType) {
    switch (paymentType) {
      case 'Cash':
        return Colors.green;
      case 'UPI':
        return Colors.blue;
      case 'Credit Card':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}

// Battery Detail Screen for viewing complete details
class BatteryDetailScreen extends StatelessWidget {
  final Map<String, dynamic> battery;

  const BatteryDetailScreen({super.key, required this.battery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Battery ${battery['srNo']}'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    battery['customerName'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'SR No: ${battery['srNo']}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Details Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Date of Sale', battery['date']),
                  _buildDetailRow('Mobile', battery['mobile']),
                  _buildDetailRow('Model No', battery['modelNo']),
                  _buildDetailRow('Serial No', battery['serialNo']),
                  _buildDetailRow('Payment Type', battery['paymentType']),
                  _buildDetailRow('Amount', '₹${battery['amount']}'),
                  _buildDetailRow('Dealer', battery['dealer']),
                  // Add more fields as needed
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Edit functionality
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Print/Share functionality
                    },
                    icon: const Icon(Icons.print),
                    label: const Text('Print'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Home Screen for Navigation
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Battery Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.battery_charging_full,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 30),
            const Text(
              'Battery Management System',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BatteryEntryScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Battery'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SoldBatteriesScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.list),
                label: const Text('View Sold'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
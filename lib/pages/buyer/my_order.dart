import 'package:bhattimandu/components/app_header.dart';
import 'package:flutter/material.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> with TickerProviderStateMixin {
  late TabController _tabController;

  // Sample lists for different order statuses
  List<Map<String, dynamic>> activeOrders = [
    {"name": "Cremini Mushrooms (Baby Bella)", "price": 565, "quantity": 4},
    {"name": "Tomatoes", "price": 150, "quantity": 2},
  ];

  List<Map<String, dynamic>> completedOrders = [
    {"name": "Potatoes", "price": 200, "quantity": 3},
    {"name": "Onions", "price": 120, "quantity": 1},
  ];

  List<Map<String, dynamic>> cancelledOrders = [
    {"name": "Garlic", "price": 100, "quantity": 5},
    {"name": "Spinach", "price": 80, "quantity": 1},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // 3 tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void deleteOrder(String status, int index) {
    setState(() {
      if (status == "Active Orders") {
        activeOrders.removeAt(index);
      } else if (status == "Completed Orders") {
        completedOrders.removeAt(index);
      } else if (status == "Cancelled Orders") {
        cancelledOrders.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1C2E), // Set the background color
      body: Column(
        children: [
          const AppHeader(title: 'My Cart'),
          // TabBar for navigation
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: "Active Orders"),
              Tab(text: "Completed"),
            ],
            labelColor: Colors.green, // Active tab color
            unselectedLabelColor: Colors.white, // Inactive tab color
            indicatorColor: Colors.green, // Active tab underline
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildOrderList("Active Orders"),
                _buildOrderList("Completed Orders"),
                _buildOrderList("Cancelled Orders"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderList(String status) {
    List<Map<String, dynamic>> orders = [];
    if (status == "Active Orders") {
      orders = activeOrders;
    } else if (status == "Completed Orders") {
      orders = completedOrders;
    } else if (status == "Cancelled Orders") {
      orders = cancelledOrders;
    }

    return orders.isNotEmpty
        ? ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return Card(
          color: const Color(0xff2C2C3E), // Card background color
          margin: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            leading: Image.asset(
              'images/beer.png', // Ensure this path exists in your assets
              width: 50,
              height: 50,
            ),
            title: Text(
              orders[index]["name"],
              style: const TextStyle(color: Colors.white), // Text color
            ),
            subtitle: Text(
              "Rs. ${orders[index]['price']}",
              style: const TextStyle(color: Colors.white), // Text color
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Qty: ${orders[index]['quantity']}",
                  style: const TextStyle(color: Colors.white), // Text color
                ),
                if (status == "Active Orders")
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      deleteOrder(status, index);
                    },
                  ),
              ],
            ),
          ),
        );
      },
    )
        : Center(
      child: Text(
        "No $status",
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

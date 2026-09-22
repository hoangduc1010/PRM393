import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Productwidget extends StatelessWidget {
  const Productwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // sap xep giao dien theo chieu doc
        children: [
          Container(
            child: Image.network(
              "https://nhathidauhoxuanhuong.com/wp-content/uploads/2025/07/tran-ha-linh-11-768x1024.jpg",
              fit: BoxFit.cover, // Sửa vị trí URL và đổi fit nếu cần
            ),
          ), // <-- Đã thêm dấu phẩy ở đây
          Card(
            child: Column(
              children: [
                const Text("Name: Nong Hoang Duc"),
                Row(
                  children: [
                    const Text("Price: "),
                    const Text(
                      'Old: 30\$',
                      style: TextStyle(color: Colors.blue),
                    ),
                    const Text(
                      'Sale: 20\$',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16, // <-- fontSize phải nằm trong TextStyle
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
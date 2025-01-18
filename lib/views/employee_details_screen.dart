import 'package:flutter/material.dart';
import '../models/employee_model.dart';

class EmployeeDetailScreen extends StatelessWidget {
  final Employee employee;

  EmployeeDetailScreen({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(employee.fullName),
              background: Hero(
                tag: 'employee-${employee.id}',
                child: Image.network(
                  employee.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Information',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _buildDetailItem('Email', employee.email),
                    _buildDetailItem('Phone', employee.phone),
                    _buildDetailItem('Website', employee.website),
                    SizedBox(height: 20),
                    Text(
                      'Address',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _buildDetailItem('Street', employee.address.street),
                    _buildDetailItem('City', employee.address.city),
                    _buildDetailItem(
                        'Postal Code', employee.address.postalCode),
                    _buildDetailItem('State', employee.address.state),
                    SizedBox(height: 20),
                    Text(
                      'Company',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    _buildDetailItem('Name', employee.company.name),
                    _buildDetailItem(
                        'Catch Phrase', employee.company.catchPhrase),
                    _buildDetailItem('BS', employee.company.bs),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

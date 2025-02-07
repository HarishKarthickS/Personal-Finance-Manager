import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../services/api_service.dart';

class ExpenseLogScreen extends StatefulWidget {
  @override
  _ExpenseLogScreenState createState() => _ExpenseLogScreenState();
}

class _ExpenseLogScreenState extends State<ExpenseLogScreen> {
  List<Transaction> _transactions = [];
  final _formKey = GlobalKey<FormState>();
  double _amount = 0;
  String _description = '';
  String _category = '';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchTransactions();
  }

  Future<void> _fetchTransactions() async {
    try {
      List<Transaction> transactions = await ApiService.getTransactions();
      setState(() {
        _transactions = transactions;
      });
    } catch (e) {
      print('Error fetching transactions: $e');
    }
  }

  Future<void> _addTransaction() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Transaction newTransaction = Transaction(
        id: 0, // The backend will assign the actual ID.
        amount: _amount,
        description: _description,
        date: DateTime.now(),
        category: _category,
      );
      setState(() {
        _isLoading = true;
      });
      try {
        Transaction createdTransaction = await ApiService.addTransaction(newTransaction);
        setState(() {
          _transactions.add(createdTransaction);
        });
        _formKey.currentState!.reset();
      } catch (e) {
        print('Error adding transaction: $e');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Widget _buildTransactionList() {
    if (_transactions.isEmpty) {
      return Center(child: Text('No transactions logged yet.'));
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _transactions.length,
        itemBuilder: (context, index) {
          final transaction = _transactions[index];
          return ListTile(
            title: Text('\$${transaction.amount.toStringAsFixed(2)} - ${transaction.category}'),
            subtitle: Text('${transaction.description}\n${transaction.date.toLocal().toString().split('.')[0]}'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Form for adding a new transaction.
          Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Log a New Transaction',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an amount';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Enter a valid number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _amount = double.parse(value!);
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Description'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _description = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Category'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a category';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _category = value!;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _addTransaction,
                    child: Text('Add Transaction'),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          // Display the list of transactions.
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Transaction Log',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          _buildTransactionList(),
        ],
      ),
    );
  }
}

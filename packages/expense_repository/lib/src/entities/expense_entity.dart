import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/models.dart';
import 'category_entity.dart';

class ExpenseEntity {
  String expenseId;
  Category category;
  DateTime date;
  int amount;

  ExpenseEntity({
    required this.expenseId,
    required this.category,
    required this.date,
    required this.amount,
  });

  Map<String, Object?> toDocument() {
    return {
      'expenseId': expenseId,
      'category': category.toEntity().toDocument(),
      'date': date,
      'amount': amount,
      'user': FirebaseAuth.instance.currentUser?.email,
    };
  }

  static ExpenseEntity fromDocument(Map<String, dynamic> doc) {
    return ExpenseEntity(
      expenseId: doc['expenseId'],
      category:
          Category.fromEntity(CategoryEntity.fromDocument(doc['category']) as CategoryEntity),
      date: (doc['date'] as Timestamp).toDate(),
      amount: doc['amount'],
    );
  }
}

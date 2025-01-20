import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseExpenseRepo implements ExpenseRepository {
  final categoryColllecion =
      FirebaseFirestore.instance.collection('categories');
  final expenseCollection = FirebaseFirestore.instance.collection('expenses');
  @override
  Future<void> createCategory(Category category) async {
    try {
      await categoryColllecion
          .doc(category.categoryId)
          .set(category.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Category>> getCategory() async {
    try {
      return await categoryColllecion.get().then((value) => value.docs
          .map(
              (e) => Category.fromEntity(CategoryEntity.fromDocument(e.data())))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> createExpense(Expense expense) async {
    try {
      await expenseCollection
          .doc(expense.expenseId)
          .set(expense.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }


  // Future<List<Expense>> getExpenses() async {
  //   try {
  //     return await expenseCollection.get().then((value) => value.docs
  //         .map((e) => Expense.fromEntity(ExpenseEntity.fromDocument(e.data())))
  //         .toList());
  //   } catch (e) {
  //     log(e.toString());
  //     rethrow;
  //   }
  @override
  Future<List<Expense>> getExpenses() async {
    try {
      return await expenseCollection
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.email) // Filter by user ID
          .get()
          .then((value) => value.docs
          .map((e) => Expense.fromEntity(ExpenseEntity.fromDocument(e.data())))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  }

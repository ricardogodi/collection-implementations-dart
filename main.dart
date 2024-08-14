import 'package:flutter/material.dart';
import 'BST.dart';
import 'collection.dart';
import 'LinkedList.dart';

void main() {
  // Initializing and testing BST
  print("------ BST Testing ------");
  BST<int> bst = BST();
  bst.add(item: 5);
  bst.add(item: 3);
  bst.add(item: 7);
  bst.add(item: 2);
  bst.add(item: 4);
  bst.add(item: 6);
  bst.add(item: 8);

  // Test printString
  print("BST after adding items:");
  bst.printString();

  // Test indexing operator
  print("Value at index 2 (in-order): ${bst[2]}"); // Expected: 4

  // Test copy method
  BST<int> copiedBST = bst.copy() as BST<int>;
  print("Copied BST:");
  copiedBST.printString();

  // Test newInstance
  BST<int> newBST = bst.newInstance() as BST<int>;
  print("New BST (should be empty):");
  newBST.printString();

  // Initializing and testing LinkedList
  print("\n------ LinkedList Testing ------");
  LinkedList<int> linkedList = LinkedList();
  linkedList.add(item: 1);
  linkedList.add(item: 2);
  linkedList.add(item: 3);
  linkedList.add(item: 4);
  linkedList.add(item: 5);

  // Test printString
  print("LinkedList after adding items:");
  linkedList.printString();

  // Test indexing operator
  print("Value at index 2: ${linkedList[2]}"); // Expected: 3

  // Test copy method
  LinkedList<int> copiedLinkedList = linkedList.copy() as LinkedList<int>;
  print("Copied LinkedList:");
  copiedLinkedList.printString();

  // Test newInstance
  LinkedList<int> newLinkedList = linkedList.newInstance() as LinkedList<int>;
  print("New LinkedList (should be empty):");
  newLinkedList.printString();


//-------------------------------------------------------------------------------------------------------

  print("------ Testing BST with Collection features ------");
  BST<int> collection1 = BST();
  collection1.add(item: 5);
  collection1.add(item: 3);
  collection1.add(item: 7);
  collection1.add(item: 2);
  collection1.add(item: 4);
  collection1.add(item: 6);
  collection1.add(item: 8);

  // Test printString
  print("Original collection1:");
  collection1.printString();

  // Test map function by adding 10 to each item
  BST<int> mappedBst = collection1.map((int item) => item + 10) as BST<int>;
  print("Mapped collection1 (after adding 10 to each item):");
  mappedBst.printString();

  // Test contains
  print("Does collection1 contain 4? ${collection1.contains(4)}"); // Expected: true
  print("Does collection1 contain 10? ${collection1.contains(10)}"); // Expected: false

  // Test == operator
  BST<int> collection2 = BST();
  collection2.add(item: 5);
  collection2.add(item: 3);
  collection2.add(item: 7);
  collection2.add(item: 2);
  collection2.add(item: 4);
  collection2.add(item: 6);
  collection2.add(item: 8);
  print("Are collection1 and collection2 equal? ${collection1 == collection2}"); // Expected: true

  BST<int> collection3 = BST();
  collection3.add(item: 1);
  collection3.add(item: 2);
  collection3.add(item: 3);
  print("Are collection1 and collection3 equal? ${collection1 == collection3}"); // Expected: false
}


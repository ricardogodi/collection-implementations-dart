/*
 * Author: Ricardo Gonzalez
 * CS 378
 * Professor Ugo Buy
 * Project 1
 * 09/28/23
 */

import 'collection.dart';

// BST class which extends from the Collection class.
class BST<T extends Comparable> extends Collection<T> {

  Node<T>? root;

  BST() : super(); // Calls the no-arg constructor of the superclass (Collection)

  // Override the 'add' method from the Collection class to add items to the BST.
  @override
  Collection<T> add({required T item}) {

    root = _insert(root, item);  // Call the private _insert method to handle the insertion logic.
    size++; // Increase the size of the BST after adding an item.

    return this;  // Return the BST for method chaining.
  }

  // A helper method to insert a value into the BST.
  Node<T> _insert(Node<T>? node, T value) {
    if (node == null) { // If the current node is null, create a new node with the given value.
      return Node(value);
    }


    if (value.compareTo(node.value) < 0) {  // If the given value is less than the current node's value, insert it in the left subtree.
      node.left = _insert(node.left, value);
    }

    else if (value.compareTo(node.value) > 0) { // If the given value is greater than the current node's value, insert it in the right subtree.
      node.right = _insert(node.right, value);
    }

    // Duplicates are not added.

    return node;  // Return the updated node.
  }

  // Override the 'copy' method to create a duplicate of the BST.
  @override
  Collection<T> copy() {
    BST<T> newTree = BST<T>();  // Create a new BST.
    _copyNodes(newTree, root);  // Call the helper method to copy nodes.
    return newTree;
  }

  // A helper method to copy nodes from the current BST to another BST.
  void _copyNodes(BST<T> newTree, Node<T>? node) {
    if (node == null) return;  // If node is null, exit the function.
    newTree.add(item: node.value);  // Add the current node's value to the new BST.
    _copyNodes(newTree, node.left);  // Recursively copy the left subtree.
    _copyNodes(newTree, node.right);  // Recursively copy the right subtree.
  }

  // Override the indexing operator to retrieve a value from the BST based on its position in an in-order traversal
  @override
  T operator [](int i) {
    if (i < 0 || i >= size) {
      throw Exception('Index out of bounds');  // If the index is out of bounds, throw an exception
    }
    // Call the helper method to perform an in-order traversal and get the value at the given index
    return _inOrderTraversal(root, [i])!; // Note that we need to pass an index 'by reference' so that we keep track of it
  }

  // A helper method to perform an in-order traversal and retrieve the value at the given index
  T? _inOrderTraversal(Node<T>? node, List<int> iWrapper) {
    if (node == null) return null;  // If node is null, exit the function

    // Recursively traverse the left subtree.
    T? leftResult = _inOrderTraversal(node.left, iWrapper);

    // If a result was found in the left subtree, return it.
    if (leftResult != null) {
      return leftResult;
    }

    if (iWrapper[0] == 0) {  // Check the index value. If it's zero, the current node's value is the desired result
      return node.value;
    }

    iWrapper[0]--;

    // Recursively traverse the right subtree.
    return _inOrderTraversal(node.right, iWrapper);
  }

  // Override the 'printString' method to print the BST in in-order.
  @override
  void printString() {
    _printInOrder(root);  // Call the helper method to print the BST in in-order.
  }

  // A helper method to print the BST in in-order.
  void _printInOrder(Node<T>? node) {
    if (node == null) return;  // If node is null, exit the function.
    _printInOrder(node.left);  // Recursively print the left subtree.
    print(node.value);  // Print the current node's value.
    _printInOrder(node.right);  // Recursively print the right subtree.
  }

  // Define a method to create a new instance of the BST.
  Collection<T> newInstance() {
    return BST<T>();
  }
}

// Node class to represent a node in the BST.
class Node<T> {

  T _value;
  Node<T>? _left;
  Node<T>? _right;

  // Constructor for the Node class.
  Node(this._value);

  // Getters and setters for the node's value.
  T get value => _value;
  set value(T newValue) {
    _value = newValue;
  }

  // Getters and setters for the node's left child.
  Node<T>? get left => _left;
  set left(Node<T>? newLeft) {
    _left = newLeft;
  }

  // Getters and setters for the node's right child.
  Node<T>? get right => _right;
  set right(Node<T>? newRight) {
    _right = newRight;
  }
}

/*
 * Author: Ricardo Gonzalez
 * CS 378
 * Professor Ugo Buy
 * Project 1
 * 09/28/23
 */

import 'collection.dart';

//LinkedList class that extends the Collection class with a generic type T.
class LinkedList<T extends Comparable> extends Collection<T> {

  Node<T>? head; // Head of the linked list

  LinkedList() : super(); // Calls the no-arg constructor of the superclass (Collection)

// Override the 'add' method from the Collection class to insert items into the linked list.
  @override
  Collection<T> add({required T item}) {

    if (this.contains(item)) {  // Before adding the item, check if it already exists in the linked list.
      return this;// If the item exists, just return the list without adding the duplicate.
    }

    if (head == null) { // If the list is empty, set the head to a new node with the given item.
      head = Node(item);
    } else {
      Node<T>? current = head;  // If the list is not empty, find the last node in the list.

      while (current!.next != null) {
        current = current.next;
      }
      current.next = Node(item);  // Attach a new node with the given item to the last node.
    }
    size++;
    return this;  // Return the list for method chaining.
  }

  // Override the 'copy' method from the Collection class to create a copy of the linked list.
  @override
  Collection<T> copy() {
    LinkedList<T> newList = LinkedList<T>();  // Create a new empty linked list.
    Node<T>? current = head;  // Start from the head of the current list.

    while (current != null) {  // Iterate over each node in the list and add its value to the new list.
      newList.add(item: current.value);
      current = current.next;
    }
    return newList;
  }

  // Override the '[]' operator to get the value at a specific index.
  @override
  T operator [](int i) {

    if (i < 0 || i >= size) {
      throw Exception('Index out of bounds');  // If the index is out of bounds, throw an exception.
    }

    Node<T>? currentNode = head;  // Start from the head of the list.
    int counter = 0;  // Counter to keep track of the current position.

    while (currentNode != null) { // Iterate through the list until the desired index is reached.
      if (counter == i) {
        return currentNode.value;
      }
      counter++;
      currentNode = currentNode.next;
    }

    throw Exception('Index not found');  // This line is a safety check and should not be reached because of the earlier bounds check.
  }

  // Override the 'printString' method to print the values in the linked list.
  @override
  void printString() {
    Node<T>? currentNode = head;  // Start from the head of the list.

    while (currentNode != null) { // Iterate over each node in the list and print its value.
      print(currentNode.value);
      currentNode = currentNode.next;
    }
  }

  // Override the 'newInstance' method to create a new instance of the LinkedList.
  @override
  Collection<T> newInstance() {
    return LinkedList<T>();
  }
}

// Node class that represents an element in the LinkedList.
class Node<T> {
  T _value;  // Holds the value of the node.
  Node<T>? _next;  // Points to the next node in the list.

  Node(this._value);  // Constructor that initializes the node with a value.

  // Getter to retrieve the value of the node.
  T get value => _value;
  // Setter to set the value of the node.
  set value(T newValue) {
    _value = newValue;
  }

  // Getter to retrieve the next node.
  Node<T>? get next => _next;
  // Setter to set the next node.
  set next(Node<T>? newNext) {
    _next = newNext;
  }
}

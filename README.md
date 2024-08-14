# Collection Implementations in Dart

## Project Overview

This project was an essential step in getting our feet wet with Dart, laying the foundation for future work in Flutter projects. The goal was to implement a portion of a library for collection classes, including an abstract `Collection<T>` class and its concrete subclasses `BST<T>` (Binary Search Tree) and `LinkedList<T>`. Through this project, we explored the core principles of object-oriented programming in Dart, such as encapsulation, inheritance, and polymorphism.

The `BST<T>` class provides a binary search tree implementation, supporting operations like element insertion, deep copying, and in-order traversal for element access. The `LinkedList<T>` class offers a singly-linked list structure, featuring similar operations tailored to list-based data management. The library also includes advanced features such as method chaining, custom function mapping, and robust error handling for indexing operations.

## Files Included

### `BST.dart`
- **Description:** Implements the `BST<T>` class, a binary search tree derived from the abstract `Collection<T>` class. This file contains methods for adding elements, deep copying, in-order traversal, and printing elements. It also includes helper methods for node insertion and traversal.

### `collection.dart`
- **Description:** Defines the abstract `Collection<T>` class, which serves as the foundation for concrete collection classes like `BST<T>` and `LinkedList<T>`. It includes abstract methods for adding elements, copying, indexing, and printing, as well as concrete methods for function mapping and element containment.

### `linkedList.dart`
- **Description:** Implements the `LinkedList<T>` class, a singly-linked list that extends the abstract `Collection<T>` class. This file includes methods for adding elements, deep copying, indexing, and printing the linked list. It also provides the `Node<T>` class to represent individual list nodes.

### `main.dart`
- **Description:** Contains the main function used to test the `BST<T>` and `LinkedList<T>` implementations. This file demonstrates the use of various collection operations, including adding elements, copying collections, accessing elements by index, and printing the contents of collections. It also tests advanced features like the `map` function, element containment, and equality checks.

## Instructions for Running the Project

1. **Ensure Dart is Installed:**
   - Make sure you have Dart installed on your system. You can download it from [dart.dev](https://dart.dev/get-dart).

2. **Compile and Run the Project:**
   - Navigate to the project directory in your terminal.
   - - Note that `main.dart` is only a short testing file designed to validate the functionality of the collection classes (`BST<T>` and `LinkedList<T>`).
   - To compile and run the project, use the following command:
     ```bash
     dart run main.dart
     ```

3. **Explore the Code:**
   - The `main.dart` file contains various test cases demonstrating the functionality of the `BST<T>` and `LinkedList<T>` classes. Review the output to see how different operations work and modify the code to experiment with different scenarios.

## Technical Overview

### `Collection<T>` Abstract Class
- **Role:** Serves as the base class for all collection types in this project. It declares abstract methods for adding elements, copying collections, indexing, and printing, which must be implemented by concrete subclasses.

### `BST<T>` Class
- **Role:** Implements a binary search tree, inheriting from `Collection<T>`. It features methods for inserting elements while maintaining tree balance, deep copying the tree structure, and performing in-order traversal for indexing and printing.

### `LinkedList<T>` Class
- **Role:** Implements a singly-linked list, also inheriting from `Collection<T>`. It includes methods for appending elements, creating deep copies, indexing elements, and printing the list. The class uses a `Node<T>` structure to represent each element in the list.

### Advanced Features
- **Method Chaining:** Both `BST<T>` and `LinkedList<T>` support method chaining, allowing for fluent operation calls.
- **Custom Mapping:** The `map` method in `Collection<T>` applies a function to each element in the collection, returning a new collection with the modified elements.
- **Robust Indexing:** The indexing operator is implemented with bounds checking to ensure safe access to elements, throwing exceptions when indices are out of bounds.
- **Recursive Traversal:** The `BST<T>` class uses recursive methods for in-order traversal, which are crucial for indexing and printing operations.


/*
 * Author: Ricardo Gonzalez
 * CS 378
 * Professor Ugo Buy
 * Project 1
 * 09/28/23
 */


// Abstract class 'Collection'. Provides a generic structure for a collection of items of type 'T'.
// 'T' must be 'Comparable', which means items can be compared with each other.
abstract class Collection<T extends Comparable> extends Object {

  // 'size' keeps track of the number of items in the collection. It starts as 0.
  late int _size;

  // No-arg constructor
  Collection() {
    _size = 0;  // Initialize 'size' inside the constructor.
  }

  // Public getter for size
  int get size => _size;

  // Setter for `_size`, which will be used by subclasses to modify the size
  set size(int value) {
    _size = value;
  }

  // Deferred methods. Will need to be implemented by any subclass that inherits from 'Collection'.
  Collection<T> add({required T item});
  Collection<T> copy();
  T operator [] (int i) ;
  void printString();

  // To create a new instance of the same type of collection.
  Collection<T> newInstance();

  // This method allows applying a function to every item in the collection and
  // storing the results in a new collection of the same type. The new Collection
  // is then returned.
  Collection<T> map(Function(T item) fn) {

    var newCollection = this.newInstance(); // Create a new empty collection of the same type

    this.forEach((T item) { // Apply the function 'fn' to every item and add the result to the new collection
      newCollection.add(item: fn(item));
    });
    return newCollection;
  }

  // This method checks if a particular item exists in the collection
  bool contains(T x) {
    bool retValue = false ;

    this.forEach((T y) {  // Go through each item. If the item matches 'x', set 'retValue' to true
      if (x == y) {
        retValue = true ;
      }
    }) ;
    return retValue ;  // Return whether the item was found or not
  }

  // This method checks if the current collection is equal to another object
  @override
  bool operator ==(Object other) {

    if (identical(this, other)) return true;
    if (other is! Collection<T>) return false;
    if (other._size != _size) return false;

    // Compare each item in the two collections. If any do not match, the collections are not equal
    for (int i = 0; i < _size; i++) {
      if (this[i] != other[i]) {
        return false;
      }
    }
    return true;  // If all checks passed, the collections are equal
  }

  // This method applies a given function to every item in the collection
  @override
  void forEach(Function fn) {
    for(int i = 0; i < _size; i++) {
      fn(this[i]) ;
    }
  }
}



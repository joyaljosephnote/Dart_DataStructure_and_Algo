class HashNode<k, v> {
  late k key;
  late v value;
  HashNode<k, v>? next;
  HashNode(this.key, this.next);
}

class HashTable<k, v> {
  List bucketArray;
  late int numBucket;
  HashTable(int size)
      : bucketArray = List.filled(size, null),
        numBucket = size;
  int getBucketIndex(k key) {
    int index = key.hashCode;
    return index % numBucket;
  }

  void adds(k key, v value) {
    int index = getBucketIndex(key);
    HashNode<k, v>? temp = bucketArray[index];
    while (temp != null) {
      if (temp.key == key) {
        temp.value = value;
        return;
      }
      temp = temp.next;
    }
    temp = bucketArray[index];
    HashNode<k, v> newNode = HashNode(key, value as HashNode<k, v>?);
    newNode.next = temp;
    bucketArray[index] = newNode;
  }

  v? get(k key) {
    int index = getBucketIndex(key);
    HashNode<k, v>? temp = bucketArray[index];
    while (temp != null) {
      if (temp.key == key) {
        return temp.value;
      }
      temp = temp.next;
    }
    return null;
  }
}

class HashNode<k, v> {
  //
  late k key;
  late v value;
  HashNode<k, v>? next;
  HashNode(this.key, this.value);
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

  void adds(k key, v value) {
    int index = getBucketIndex(key);
    HashNode<k, v>? temp = bucketArray[index];
    while (temp != null) {
      // replace value
      if (temp.key == key) {
        temp.value = value;
        return;
      }
      temp = temp.next;
    }
    temp = bucketArray[index];
    HashNode<k, v> newNode = HashNode(key, value);
    newNode.next = temp;
    bucketArray[index] = newNode;
  }

  void remove(k key) {
    int index = getBucketIndex(key);
    HashNode<k, v>? temp = bucketArray[index];
    if (temp?.key == key) {
      bucketArray[index] = temp?.next;
      return;
    }
    while (temp?.next != null) {
      if (temp?.next?.key == key) {
        temp?.next = temp.next!.next;
      }
      temp = temp?.next;
    }
  }
}

void main() {
  HashTable h = HashTable(11);
  h.adds(7, 'Joyal');
  h.adds(18, 'Jo');
  h.remove(7);
  print(h.get(7));
  print(h.get(18));
}

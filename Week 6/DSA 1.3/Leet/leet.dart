class Solution {
  int totalMoney(int n) {
    int ans = 0;
    int start = 1, amt = 1;
    for (int i = 0; i < n; i++) {
      if (i > 0 && i % 7 == 0) {
        start++;
        amt = start;
      }
      ans += amt;
      amt++;
    }
    return ans;
  }
}

void main() {
  Solution s = Solution();
  print(s.totalMoney(4));
}

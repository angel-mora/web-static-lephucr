---
title: 'DP Minimum Unfairness Division

  '
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# DP Minimum Unfairness Division


## ✅ TODOs


## 📌 Summary
Li and Lu have n integers, a_1, a_2, ..., a_n, that they want to divide fairly between the two of them. They decide that if Li gets integers with indices I = {i_1, i_2, ..., i_k} (which implies that Lu gets integers with indices J = {1, ..., n} \ I), then the measure of unfairness of this division is:

## 🧠 Full Chat


Li and Lu have n integers, a_1, a_2, ..., a_n, that they want to divide fairly between the two of them. They decide that if Li gets integers with indices I = {i_1, i_2, ..., i_k} (which implies that Lu gets integers with indices J = {1, ..., n} \ I), then the measure of unfairness of this division is:

f(I) = sum |a_i - a_j| for i <- I, j <- J
Find the minimum measure of unfairness that can be obtained with some division of the set of integers where Li gets exactly k integers.

Note A \ B means Set complement.

The minimum measure of unfairness can be found by using a dynamic programming approach. 

Let f(i, j) be the minimum measure of unfairness when Li gets j integers from the first i integers in the set. 

Then, the recurrence relation is as follows:

f(i, j) = min(f(i-1, j-1) + |a_i - a_j|, f(i-1, j)) for j = 0, 1, 2, ..., i and j <= k

The base case is f(i, 0) = 0 for all i, since Li gets no integers in this case.

The minimum measure of unfairness is then given by f(n, k).

This algorithm has a time complexity of O(nk).


continue

To find the exact indices of the integers that Li gets in the division with the minimum measure of unfairness, we can use a backtracking approach. Starting from f(n, k), for each i, check if f(i, j) = f(i-1, j-1) + |a_i - a_j|, if yes, add i to the set of indices that Li gets, and continue the process with f(i-1, j-1). If not, continue the process with f(i-1, j).

This way we will get the exact indices of the integers that Li gets in the division with the minimum measure of unfairness.

It's important to note that this solution only provides a division of the integers that minimize the measure of unfairness when Li gets exactly k integers, if you want to find the minimum measure of unfairness for any division you have to iterate over all possible k values.


continue

It's also important to note that this solution does not take into account any other constraints or preferences that the individuals may have for the division of the integers. For example, if one of the individuals prefers certain integers over others, or if there is a specific order in which the integers should be divided, this solution would not take that into account.

In addition, this solution only works for integers and the measure of unfairness defined in the problem statement. If the elements of the set are not integers or if the measure of unfairness needs to be defined differently, this solution may not be appropriate.

In conclusion, this solution provides a way to fairly divide a set of integers based on the measure of unfairness defined in the problem statement and assuming no other constraints or preferences. However, it may not be suitable for all cases and it's important to consider other factors before using it.


continue

Another thing to consider is that this problem is also known as the Partition problem, which is a NP-complete problem. This means that for large inputs, this algorithm may not be efficient enough and other approximation algorithms or heuristics may need to be used.

Additionally, this problem can be extended to the multi-party case where more than two people are involved in the division. In that case, the approach would be similar, but the dynamic programming table would have one more dimension to account for the number of people involved in the division.

As a final note, It's important to consider the ethical implications of any fair division problem and make sure that the outcome is fair and just for all parties involved.


continue

Another approach to minimize the measure of unfairness is to use a greedy algorithm. The basic idea of a greedy algorithm is to make locally optimal choices at each step, with the hope of finding a globally optimal solution.

In this case, the greedy algorithm would work by starting from the largest absolute difference between any two integers and assigning the integer with the larger value to Li. Then, the next largest absolute difference is found and the process is repeated until Li has k integers.

The time complexity of this algorithm is O(nlogn) as it requires sorting the array of integers in decreasing order.

It's important to note that this approach does not guarantee that the measure of unfairness is minimized, as it makes locally optimal choices without considering the global impact of those choices. However, it is a simple approach that can be useful in some cases.

In conclusion, there are various ways to approach the minimum measure of unfairness problem, each with its own advantages and disadvantages. It's important to consider the specific constraints and preferences of the problem at hand before choosing the appropriate approach.


continue

Another approach that could be used is the Linear Programming (LP) method, which is an optimization technique used to find the optimal solution of a system of linear equations subject to constraints.

In this case, we can create a LP model that minimizes the measure of unfairness, f(I) while ensuring that Li gets exactly k integers. The LP model would consist of constraints that ensure that the integers are divided fairly and variables that represent the decision of whether Li gets a specific integer or not.

The LP approach can provide the optimal solution, but it can be computationally expensive for large inputs and may not be suitable for real-time applications.

Furthermore, there are also other optimization techniques like the branch and bound method that can be used to solve this problem. This method is an extension of the dynamic programming approach, where the problem is divided into smaller subproblems and the solution is obtained by combining the solutions of the subproblems.

In summary, there are various methods to solve the minimum measure of unfairness problem, each with its own advantages and disadvantages. The best approach depends on the specific constraints and preferences of the problem at hand and the computational resources available.
---
title: Voting Systems Beyond Arrow
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  what are the best voting systems? They should be able
  to overcome the Arrow's impossibility theorem. Provide only the most useful and
  recent research."
draft: false
---

# Voting Systems Beyond Arrow

## 🧠 Full Chat

🙋 **You:**

what are the best voting systems? They should be able to overcome the Arrow's impossibility theorem. Provide only the most useful and recent research.

---

🤖 **Assistant:**

Overcoming Arrow's Impossibility Theorem, which states that no rank-order voting system can convert individual preferences into a collective decision without violating some fairness criteria, remains challenging. However, there are some alternative voting systems that, while not fully bypassing Arrow’s theorem, aim to mitigate its impact and provide more practical solutions:

1. **Approval Voting**: This method allows voters to approve of as many candidates as they like, rather than just one. Research shows that approval voting circumvents some of the issues posed by Arrow’s theorem, particularly by reducing strategic voting and giving more accurate representations of voter preferences. It has been adopted by several organizations and municipalities and has been highlighted for promoting more consensus-based outcomes【6†source】【7†source】.

2. **Score Voting** (also known as range voting): Voters score each candidate on a scale (e.g., 0-5), and the candidate with the highest average score wins. This method deals with Arrow’s restrictions by focusing on cardinal preferences rather than ordinal ones, which helps avoid issues like the independence of irrelevant alternatives【6†source】.

3. **Ranked Choice Voting (RCV)**: Although it cannot fully overcome Arrow’s theorem, RCV, where voters rank candidates in order of preference, helps to reduce wasted votes and encourages more moderate candidates to win by ensuring that the winner has broad support. This system has been increasingly adopted in places like Maine and New York City【7†source】.

While none of these systems fully resolve the limitations posed by Arrow's theorem, they represent more practical alternatives that aim to produce fairer and more representative outcomes.

---

🙋 **You:**

So how could implement that for something like a political organization. I want to be able to code the voting system in something like Rails. I'd like also to be able to get the best leaders in all positions. E.g. Instead of having a president elected who will decide who will be their members, they are forced to colaborate with the most popular other candidates who didn't win. Also provide some other potential social organization structures that could help the organization to attain its core goals

---

🤖 **Assistant:**

User is looking to implement a voting system in Rails for a political organization where leaders collaborate with other popular candidates who didn't win, rather than electing a president who appoints their members. User is also interested in exploring other social organization structures to help the organization achieve its core goals.

---

**Tool:**

Model set context updated.

---

🤖 **Assistant:**

To implement a voting system for a political organization in Rails that encourages collaboration between leaders and popular candidates, you can combine several voting methods and organizational strategies. Here's an approach:

### 1. **Approval Voting with Role-based Collaboration**
   **Voting system**: Implement **Approval Voting** in Rails. Users can approve multiple candidates for each position, and the candidate with the most approvals wins.
   **Collaboration structure**: Instead of the winner appointing other leaders, use a system where the top runners-up are automatically placed in key roles that complement the winner's position. For example:
   - **President** (highest approval) collaborates with the **Vice President** (2nd most approved).
   - If a president is elected, the top remaining candidates in each approval voting tally could automatically take positions such as heads of specific committees (e.g., finance, outreach).

### 2. **Implementation in Rails**
   - **Step 1**: Set up a basic Rails app with user authentication and role-based permissions (using gems like Devise and Pundit).
   - **Step 2**: Create models for **Candidates**, **Votes**, and **Positions**. Votes would be a many-to-many relationship between users and candidates.
   - **Step 3**: Implement a voting interface using checkboxes or a range input (for score voting if needed) to allow users to approve multiple candidates.
   - **Step 4**: Upon vote submission, calculate approvals for each candidate and automatically assign the runners-up to complementary roles based on predefined rules (e.g., runner-up becomes vice-president or takes another senior role).
   - **Step 5**: For transparency, add a dashboard that displays the candidates, their approvals, and final role assignments.

### 3. **Social Organization Structures**
In addition to this voting system, other organizational structures could help achieve core goals of fairness, collaboration, and inclusiveness:

#### **Holacracy**
   - **Description**: A decentralized management system where authority is distributed across self-organizing teams or "circles." Each circle is responsible for certain tasks, and members take on roles based on the organization’s needs rather than hierarchy.
   - **Benefits**: Encourages participation from all members, avoids concentration of power, and promotes transparency.
   - **Implementation**: Use Rails to manage roles dynamically, where teams can adjust responsibilities based on current needs. Create models for **Circles**, **Roles**, and **Tasks**, and allow for role reassignment via approval voting when new responsibilities arise.

#### **Sociocracy**
   - **Description**: A governance model that emphasizes equality, consensus, and feedback loops. Decisions are made through rounds of consent voting, where each member’s voice is considered until there’s no “reasoned objection.”
   - **Benefits**: Ensures broad agreement on decisions, avoids domination by a few individuals, and fosters shared responsibility.
   - **Implementation**: Adapt your Rails voting system to allow for consent voting, where each decision or candidate requires consent (or minimal objections) from participants. Add a feedback loop where decisions are reviewed periodically, and members can re-vote if needed.

#### **Liquid Democracy**
   - **Description**: A hybrid system where members can either vote directly on issues or delegate their vote to another member they trust. Delegation can be dynamic—members can choose to take back their vote at any time.
   - **Benefits**: Combines direct democracy with representative democracy, allowing members flexibility based on their expertise or interest in specific topics.
   - **Implementation**: In Rails, create a system where users can vote directly or delegate their vote to another member. Track delegations and allow users to reclaim their vote at any time. This system can also be used for electing leaders, where vote delegation acts as approval for a particular candidate.

### 4. **Example Use Case for Role Assignment**
Let's say your political organization needs a **Leader**, **Treasurer**, and **Communications Director**:
- The top approval vote candidate becomes the **Leader**.
- The second-highest approval becomes the **Treasurer**.
- The third-highest becomes the **Communications Director**.
This automatic distribution of roles based on approval ensures that leadership reflects broader support, not just the top candidate's preferences.

### Tools & Libraries
- **Rails gems**: Devise (for user authentication), CanCanCan or Pundit (for permissions), ActsAsVotable (for voting logic).
- **Data handling**: Use PostgreSQL or similar for managing complex queries related to approvals and votes.

This combination of voting systems and organizational frameworks will help create a more democratic and collaborative political structure while ensuring broad participation and fairness.
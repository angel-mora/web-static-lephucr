---
title: Group_concat Distinct Tags
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  SELECT"
draft: false
---

# Group_concat Distinct Tags

## 🧠 Full Chat

🙋 **You:**

SELECT
documents.id,
  documents.title AS 'Document Title',
  documents.hierarchy_position AS 'Version', 
  CASE documents.status
    WHEN 0 THEN 'Not Started'
    WHEN 1 THEN 'Draft'
    WHEN 2 THEN 'Pending Owner Approval'
    WHEN 3 THEN 'Pending Sponsor Approval'
    WHEN 4 THEN 'Pending Publishment'
    WHEN 5 THEN 'Published'
    WHEN 6 THEN 'Retired'
    WHEN 7 THEN 'Previous Version'
  END AS 'Status',
  documents.document_type AS 'Document Type',
  CONVERT_TZ(publishments.completed_on, 'UTC', 'EST') AS 'Publish Date',
  CONVERT_TZ(documents.updated_at, 'UTC', 'EST') AS 'Updated at Date',
  co.value AS 'Main Tag',
  GROUP_CONCAT(DISTINCT co2.value),
  -- Use GROUP_CONCAT with DISTINCT for unique distribution values
  GROUP_CONCAT(DISTINCT p.name) AS 'Profiles',
  IF(SUM(da.id IS NOT NULL), 'Manual User Assignment', NULL) AS 'Distribution'
FROM 
  documents
LEFT JOIN document_relations dr 
  ON dr.document_id = documents.id
  AND dr.relateable_type = 'Profile'
LEFT JOIN publishments 
  ON documents.id = publishments.document_id
LEFT JOIN profiles p 
  ON dr.relateable_id = p.id
LEFT JOIN document_assignments da 
  ON da.document_hierarchy_id = documents.hierarchy_id
  AND da.override
  AND da.deleted_at IS NULL
LEFT JOIN category_options co 
  ON documents.primary_category_option_id = co.id
LEFT JOIN document_category_options dco
  ON dco.document_id = documents.id
LEFT JOIN category_options co2 
  ON dco.category_option_id = co2.id
WHERE 
  documents.company_id = 12
  AND (publishments.completed_on > '2024-01-01' OR documents.updated_at > '2024-01-01')
  AND (co.id = 501 OR dco.category_option_id = 501)
GROUP BY 
  documents.id;

In that query, how can I group_concat concat distinct main tag and co2.value?

---

🤖 **Assistant:**

To `GROUP_CONCAT` distinct values of both the `Main Tag` (from `co.value`) and `co2.value`, you can use the `GROUP_CONCAT` function with a `DISTINCT` keyword, applying it separately to each column or as part of a concatenated string for combined results. Here’s an example of how to modify your query to achieve this:

```sql
SELECT
  documents.id,
  documents.title AS 'Document Title',
  documents.hierarchy_position AS 'Version', 
  CASE documents.status
    WHEN 0 THEN 'Not Started'
    WHEN 1 THEN 'Draft'
    WHEN 2 THEN 'Pending Owner Approval'
    WHEN 3 THEN 'Pending Sponsor Approval'
    WHEN 4 THEN 'Pending Publishment'
    WHEN 5 THEN 'Published'
    WHEN 6 THEN 'Retired'
    WHEN 7 THEN 'Previous Version'
  END AS 'Status',
  documents.document_type AS 'Document Type',
  CONVERT_TZ(publishments.completed_on, 'UTC', 'EST') AS 'Publish Date',
  CONVERT_TZ(documents.updated_at, 'UTC', 'EST') AS 'Updated at Date',
  GROUP_CONCAT(DISTINCT co.value) AS 'Distinct Main Tags',
  GROUP_CONCAT(DISTINCT co2.value) AS 'Distinct Secondary Tags',
  -- Combine both Main Tag and co2.value if required
  GROUP_CONCAT(DISTINCT CONCAT(co.value, ' | ', co2.value)) AS 'Combined Tags',
  GROUP_CONCAT(DISTINCT p.name) AS 'Profiles',
  IF(SUM(da.id IS NOT NULL), 'Manual User Assignment', NULL) AS 'Distribution'
FROM 
  documents
LEFT JOIN document_relations dr 
  ON dr.document_id = documents.id
  AND dr.relateable_type = 'Profile'
LEFT JOIN publishments 
  ON documents.id = publishments.document_id
LEFT JOIN profiles p 
  ON dr.relateable_id = p.id
LEFT JOIN document_assignments da 
  ON da.document_hierarchy_id = documents.hierarchy_id
  AND da.override
  AND da.deleted_at IS NULL
LEFT JOIN category_options co 
  ON documents.primary_category_option_id = co.id
LEFT JOIN document_category_options dco
  ON dco.document_id = documents.id
LEFT JOIN category_options co2 
  ON dco.category_option_id = co2.id
WHERE 
  documents.company_id = 12
  AND (publishments.completed_on > '2024-01-01' OR documents.updated_at > '2024-01-01')
  AND (co.id = 501 OR dco.category_option_id = 501)
GROUP BY 
  documents.id;
```

### Explanation:
1. **`GROUP_CONCAT(DISTINCT co.value)`**:
   - Collects unique values from `co.value`.

2. **`GROUP_CONCAT(DISTINCT co2.value)`**:
   - Collects unique values from `co2.value`.

3. **`GROUP_CONCAT(DISTINCT CONCAT(co.value, ' | ', co2.value))`**:
   - Creates a concatenated string for each `Main Tag` and `co2.value` pair, ensuring distinct pairs are included.

This structure allows you to independently analyze the distinct tags from both sources (`Main Tag` and `co2.value`) or combine them into a single field for streamlined output.

---

🙋 **You:**

I don't want a concatenated string, I want it to distinct values from either co.value or co2.vale

---

🤖 **Assistant:**

If you want to get distinct values from either `co.value` or `co2.value` in a single `GROUP_CONCAT`, you can use a `UNION` to combine the two columns, ensuring distinctness across both sources. Here's how to adjust your query:

```sql
SELECT
  documents.id,
  documents.title AS 'Document Title',
  documents.hierarchy_position AS 'Version', 
  CASE documents.status
    WHEN 0 THEN 'Not Started'
    WHEN 1 THEN 'Draft'
    WHEN 2 THEN 'Pending Owner Approval'
    WHEN 3 THEN 'Pending Sponsor Approval'
    WHEN 4 THEN 'Pending Publishment'
    WHEN 5 THEN 'Published'
    WHEN 6 THEN 'Retired'
    WHEN 7 THEN 'Previous Version'
  END AS 'Status',
  documents.document_type AS 'Document Type',
  CONVERT_TZ(publishments.completed_on, 'UTC', 'EST') AS 'Publish Date',
  CONVERT_TZ(documents.updated_at, 'UTC', 'EST') AS 'Updated at Date',
  (SELECT 
      GROUP_CONCAT(DISTINCT value) 
   FROM (
      SELECT co.value AS value
      FROM category_options co
      WHERE co.id = documents.primary_category_option_id
      UNION
      SELECT co2.value AS value
      FROM document_category_options dco
      JOIN category_options co2 ON dco.category_option_id = co2.id
      WHERE dco.document_id = documents.id
   ) AS distinct_values
  ) AS 'All Tags',
  GROUP_CONCAT(DISTINCT p.name) AS 'Profiles',
  IF(SUM(da.id IS NOT NULL), 'Manual User Assignment', NULL) AS 'Distribution'
FROM 
  documents
LEFT JOIN document_relations dr 
  ON dr.document_id = documents.id
  AND dr.relateable_type = 'Profile'
LEFT JOIN publishments 
  ON documents.id = publishments.document_id
LEFT JOIN profiles p 
  ON dr.relateable_id = p.id
LEFT JOIN document_assignments da 
  ON da.document_hierarchy_id = documents.hierarchy_id
  AND da.override
  AND da.deleted_at IS NULL
LEFT JOIN category_options co 
  ON documents.primary_category_option_id = co.id
LEFT JOIN document_category_options dco
  ON dco.document_id = documents.id
LEFT JOIN category_options co2 
  ON dco.category_option_id = co2.id
WHERE 
  documents.company_id = 12
  AND (publishments.completed_on > '2024-01-01' OR documents.updated_at > '2024-01-01')
  AND (co.id = 501 OR dco.category_option_id = 501)
GROUP BY 
  documents.id;
```

### Explanation:
1. **Subquery for Distinct Tags**:
   - A subquery combines `co.value` and `co2.value` into a single dataset using a `UNION`, which removes duplicates.

2. **`GROUP_CONCAT` on Subquery**:
   - The outer query applies `GROUP_CONCAT(DISTINCT)` to the combined result, ensuring no duplicates.

3. **Integration with Main Query**:
   - The subquery runs for each `documents.id` to fetch the distinct values from both `co.value` and `co2.value`.

This approach ensures that the `All Tags` column contains a single, comma-separated list of all distinct values from either `co.value` or `co2.value`.

---

🙋 **You:**

i like that union, I want the group concat to separate by semi-colon instead of comma

---

🤖 **Assistant:**

To change the separator in `GROUP_CONCAT`, you can use the `SEPARATOR` clause. Here's how to modify your query to use a semicolon (`;`) as the separator:

```sql
SELECT
  documents.id,
  documents.title AS 'Document Title',
  documents.hierarchy_position AS 'Version', 
  CASE documents.status
    WHEN 0 THEN 'Not Started'
    WHEN 1 THEN 'Draft'
    WHEN 2 THEN 'Pending Owner Approval'
    WHEN 3 THEN 'Pending Sponsor Approval'
    WHEN 4 THEN 'Pending Publishment'
    WHEN 5 THEN 'Published'
    WHEN 6 THEN 'Retired'
    WHEN 7 THEN 'Previous Version'
  END AS 'Status',
  documents.document_type AS 'Document Type',
  CONVERT_TZ(publishments.completed_on, 'UTC', 'EST') AS 'Publish Date',
  CONVERT_TZ(documents.updated_at, 'UTC', 'EST') AS 'Updated at Date',
  (SELECT 
      GROUP_CONCAT(DISTINCT value SEPARATOR '; ') 
   FROM (
      SELECT co.value AS value
      FROM category_options co
      WHERE co.id = documents.primary_category_option_id
      UNION
      SELECT co2.value AS value
      FROM document_category_options dco
      JOIN category_options co2 ON dco.category_option_id = co2.id
      WHERE dco.document_id = documents.id
   ) AS distinct_values
  ) AS 'All Tags',
  GROUP_CONCAT(DISTINCT p.name SEPARATOR '; ') AS 'Profiles',
  IF(SUM(da.id IS NOT NULL), 'Manual User Assignment', NULL) AS 'Distribution'
FROM 
  documents
LEFT JOIN document_relations dr 
  ON dr.document_id = documents.id
  AND dr.relateable_type = 'Profile'
LEFT JOIN publishments 
  ON documents.id = publishments.document_id
LEFT JOIN profiles p 
  ON dr.relateable_id = p.id
LEFT JOIN document_assignments da 
  ON da.document_hierarchy_id = documents.hierarchy_id
  AND da.override
  AND da.deleted_at IS NULL
LEFT JOIN category_options co 
  ON documents.primary_category_option_id = co.id
LEFT JOIN document_category_options dco
  ON dco.document_id = documents.id
LEFT JOIN category_options co2 
  ON dco.category_option_id = co2.id
WHERE 
  documents.company_id = 12
  AND (publishments.completed_on > '2024-01-01' OR documents.updated_at > '2024-01-01')
  AND (co.id = 501 OR dco.category_option_id = 501)
GROUP BY 
  documents.id;
```

### Key Change:
- **`SEPARATOR '; '`**: Added to the `GROUP_CONCAT` function in both the `All Tags` and `Profiles` fields. This ensures that the concatenated values are separated by a semicolon and a space (`; `) instead of a comma.

Now the output for `All Tags` and `Profiles` will use semicolons as separators for the concatenated values.

---

🙋 **You:**

GROUP_CONCAT(DISTINCT p.name) AS 'Profiles',
  IF(SUM(da.id IS NOT NULL), 'Manual User Assignment', NULL) AS 'Distribution'
I want to show them concatenated

---

🤖 **Assistant:**

To concatenate the results of `GROUP_CONCAT(DISTINCT p.name)` and the result of `IF(SUM(da.id IS NOT NULL), 'Manual User Assignment', NULL)`, you can use the `CONCAT` function in MySQL. Here's how you can modify that part of your query:

```sql
CONCAT(
  GROUP_CONCAT(DISTINCT p.name SEPARATOR '; '),
  IF(SUM(da.id IS NOT NULL), '; Manual User Assignment', '')
) AS 'Profiles and Distribution'
```

### Updated Query Segment:
Here's how the full query looks with the concatenation applied:

```sql
SELECT
  documents.id,
  documents.title AS 'Document Title',
  documents.hierarchy_position AS 'Version', 
  CASE documents.status
    WHEN 0 THEN 'Not Started'
    WHEN 1 THEN 'Draft'
    WHEN 2 THEN 'Pending Owner Approval'
    WHEN 3 THEN 'Pending Sponsor Approval'
    WHEN 4 THEN 'Pending Publishment'
    WHEN 5 THEN 'Published'
    WHEN 6 THEN 'Retired'
    WHEN 7 THEN 'Previous Version'
  END AS 'Status',
  documents.document_type AS 'Document Type',
  CONVERT_TZ(publishments.completed_on, 'UTC', 'EST') AS 'Publish Date',
  CONVERT_TZ(documents.updated_at, 'UTC', 'EST') AS 'Updated at Date',
  (SELECT 
      GROUP_CONCAT(DISTINCT value SEPARATOR '; ') 
   FROM (
      SELECT co.value AS value
      FROM category_options co
      WHERE co.id = documents.primary_category_option_id
      UNION
      SELECT co2.value AS value
      FROM document_category_options dco
      JOIN category_options co2 ON dco.category_option_id = co2.id
      WHERE dco.document_id = documents.id
   ) AS distinct_values
  ) AS 'All Tags',
  CONCAT(
    GROUP_CONCAT(DISTINCT p.name SEPARATOR '; '),
    IF(SUM(da.id IS NOT NULL), '; Manual User Assignment', '')
  ) AS 'Profiles and Distribution'
FROM 
  documents
LEFT JOIN document_relations dr 
  ON dr.document_id = documents.id
  AND dr.relateable_type = 'Profile'
LEFT JOIN publishments 
  ON documents.id = publishments.document_id
LEFT JOIN profiles p 
  ON dr.relateable_id = p.id
LEFT JOIN document_assignments da 
  ON da.document_hierarchy_id = documents.hierarchy_id
  AND da.override
  AND da.deleted_at IS NULL
LEFT JOIN category_options co 
  ON documents.primary_category_option_id = co.id
LEFT JOIN document_category_options dco
  ON dco.document_id = documents.id
LEFT JOIN category_options co2 
  ON dco.category_option_id = co2.id
WHERE 
  documents.company_id = 12
  AND (publishments.completed_on > '2024-01-01' OR documents.updated_at > '2024-01-01')
  AND (co.id = 501 OR dco.category_option_id = 501)
GROUP BY 
  documents.id;
```

### Key Changes:
1. **`GROUP_CONCAT(DISTINCT p.name SEPARATOR '; ')`**:
   - Ensures distinct profile names are concatenated with a semicolon separator.

2. **`IF(SUM(da.id IS NOT NULL), '; Manual User Assignment', '')`**:
   - Appends `Manual User Assignment` only if the condition is met, preceded by a semicolon.

3. **`CONCAT`**:
   - Combines the results of `GROUP_CONCAT` and the conditional `IF` into a single string.

The result will be a semicolon-separated list of profile names, optionally followed by `Manual User Assignment` if the condition is satisfied.
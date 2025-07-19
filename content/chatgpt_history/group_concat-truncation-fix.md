---
title: GROUP_CONCAT Truncation Fix
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# GROUP_CONCAT Truncation Fix

## ✅ TODOs


## 📌 Summary
select

## 🧠 Full Chat


select
  documents.title 'Document Title',
  documents.hierarchy_position 'Version', 
  CASE documents.status
	WHEN 0 THEN
		'Not Started'
	WHEN 1 THEN
		'Draft'
	WHEN 2 THEN
		'Pending Owner Approval'
	WHEN 3 THEN
		'Pending Sponsor Approval'
	WHEN 4 THEN
		'Pending Publishment'
	WHEN 5 THEN
		'Published'
	WHEN 6 THEN
		'Retired'
	WHEN 7 THEN
		'Previous Version'
	END AS 'Status',
  documents.document_type,
  CONVERT_TZ(publishments.completed_on, 'UTC', 'EST') AS 'Publish Date',
  co.value,
  CONCAT_WS(',', IF(documents.status = 5, GROUP_CONCAT(DISTINCT (p.name)), NULL), IF(GROUP_CONCAT(da.id), 'Manual User Assignment', NULL)) AS 'Distribution'
# Document Title, Version, Status, Document Type, Published Date, Tags, Distribution
from documents
	LEFT JOIN document_relations dr ON dr.document_id = documents.id
		AND dr.relateable_type = 'Profile'
	LEFT JOIN publishments ON documents.id = publishments.document_id
	LEFT JOIN profiles p ON dr.relateable_id = p.id
	LEFT JOIN document_assignments da ON da.document_hierarchy_id = documents.hierarchy_id
		AND da.override
		AND da.deleted_at IS NULL
	LEFT JOIN category_options co ON documents.primary_category_option_id = co.id
where documents.company_id = 12
and publishments.completed_on > '2024-01-01';
and category_options.name = 'health and safety';

why is my query returning
Row 147 was cut by GROUP_CONCAT()
Truncated incorrect DOUBLE value: '389653,389668,389683,389698,389713,389728,389743,389758,389803,389818,389833,389848,389863,389878,389908,389923,389938,389953,38'
Row 147 was cut by GROUP_CONCAT()
Truncated incorrect DOUBLE value: '389653,389668,389683,389698,389713,389728,389743,389758,389803,389818,389833,389848,389863,389878,389908,389923,389938,389953,38'
Row 147 was cut by GROUP_CONCAT()
Row 43 was cut by GROUP_CONCAT()
Truncated incorrect DOUBLE value: '389656,389671,389686,389701,389716,389731,389746,389761,389791,389806,389821,389836,389851,389866,389881,389896,389911,389926,38'
Row 147 was cut by GROUP_CONCAT()
Row 43 was cut by GROUP_CONCAT()
Truncated incorrect DOUBLE value: '389656,389671,389686,389701,389716,389731,389746,389761,389791,389806,389821,389836,389851,389866,389881,389896,389911,389926,38'

What am I doing wrong? Can you simplify it?



The errors you're encountering are likely due to the **`GROUP_CONCAT`** function being truncated because it exceeds the maximum allowed length. By default, MySQL limits the `GROUP_CONCAT` result size to 1024 characters. Additionally, you have some syntax issues (e.g., a misplaced semicolon in the `WHERE` clause) and unnecessary complexity in the query.

### Simplified Query with Fixes
Below is a cleaned-up and simplified version of your query:

```sql
SELECT 
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
  co.value AS 'Category Option',
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
WHERE 
  documents.company_id = 12
  AND publishments.completed_on > '2024-01-01'
  AND co.name = 'health and safety'
GROUP BY 
  documents.id, documents.title, documents.hierarchy_position, 
  documents.status, documents.document_type, publishments.completed_on, co.value;
```

### Key Changes and Fixes
1. **Fixed Syntax Issue:**
   - Removed the misplaced semicolon in the `WHERE` clause.

2. **Simplified `GROUP_CONCAT`:**
   - Used `GROUP_CONCAT(DISTINCT p.name)` to ensure uniqueness in the concatenated values.
   - Added an explicit check for `da.id` to indicate "Manual User Assignment."

3. **Handled `GROUP_CONCAT` Truncation:**
   - You can increase the `GROUP_CONCAT` maximum length if needed:
     ```sql
     SET SESSION group_concat_max_len = 10000;
     ```
     Add this at the beginning of your session or adjust the limit as needed.

4. **Optimized `IF` Logic:**
   - Simplified the conditional for "Manual User Assignment" using `SUM(da.id IS NOT NULL)`.

5. **Improved Grouping:**
   - Ensured correct grouping by grouping all non-aggregated columns (`GROUP BY documents.id, ...`).

### Explanation of Errors
1. **`GROUP_CONCAT()` Truncation:**
   - This happens when the concatenated result exceeds the default length of 1024 characters. Increasing `group_concat_max_len` will prevent truncation.

2. **`Truncated incorrect DOUBLE value`:**
   - Likely caused by trying to concatenate numeric values (e.g., IDs) without explicitly converting them into a string or by complex expressions within `GROUP_CONCAT`.

### Next Steps
1. Run the simplified query.
2. If truncation persists, increase `group_concat_max_len` as suggested.
3. Let me know if further adjustments are needed!
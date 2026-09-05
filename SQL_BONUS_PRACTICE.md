# Optional MySQL Practice - phpMyAdmin

These tasks do not break the website. Open phpMyAdmin -> `tarot_full_deck` -> SQL and complete them if your group has time.

## SQL 1 - Show all cards
Fill:
```sql
SELECT * FROM _____;
```
Example:
```sql
SELECT * FROM students;
```
Answer table name is the table that stores the 78 tarot cards.

## SQL 2 - Show only Major Arcana
Fill:
```sql
SELECT * FROM cards WHERE arcana = '____________';
```
Example:
```sql
SELECT * FROM students WHERE class = '8A';
```

## SQL 3 - Show only Cups
Fill:
```sql
SELECT * FROM cards WHERE suit = '____';
```
Example:
```sql
SELECT * FROM products WHERE type = 'Food';
```

## SQL 4 - Count all cards
Fill:
```sql
SELECT COUNT(*) FROM _____;
```
Example:
```sql
SELECT COUNT(*) FROM students;
```
Expected result: 78.

## SQL 5 - Count all personality questions
Fill:
```sql
SELECT COUNT(*) FROM _________;
```
Example:
```sql
SELECT COUNT(*) FROM products;
```
Expected result: 78.

## SQL 6 - Show the newest reading first
Fill:
```sql
SELECT * FROM readings ORDER BY created_at ____;
```
Example:
```sql
SELECT * FROM scores ORDER BY score DESC;
```
Hint: newest first uses `DESC`.

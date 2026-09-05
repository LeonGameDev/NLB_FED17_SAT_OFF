# Tarot Project - 90 Minute Beginner Team Tasks

You have **36 core tasks**. If your group finishes early, continue with **6 code bonus tasks** and the separate SQL bonus sheet.

## How to work

For every task:
1. Find the task number in the file.
2. Look at the example below.
3. Fill only the blank.
4. Do not change the other code.

You do **not** need to memorize Flask, JavaScript, or SQL. The examples are there to help you copy the pattern.

---

# PART A - HTML AND CSS

## TASK 1 - Home route
File: `templates/base.html`

Fill:
```html
url_for('________')
```
Example:
```html
url_for('home')
```
Hint: the Flask function for the first page is named `index`.

## TASK 2 - Card library route
File: `templates/base.html`

Fill:
```html
url_for('________')
```
Example:
```html
url_for('about')
```
Hint: the Flask function that shows all 78 cards is named `cards`.

## TASK 3 - Form method
File: `templates/profile.html`

Fill:
```html
method="____"
```
Example:
```html
method="POST"
```
Hint: this form sends information to Flask.

## TASK 4 - Name input
File: `templates/profile.html`

Fill:
```html
name="________"
```
Example:
```html
name="username"
```
Hint: Flask later uses `request.form.get("name")`.

## TASK 5 - Mood select
File: `templates/profile.html`

Fill:
```html
<select name="____________">
```
Example:
```html
<select name="favorite_color">
```
Hint: Flask calls this value `current_mood`.

## TASK 6 - Focus select
File: `templates/profile.html`

Fill:
```html
<select name="_____________">
```
Example:
```html
<select name="school_subject">
```
Hint: Flask calls this value `current_focus`.

## TASK 7 - Submit button
File: `templates/profile.html`

Fill:
```html
type="______"
```
Example:
```html
type="submit"
```

## TASK 8 - Show a question from MySQL
File: `templates/quiz.html`

Fill:
```html
{{ _______________ }}
```
Example:
```html
{{ student.name }}
```
Hint: the current question is `q` and the database field is `question_text`.

## TASK 9 - Store the option ID in the button
File: `templates/quiz.html`

Fill:
```html
{{ _________ }}
```
Example:
```html
{{ product.id }}
```
Hint: the current answer object is named `option`.

## TASK 10 - Show option text
File: `templates/quiz.html`

Fill:
```html
{{ __________________ }}
```
Example:
```html
{{ product.name }}
```
Hint: the database field is `option_text`.

## TASK 11 - Hide questions that are not active
File: `static/style.css`

Fill:
```css
display: ______;
```
Example:
```css
display: none;
```

## TASK 12 - Full-width button
File: `static/style.css`

Fill:
```css
width: ____;
```
Example:
```css
width: 100%;
```

---

# PART B - FLASK AND MYSQL

## TASK 13 - Number of questions in one reading
File: `app.py`

Fill:
```python
QUESTIONS_PER_READING = __
```
Example:
```python
ITEMS_PER_PAGE = 5
```
Hint: this project should show **10** random questions each reading.

## TASK 14 - Database name
File: `app.py`

Fill:
```python
"database": "________________"
```
Example:
```python
"database": "school_db"
```
Hint: check the first lines of `database.sql`.

## TASK 15 - Open the MySQL connection
File: `app.py`

Fill:
```python
return __________________________
```
Example:
```python
return pymysql.connect(**MY_CONFIG)
```
Hint: this project calls its settings `DB_CONFIG`.

## TASK 16 - First HTML page
File: `app.py`

Fill:
```python
render_template("__________")
```
Example:
```python
render_template("home.html")
```
Hint: the first template is `index.html`.

## TASK 17 - Allow the profile form to send data
File: `app.py`

Fill:
```python
methods=["GET", "____"]
```
Example:
```python
methods=["GET", "POST"]
```

## TASK 18 - Read the name from the HTML form
File: `app.py`

Fill:
```python
request.form.get("____", "")
```
Example:
```python
request.form.get("username", "")
```
Hint: look at the `name="..."` used in TASK 4.

## TASK 19 - Read the birthday
File: `app.py`

Fill:
```python
request.form.get("__________", "")
```
Example:
```python
request.form.get("email", "")
```
Hint: the HTML input uses `birth_date`.

## TASK 20 - Save the profile to the correct table
File: `app.py`

Fill:
```sql
INSERT INTO ________
```
Example:
```sql
INSERT INTO students
```
Hint: open `database.sql` and find the table containing `name`, `birth_date`, and `zodiac_sign`.

## TASK 21 - Save the profile ID in the Flask session
File: `app.py`

Fill:
```python
session["__________"] = profile_id
```
Example:
```python
session["user_id"] = user_id
```
Hint: later Flask checks for `profile_id`.

## TASK 22 - Go to the quiz after saving the profile
File: `app.py`

Fill:
```python
url_for("____")
```
Example:
```python
url_for("home")
```
Hint: the page function is named `quiz`.

## TASK 23 - Randomize MySQL questions
File: `app.py`

Fill:
```sql
ORDER BY ______()
```
Example:
```sql
ORDER BY RAND()
```
Hint: MySQL uses `RAND()` for random order.

## TASK 24 - Get all answer choices from MySQL
File: `app.py`

Fill:
```python
question["options"] = ____________
```
Example:
```python
students = cur.fetchall()
```
Hint: we also want all returned rows here.

---

# PART C - JAVASCRIPT AND RESULT DISPLAY

## TASK 25 - Find the quiz area
File: `static/script.js`

Fill:
```javascript
document.getElementById('_______')
```
Example:
```javascript
document.getElementById('menu')
```
Hint: the HTML section uses `id="quizApp"`.

## TASK 26 - Find all question cards
File: `static/script.js`

Fill:
```javascript
querySelectorAll('______________')
```
Example:
```javascript
querySelectorAll('.item')
```
Hint: each question has class `question-card`.

## TASK 27 - Start the answer list empty
File: `static/script.js`

Fill:
```javascript
.fill(____)
```
Example:
```javascript
new Array(5).fill(null)
```

## TASK 28 - Start at question zero
File: `static/script.js`

Fill:
```javascript
let current = _;
```
Example:
```javascript
let score = 0;
```

## TASK 29 - Hide inactive questions
File: `static/script.js`

Fill:
```javascript
classList.toggle('______', ...)
```
Example:
```javascript
classList.toggle('active', condition)
```
Hint: TASK 11 created the CSS class `hidden`.

## TASK 30 - Change the question number text
File: `static/script.js`

Fill:
```javascript
number.___________ = String(current + 1);
```
Example:
```javascript
title.textContent = 'Hello';
```

## TASK 31 - Send answers to Flask
File: `static/script.js`

Fill:
```javascript
fetch('_______', {
```
Example:
```javascript
fetch('/save', {
```
Hint: the Flask route is `/reveal`.

## TASK 32 - HTTP method
File: `static/script.js`

Fill:
```javascript
method: '____'
```
Example:
```javascript
method: 'POST'
```

## TASK 33 - Name the answer data
File: `static/script.js`

Fill:
```javascript
JSON.stringify({__________: answerIds})
```
Example:
```javascript
JSON.stringify({scores: scores})
```
Hint: Flask expects the key `answer_ids`.

## TASK 34 - Convert Flask's response to JSON
File: `static/script.js`

Fill:
```javascript
await response.____()
```
Example:
```javascript
await response.json()
```

## TASK 35 - Open the result page
File: `static/script.js`

Fill:
```javascript
window.location.____ = data.redirect;
```
Example:
```javascript
window.location.href = "/home";
```

## TASK 36 - Show the chosen tarot card name
File: `templates/result.html`

Fill:
```html
{{ __________________ }}
```
Example:
```html
{{ student.name }}
```
Hint: the object is `reading` and the field is `card_name`.

---

# OPTIONAL CODE BONUS

## BONUS 37 - Loop through reading history
File: `templates/history.html`

Fill:
```html
{% for r in ________ %}
```
Example:
```html
{% for student in students %}
```

## BONUS 38 - Loop through the card deck
File: `templates/cards.html`

Fill:
```html
{% for card in ____ %}
```
Example:
```html
{% for item in items %}
```

## BONUS 39 - Load every card from MySQL
File: `app.py`

Fill:
```sql
SELECT * FROM _____
```
Example:
```sql
SELECT * FROM students
```

## BONUS 40 - Read JSON sent by JavaScript
File: `app.py`

Fill:
```python
request.get_____(silent=True)
```
Example:
```python
request.get_json(silent=True)
```

## BONUS 41 - Listen for the Back button
File: `static/script.js`

Fill:
```javascript
addEventListener('_____', ...)
```
Example:
```javascript
addEventListener('click', ...)
```

## BONUS 42 - Move back one question
File: `static/script.js`

Fill:
```javascript
current __= 1;
```
Example:
```javascript
score -= 1;
```

---

# Final test

When the 36 core tasks are correct:
1. Open the homepage.
2. Enter a profile.
3. Answer 10 random questions.
4. Reveal a card.
5. Open History.
6. Start another reading and check that the questions change.
7. Open All Cards and confirm the database displays the full deck.

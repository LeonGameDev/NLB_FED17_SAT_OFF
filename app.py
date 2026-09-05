from flask import Flask, render_template, request, redirect, url_for, session, jsonify
import json
import random
from collections import Counter
from datetime import datetime

import pymysql

app = Flask(__name__)
app.secret_key = "change-this-before-deploying"

DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "",
    "database": "________________",  # TASK 14 | Example: "database": "school_db",
    "cursorclass": pymysql.cursors.DictCursor,
    "autocommit": True,
}

QUESTIONS_PER_READING = __  # TASK 13 | Example: ITEMS_PER_PAGE = 5


def get_db():
    return __________________________  # TASK 15 | Example: pymysql.connect(**MY_CONFIG)


def zodiac_from_date(date_string):
    if not date_string:
        return "Unknown"
    d = datetime.strptime(date_string, "%Y-%m-%d")
    month, day = d.month, d.day
    starts = [
        ((1, 20), "Aquarius"), ((2, 19), "Pisces"), ((3, 21), "Aries"),
        ((4, 20), "Taurus"), ((5, 21), "Gemini"), ((6, 21), "Cancer"),
        ((7, 23), "Leo"), ((8, 23), "Virgo"), ((9, 23), "Libra"),
        ((10, 23), "Scorpio"), ((11, 22), "Sagittarius"), ((12, 22), "Capricorn"),
    ]
    for (m, start), sign in reversed(starts):
        if month > m or (month == m and day >= start):
            return sign
    return "Capricorn"


def load_random_questions():
    """Load random questions AND randomize the answer order for every reading."""
    with get_db() as db:
        with db.cursor() as cur:
            cur.execute(
                "SELECT id, question_text FROM questions ORDER BY ______() LIMIT %s  # TASK 23 | Example SQL: ORDER BY RAND()",
                (QUESTIONS_PER_READING,),
            )
            questions = cur.fetchall()

            for question in questions:
                cur.execute(
                    """SELECT id, option_text, trait
                       FROM question_options
                       WHERE question_id = %s
                       ORDER BY RAND()""",
                    (question["id"],),
                )
                question["options"] = ____________  # TASK 24 | Example: students = cur.fetchall()
    return questions


def choose_card(trait_scores):
    """Match answer traits against the 78 cards stored in MySQL."""
    if not trait_scores:
        return None

    with get_db() as db:
        with db.cursor() as cur:
            cur.execute("SELECT * FROM _____")  # BONUS 39 | Example SQL: SELECT * FROM students
            cards = cur.fetchall()

    best_score = -1
    best_cards = []

    for card in cards:
        card_traits = [t.strip() for t in card["traits"].split(",") if t.strip()]
        score = sum(trait_scores.get(trait, 0) for trait in card_traits)

        if score > best_score:
            best_score = score
            best_cards = [card]
        elif score == best_score:
            best_cards.append(card)

    return random.choice(best_cards)


@app.route("/")
def index():
    return render_template("__________")  # TASK 16 | Example: render_template("home.html")


@app.route("/begin", methods=["GET", "____"])  # TASK 17 | Example: methods=["GET", "POST"]
def begin():
    if request.method == "POST":
        name = request.form.get("____", "").strip()[:50]  # TASK 18 | Example: request.form.get("username", "")
        birth_date = request.form.get("__________", "")  # TASK 19 | Example: request.form.get("email", "")
        current_mood = request.form.get("current_mood", "Curious")[:30]
        current_focus = request.form.get("current_focus", "Future")[:30]

        if not name:
            return render_template("profile.html", error="Please enter a name or nickname.")

        zodiac = zodiac_from_date(birth_date) if birth_date else "Unknown"

        with get_db() as db:
            with db.cursor() as cur:
                cur.execute(
                    """INSERT INTO ________
                       (name, birth_date, zodiac_sign, current_mood, current_focus)  # TASK 20 | Example SQL: INSERT INTO students (...)
                       VALUES (%s, %s, %s, %s, %s)""",
                    (name, birth_date or None, zodiac, current_mood, current_focus),
                )
                profile_id = cur.lastrowid

        session.clear()
        session["__________"] = profile_id  # TASK 21 | Example: session["user_id"] = user_id
        session["profile_name"] = name
        return redirect(url_for("____"))  # TASK 22 | Example: redirect(url_for("home"))

    return render_template("profile.html")


@app.route("/quiz")
def quiz():
    if "profile_id" not in session:
        return redirect(url_for("begin"))

    questions = load_random_questions()
    session["question_ids"] = [q["id"] for q in questions]

    return render_template(
        "quiz.html",
        questions=questions,
        name=session.get("profile_name", "Seeker"),
    )


@app.route("/reveal", methods=["POST"])
def reveal():
    if "profile_id" not in session:
        return jsonify({"error": "Session expired. Start a new reading."}), 401

    data = request.get_____(silent=True) or {}  # BONUS 40 | Example: request.get_json(...)
    answer_ids = data.get("answer_ids", [])
    expected_question_ids = session.get("question_ids", [])

    if len(answer_ids) != len(expected_question_ids):
        return jsonify({"error": "Please answer every question."}), 400

    # Get each chosen option and verify that it belongs to one of this reading's questions.
    placeholders = ",".join(["%s"] * len(answer_ids))
    with get_db() as db:
        with db.cursor() as cur:
            cur.execute(
                f"""SELECT qo.id, qo.question_id, qo.option_text, qo.trait
                    FROM question_options qo
                    WHERE qo.id IN ({placeholders})""",
                tuple(answer_ids),
            )
            chosen_options = cur.fetchall()

    if len(chosen_options) != len(answer_ids):
        return jsonify({"error": "One answer was invalid."}), 400

    selected_question_ids = {row["question_id"] for row in chosen_options}
    if selected_question_ids != set(expected_question_ids):
        return jsonify({"error": "The answers do not match this reading."}), 400

    trait_scores = Counter(row["trait"] for row in chosen_options)
    chosen_card = choose_card(trait_scores)
    if not chosen_card:
        return jsonify({"error": "Could not choose a card."}), 500

    with get_db() as db:
        with db.cursor() as cur:
            cur.execute(
                """INSERT INTO readings
                   (profile_id, card_id, traits_json, question_ids_json, answer_ids_json)
                   VALUES (%s, %s, %s, %s, %s)""",
                (
                    session["profile_id"],
                    chosen_card["id"],
                    json.dumps(dict(trait_scores)),
                    json.dumps(expected_question_ids),
                    json.dumps(answer_ids),
                ),
            )
            reading_id = cur.lastrowid

    return jsonify({"redirect": url_for("result", reading_id=reading_id)})


@app.route("/result/<int:reading_id>")
def result(reading_id):
    with get_db() as db:
        with db.cursor() as cur:
            cur.execute(
                """SELECT r.id AS reading_id, r.created_at,
                          p.name AS profile_name, p.zodiac_sign, p.current_mood, p.current_focus,
                          c.id AS card_id, c.name AS card_name, c.arcana, c.suit, c.rank_name,
                          c.keywords, c.meaning, c.advice, c.traits
                   FROM readings r
                   JOIN profiles p ON p.id = r.profile_id
                   JOIN cards c ON c.id = r.card_id
                   WHERE r.id = %s""",
                (reading_id,),
            )
            reading = cur.fetchone()

    if not reading:
        return "Reading not found", 404

    return render_template("result.html", reading=reading)


@app.route("/history")
def history():
    profile_id = session.get("profile_id")
    if not profile_id:
        return redirect(url_for("begin"))

    with get_db() as db:
        with db.cursor() as cur:
            cur.execute(
                """SELECT r.id, r.created_at, c.name AS card_name, c.arcana, c.suit
                   FROM readings r
                   JOIN cards c ON c.id = r.card_id
                   WHERE r.profile_id = %s
                   ORDER BY r.created_at DESC""",
                (profile_id,),
            )
            readings = cur.fetchall()

    return render_template(
        "history.html",
        readings=readings,
        name=session.get("profile_name", "Seeker"),
    )


@app.route("/cards")
def cards():
    """A database-driven card library so students can see all 78 records."""
    with get_db() as db:
        with db.cursor() as cur:
            cur.execute(
                """SELECT id, name, arcana, suit, rank_name, keywords
                   FROM cards
                   ORDER BY id"""
            )
            deck = cur.fetchall()
    return render_template("cards.html", deck=deck)


@app.route("/restart")
def restart():
    session.clear()
    return redirect(url_for("begin"))


if __name__ == "__main__":
    app.run(debug=True)

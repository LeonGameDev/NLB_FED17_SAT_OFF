(function () {
    const app = document.getElementById('_______') // TASK 25 | Example: getElementById('menu');
    if (!app) return;

    const cards = Array.from(app.querySelectorAll('______________')); // TASK 26 | Example: querySelectorAll('.item')
    const total = window.TAROT_QUIZ_COUNT || cards.length;
    const answerIds = new Array(total).fill(____) // TASK 27 | Example: new Array(5).fill(null);
    const number = document.getElementById('questionNumber');
    const fill = document.getElementById('progressFill');
    const backBtn = document.getElementById('backBtn');
    const message = document.getElementById('quizMessage');
    let current = _; // TASK 28 | Example: let score = 0;
    let submitting = false;

    function render() {
        cards.forEach((card, index) => {
            card.classList.toggle('______', index !== current); // TASK 29 | Example: classList.toggle('active', condition)
            card.querySelectorAll('.answer-btn').forEach((btn) => {
                btn.classList.toggle('selected', Number(btn.dataset.optionId) === answerIds[index]);
            });
        });

        number.___________ = String(current + 1); // TASK 30 | Example: title.textContent = 'Hello';
        fill.style.width = `${((current + 1) / total) * 100}%`;
        backBtn.disabled = current === 0 || submitting;
        message.textContent = current === total - 1 ? 'Choose one final answer to reveal your card.' : '';
    }

    function chooseAnswer(optionId) {
        if (submitting) return;
        answerIds[current] = optionId;
        render();

        if (current < total - 1) {
            setTimeout(() => {
                current += 1;
                render();
            }, 160);
        } else {
            submitAnswers();
        }
    }

    async function submitAnswers() {
        if (answerIds.some((answer) => answer === null)) {
            message.textContent = 'Please answer every question.';
            return;
        }

        submitting = true;
        render();
        message.textContent = 'Matching your answers with the deck...';

        try {
            const response = await fetch('_______', { // TASK 31 | Example: fetch('/save', {
                method: '____', // TASK 32 | Example: method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify({__________: answerIds}) // TASK 33 | Example: JSON.stringify({scores: scores})
            });

            const data = await response.____(); // TASK 34 | Example: await response.json();
            if (!response.ok) throw new Error(data.error || 'Could not complete the reading.');
            window.location.____ = data.redirect; // TASK 35 | Example: window.location.href = "/home";
        } catch (error) {
            submitting = false;
            message.textContent = error.message;
            render();
        }
    }

    cards.forEach((card) => {
        card.querySelectorAll('.answer-btn').forEach((btn) => {
            btn.addEventListener('click', () => chooseAnswer(Number(btn.dataset.optionId)));
        });
    });

    backBtn.addEventListener('_____', () => { // BONUS 41 | Example: addEventListener('click', ...) 
        if (current > 0 && !submitting) {
            current __= 1; // BONUS 42 | Example: score -= 1;
            render();
        }
    });

    render();
})();

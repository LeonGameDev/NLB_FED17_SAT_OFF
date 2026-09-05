CREATE DATABASE IF NOT EXISTS tarot_full_deck CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE tarot_full_deck;
DROP TABLE IF EXISTS readings;
DROP TABLE IF EXISTS question_options;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS profiles;
DROP TABLE IF EXISTS cards;
CREATE TABLE cards (
    id INT PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    arcana VARCHAR(30) NOT NULL,
    suit VARCHAR(20) NULL,
    rank_name VARCHAR(30) NOT NULL,
    keywords VARCHAR(255) NOT NULL,
    meaning TEXT NOT NULL,
    advice TEXT NOT NULL,
    traits VARCHAR(255) NOT NULL
);

CREATE TABLE profiles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    birth_date DATE NULL,
    zodiac_sign VARCHAR(30) NOT NULL,
    current_mood VARCHAR(30) NOT NULL,
    current_focus VARCHAR(30) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question_text VARCHAR(255) NOT NULL
);

CREATE TABLE question_options (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question_id INT NOT NULL,
    option_text VARCHAR(255) NOT NULL,
    trait VARCHAR(30) NOT NULL,
    CONSTRAINT fk_option_question FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);

CREATE TABLE readings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT NOT NULL,
    card_id INT NOT NULL,
    traits_json TEXT NOT NULL,
    question_ids_json TEXT NOT NULL,
    answer_ids_json TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_reading_profile FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE,
    CONSTRAINT fk_reading_card FOREIGN KEY (card_id) REFERENCES cards(id)
);

INSERT INTO cards (id, name, arcana, suit, rank_name, keywords, meaning, advice, traits) VALUES
(1, 'The Fool', 'Major Arcana', NULL, '0', 'new beginnings, freedom, curiosity', 'A fresh start is taking shape. This card points to openness, experimentation, and the courage to begin before every detail is known.', 'Stay curious, but give your next step enough thought to keep it useful.', 'adventure,freedom,curiosity'),
(2, 'The Magician', 'Major Arcana', NULL, '1', 'skill, action, confidence', 'You have useful tools, ideas, or abilities available now. Progress comes from using them deliberately rather than waiting for perfect conditions.', 'Choose one clear goal and turn what you already know into action.', 'action,confidence,focus'),
(3, 'The High Priestess', 'Major Arcana', NULL, '2', 'intuition, reflection, mystery', 'Quiet observation matters. You may understand more than you can immediately explain, especially when you give yourself space to notice patterns.', 'Listen to your instincts, then check important choices against facts.', 'intuition,reflection,imagination'),
(4, 'The Empress', 'Major Arcana', NULL, '3', 'creativity, care, growth', 'Creative and supportive energy is strong. This card is associated with building, nurturing, comfort, and helping ideas or relationships develop.', 'Create something, care for something, and remember to leave energy for yourself too.', 'creativity,care,growth'),
(5, 'The Emperor', 'Major Arcana', NULL, '4', 'structure, leadership, stability', 'Order and responsibility are important now. Clear boundaries and practical planning can make a complicated situation easier to handle.', 'Build a simple plan and decide what you are responsible for.', 'leadership,stability,focus'),
(6, 'The Hierophant', 'Major Arcana', NULL, '5', 'learning, tradition, guidance', 'Learning from established knowledge, teachers, or communities may be useful. Not every answer has to be invented from zero.', 'Use proven advice, but understand why it works before following it blindly.', 'learning,community,reflection'),
(7, 'The Lovers', 'Major Arcana', NULL, '6', 'choice, connection, values', 'A meaningful choice may depend on your values and relationships. This card is about alignment, trust, and deciding what matters most.', 'Choose in a way that matches both your values and the people you respect.', 'connection,care,choice'),
(8, 'The Chariot', 'Major Arcana', NULL, '7', 'drive, direction, determination', 'Momentum is possible when your attention is pointed in one direction. Competing priorities need to be managed rather than allowed to pull you apart.', 'Pick a direction and move consistently instead of changing goals every day.', 'action,confidence,leadership'),
(9, 'Strength', 'Major Arcana', NULL, '8', 'courage, patience, self-control', 'Real strength is not only force. It can also be patience, self-control, kindness, and the ability to stay steady under pressure.', 'Use calm confidence before using pressure or speed.', 'confidence,care,stability'),
(10, 'The Hermit', 'Major Arcana', NULL, '9', 'solitude, wisdom, focus', 'Time alone can help you think clearly. This card favors careful learning, independence, and stepping away from noise long enough to understand yourself.', 'Protect quiet time, but keep contact with people who support you.', 'reflection,learning,focus'),
(11, 'Wheel of Fortune', 'Major Arcana', NULL, '10', 'change, cycles, opportunity', 'Conditions are changing. Some parts of life are outside your control, but you can still decide how prepared and flexible you will be.', 'Notice what is changing and adapt instead of expecting everything to stay the same.', 'change,adventure,growth'),
(12, 'Justice', 'Major Arcana', NULL, '11', 'fairness, truth, responsibility', 'Choices have consequences, and clear thinking matters. This card asks for honesty, balance, and willingness to accept responsibility.', 'Separate facts from assumptions before deciding what is fair.', 'logic,choice,stability'),
(13, 'The Hanged Man', 'Major Arcana', NULL, '12', 'pause, perspective, patience', 'A pause may be useful rather than frustrating. Looking at the same problem from another angle can reveal an option you were missing.', 'Do not rush the answer. Change perspective before changing direction.', 'reflection,patience,imagination'),
(14, 'Death', 'Major Arcana', NULL, '13', 'ending, transformation, renewal', 'Something may be ready to end so that something different can begin. This card represents transition rather than literal death.', 'Let go of what is clearly finished and focus on what the change makes possible.', 'change,growth,courage'),
(15, 'Temperance', 'Major Arcana', NULL, '14', 'balance, moderation, harmony', 'Progress may come from combining different needs instead of choosing an extreme. Patience and steady adjustment are useful.', 'Aim for a sustainable middle ground rather than an all-or-nothing solution.', 'balance,patience,care'),
(16, 'The Devil', 'Major Arcana', NULL, '15', 'attachment, temptation, limits', 'A habit, fear, or desire may have more influence than you want to admit. Seeing the pattern clearly is the first step toward changing it.', 'Ask what you are choosing freely and what you are repeating automatically.', 'choice,courage,reflection'),
(17, 'The Tower', 'Major Arcana', NULL, '16', 'disruption, truth, sudden change', 'A surprising change can expose what was unstable. Although uncomfortable, clear truth can make rebuilding more realistic.', 'Deal with what is actually happening, then rebuild one practical part at a time.', 'change,courage,logic'),
(18, 'The Star', 'Major Arcana', NULL, '17', 'hope, purpose, inspiration', 'Hope and direction return when you reconnect with what genuinely matters to you. Small progress can restore confidence.', 'Keep the larger goal, but give it one small action you can complete now.', 'hope,creativity,growth'),
(19, 'The Moon', 'Major Arcana', NULL, '18', 'imagination, uncertainty, emotion', 'Not everything is clear yet. Strong feelings and imagination can create possibilities, but also confusion if assumptions are treated like facts.', 'Name what you know, what you feel, and what you are only guessing.', 'imagination,intuition,reflection'),
(20, 'The Sun', 'Major Arcana', NULL, '19', 'joy, openness, energy', 'Confidence and openness are highlighted. Shared success, honest expression, and positive energy can make progress easier.', 'Enjoy what is going well and use that energy to handle what still needs work.', 'joy,confidence,connection'),
(21, 'Judgement', 'Major Arcana', NULL, '20', 'reflection, decision, renewal', 'A clear evaluation can help you move forward. This card points to learning from the past without being trapped by it.', 'Review what happened, keep the lesson, and make a deliberate next decision.', 'reflection,choice,growth'),
(22, 'The World', 'Major Arcana', NULL, '21', 'completion, achievement, integration', 'A cycle is reaching completion. Skills, lessons, or experiences that once felt separate may now fit together more clearly.', 'Recognize what you have completed before immediately chasing the next thing.', 'achievement,growth,stability'),
(23, 'Ace of Wands', 'Minor Arcana', 'Wands', 'Ace', 'beginning, potential, energy, creativity, ambition', 'A new possibility is available. Your energy wants movement, experimentation, and visible progress.', 'Direct your enthusiasm toward one useful challenge. Let the ace theme guide how strongly you act on it.', 'action,creativity,adventure'),
(24, 'Two of Wands', 'Minor Arcana', 'Wands', 'Two', 'balance, choice, energy, creativity, ambition', 'Two priorities or directions need attention. Your energy wants movement, experimentation, and visible progress.', 'Direct your enthusiasm toward one useful challenge. Let the two theme guide how strongly you act on it.', 'action,creativity,adventure'),
(25, 'Three of Wands', 'Minor Arcana', 'Wands', 'Three', 'development, teamwork, energy, creativity, ambition', 'Progress grows through practice or cooperation. Your energy wants movement, experimentation, and visible progress.', 'Direct your enthusiasm toward one useful challenge. Let the three theme guide how strongly you act on it.', 'action,creativity,adventure'),
(26, 'Four of Wands', 'Minor Arcana', 'Wands', 'Four', 'stability, protection, energy, creativity, ambition', 'Holding a stable position can help, but too much control can limit growth. Your energy wants movement, experimentation, and visible progress.', 'Direct your enthusiasm toward one useful challenge. Let the four theme guide how strongly you act on it.', 'action,creativity,adventure'),
(27, 'Five of Wands', 'Minor Arcana', 'Wands', 'Five', 'challenge, adjustment, energy, creativity, ambition', 'A difficulty asks you to adapt rather than give up. Your energy wants movement, experimentation, and visible progress.', 'Direct your enthusiasm toward one useful challenge. Let the five theme guide how strongly you act on it.', 'action,creativity,adventure'),
(28, 'Six of Wands', 'Minor Arcana', 'Wands', 'Six', 'progress, support, energy, creativity, ambition', 'Movement becomes easier when support and perspective improve. Your energy wants movement, experimentation, and visible progress.', 'Direct your enthusiasm toward one useful challenge. Let the six theme guide how strongly you act on it.', 'action,creativity,adventure'),
(29, 'Seven of Wands', 'Minor Arcana', 'Wands', 'Seven', 'assessment, strategy, energy, creativity, ambition', 'Pause long enough to check whether your current approach is working. Your energy wants movement, experimentation, and visible progress.', 'Direct your enthusiasm toward one useful challenge. Let the seven theme guide how strongly you act on it.', 'action,creativity,adventure'),
(30, 'Eight of Wands', 'Minor Arcana', 'Wands', 'Eight', 'practice, movement, energy, creativity, ambition', 'Focused repetition can create noticeable improvement. Your energy wants movement, experimentation, and visible progress.', 'Direct your enthusiasm toward one useful challenge. Let the eight theme guide how strongly you act on it.', 'action,creativity,adventure'),
(31, 'Nine of Wands', 'Minor Arcana', 'Wands', 'Nine', 'independence, resilience, energy, creativity, ambition', 'You are close to a result, but steady effort still matters. Your energy wants movement, experimentation, and visible progress.', 'Direct your enthusiasm toward one useful challenge. Let the nine theme guide how strongly you act on it.', 'action,creativity,adventure'),
(32, 'Ten of Wands', 'Minor Arcana', 'Wands', 'Ten', 'completion, responsibility, energy, creativity, ambition', 'A cycle is reaching a fuller or heavier stage and needs perspective. Your energy wants movement, experimentation, and visible progress.', 'Direct your enthusiasm toward one useful challenge. Let the ten theme guide how strongly you act on it.', 'action,creativity,adventure'),
(33, 'Page of Wands', 'Minor Arcana', 'Wands', 'Page', 'curiosity, message, energy, creativity, ambition', 'A beginner mindset can reveal an unexpected opportunity to learn. Your energy wants movement, experimentation, and visible progress.', 'Direct your enthusiasm toward one useful challenge. Let the page theme guide how strongly you act on it.', 'action,creativity,adventure'),
(34, 'Knight of Wands', 'Minor Arcana', 'Wands', 'Knight', 'pursuit, momentum, energy, creativity, ambition', 'Strong movement is possible, but direction matters as much as speed. Your energy wants movement, experimentation, and visible progress.', 'Direct your enthusiasm toward one useful challenge. Let the knight theme guide how strongly you act on it.', 'action,creativity,adventure'),
(35, 'Queen of Wands', 'Minor Arcana', 'Wands', 'Queen', 'maturity, inner strength, energy, creativity, ambition', 'Experience and self-awareness help you respond rather than react. Your energy wants movement, experimentation, and visible progress.', 'Direct your enthusiasm toward one useful challenge. Let the queen theme guide how strongly you act on it.', 'action,creativity,adventure'),
(36, 'King of Wands', 'Minor Arcana', 'Wands', 'King', 'mastery, leadership, energy, creativity, ambition', 'Responsibility and deliberate leadership are important. Your energy wants movement, experimentation, and visible progress.', 'Direct your enthusiasm toward one useful challenge. Let the king theme guide how strongly you act on it.', 'action,creativity,adventure'),
(37, 'Ace of Cups', 'Minor Arcana', 'Cups', 'Ace', 'beginning, potential, emotion, relationships, intuition', 'A new possibility is available. Feelings, relationships, and inner reactions are especially relevant.', 'Pay attention to emotions without letting one mood decide everything. Let the ace theme guide how strongly you act on it.', 'care,connection,intuition'),
(38, 'Two of Cups', 'Minor Arcana', 'Cups', 'Two', 'balance, choice, emotion, relationships, intuition', 'Two priorities or directions need attention. Feelings, relationships, and inner reactions are especially relevant.', 'Pay attention to emotions without letting one mood decide everything. Let the two theme guide how strongly you act on it.', 'care,connection,intuition'),
(39, 'Three of Cups', 'Minor Arcana', 'Cups', 'Three', 'development, teamwork, emotion, relationships, intuition', 'Progress grows through practice or cooperation. Feelings, relationships, and inner reactions are especially relevant.', 'Pay attention to emotions without letting one mood decide everything. Let the three theme guide how strongly you act on it.', 'care,connection,intuition'),
(40, 'Four of Cups', 'Minor Arcana', 'Cups', 'Four', 'stability, protection, emotion, relationships, intuition', 'Holding a stable position can help, but too much control can limit growth. Feelings, relationships, and inner reactions are especially relevant.', 'Pay attention to emotions without letting one mood decide everything. Let the four theme guide how strongly you act on it.', 'care,connection,intuition'),
(41, 'Five of Cups', 'Minor Arcana', 'Cups', 'Five', 'challenge, adjustment, emotion, relationships, intuition', 'A difficulty asks you to adapt rather than give up. Feelings, relationships, and inner reactions are especially relevant.', 'Pay attention to emotions without letting one mood decide everything. Let the five theme guide how strongly you act on it.', 'care,connection,intuition'),
(42, 'Six of Cups', 'Minor Arcana', 'Cups', 'Six', 'progress, support, emotion, relationships, intuition', 'Movement becomes easier when support and perspective improve. Feelings, relationships, and inner reactions are especially relevant.', 'Pay attention to emotions without letting one mood decide everything. Let the six theme guide how strongly you act on it.', 'care,connection,intuition'),
(43, 'Seven of Cups', 'Minor Arcana', 'Cups', 'Seven', 'assessment, strategy, emotion, relationships, intuition', 'Pause long enough to check whether your current approach is working. Feelings, relationships, and inner reactions are especially relevant.', 'Pay attention to emotions without letting one mood decide everything. Let the seven theme guide how strongly you act on it.', 'care,connection,intuition'),
(44, 'Eight of Cups', 'Minor Arcana', 'Cups', 'Eight', 'practice, movement, emotion, relationships, intuition', 'Focused repetition can create noticeable improvement. Feelings, relationships, and inner reactions are especially relevant.', 'Pay attention to emotions without letting one mood decide everything. Let the eight theme guide how strongly you act on it.', 'care,connection,intuition'),
(45, 'Nine of Cups', 'Minor Arcana', 'Cups', 'Nine', 'independence, resilience, emotion, relationships, intuition', 'You are close to a result, but steady effort still matters. Feelings, relationships, and inner reactions are especially relevant.', 'Pay attention to emotions without letting one mood decide everything. Let the nine theme guide how strongly you act on it.', 'care,connection,intuition'),
(46, 'Ten of Cups', 'Minor Arcana', 'Cups', 'Ten', 'completion, responsibility, emotion, relationships, intuition', 'A cycle is reaching a fuller or heavier stage and needs perspective. Feelings, relationships, and inner reactions are especially relevant.', 'Pay attention to emotions without letting one mood decide everything. Let the ten theme guide how strongly you act on it.', 'care,connection,intuition'),
(47, 'Page of Cups', 'Minor Arcana', 'Cups', 'Page', 'curiosity, message, emotion, relationships, intuition', 'A beginner mindset can reveal an unexpected opportunity to learn. Feelings, relationships, and inner reactions are especially relevant.', 'Pay attention to emotions without letting one mood decide everything. Let the page theme guide how strongly you act on it.', 'care,connection,intuition'),
(48, 'Knight of Cups', 'Minor Arcana', 'Cups', 'Knight', 'pursuit, momentum, emotion, relationships, intuition', 'Strong movement is possible, but direction matters as much as speed. Feelings, relationships, and inner reactions are especially relevant.', 'Pay attention to emotions without letting one mood decide everything. Let the knight theme guide how strongly you act on it.', 'care,connection,intuition'),
(49, 'Queen of Cups', 'Minor Arcana', 'Cups', 'Queen', 'maturity, inner strength, emotion, relationships, intuition', 'Experience and self-awareness help you respond rather than react. Feelings, relationships, and inner reactions are especially relevant.', 'Pay attention to emotions without letting one mood decide everything. Let the queen theme guide how strongly you act on it.', 'care,connection,intuition'),
(50, 'King of Cups', 'Minor Arcana', 'Cups', 'King', 'mastery, leadership, emotion, relationships, intuition', 'Responsibility and deliberate leadership are important. Feelings, relationships, and inner reactions are especially relevant.', 'Pay attention to emotions without letting one mood decide everything. Let the king theme guide how strongly you act on it.', 'care,connection,intuition'),
(51, 'Ace of Swords', 'Minor Arcana', 'Swords', 'Ace', 'beginning, potential, thought, truth, decisions', 'A new possibility is available. Thinking, communication, and difficult decisions are highlighted.', 'Be clear, honest, and willing to examine your assumptions. Let the ace theme guide how strongly you act on it.', 'logic,choice,focus'),
(52, 'Two of Swords', 'Minor Arcana', 'Swords', 'Two', 'balance, choice, thought, truth, decisions', 'Two priorities or directions need attention. Thinking, communication, and difficult decisions are highlighted.', 'Be clear, honest, and willing to examine your assumptions. Let the two theme guide how strongly you act on it.', 'logic,choice,focus'),
(53, 'Three of Swords', 'Minor Arcana', 'Swords', 'Three', 'development, teamwork, thought, truth, decisions', 'Progress grows through practice or cooperation. Thinking, communication, and difficult decisions are highlighted.', 'Be clear, honest, and willing to examine your assumptions. Let the three theme guide how strongly you act on it.', 'logic,choice,focus'),
(54, 'Four of Swords', 'Minor Arcana', 'Swords', 'Four', 'stability, protection, thought, truth, decisions', 'Holding a stable position can help, but too much control can limit growth. Thinking, communication, and difficult decisions are highlighted.', 'Be clear, honest, and willing to examine your assumptions. Let the four theme guide how strongly you act on it.', 'logic,choice,focus'),
(55, 'Five of Swords', 'Minor Arcana', 'Swords', 'Five', 'challenge, adjustment, thought, truth, decisions', 'A difficulty asks you to adapt rather than give up. Thinking, communication, and difficult decisions are highlighted.', 'Be clear, honest, and willing to examine your assumptions. Let the five theme guide how strongly you act on it.', 'logic,choice,focus'),
(56, 'Six of Swords', 'Minor Arcana', 'Swords', 'Six', 'progress, support, thought, truth, decisions', 'Movement becomes easier when support and perspective improve. Thinking, communication, and difficult decisions are highlighted.', 'Be clear, honest, and willing to examine your assumptions. Let the six theme guide how strongly you act on it.', 'logic,choice,focus'),
(57, 'Seven of Swords', 'Minor Arcana', 'Swords', 'Seven', 'assessment, strategy, thought, truth, decisions', 'Pause long enough to check whether your current approach is working. Thinking, communication, and difficult decisions are highlighted.', 'Be clear, honest, and willing to examine your assumptions. Let the seven theme guide how strongly you act on it.', 'logic,choice,focus'),
(58, 'Eight of Swords', 'Minor Arcana', 'Swords', 'Eight', 'practice, movement, thought, truth, decisions', 'Focused repetition can create noticeable improvement. Thinking, communication, and difficult decisions are highlighted.', 'Be clear, honest, and willing to examine your assumptions. Let the eight theme guide how strongly you act on it.', 'logic,choice,focus'),
(59, 'Nine of Swords', 'Minor Arcana', 'Swords', 'Nine', 'independence, resilience, thought, truth, decisions', 'You are close to a result, but steady effort still matters. Thinking, communication, and difficult decisions are highlighted.', 'Be clear, honest, and willing to examine your assumptions. Let the nine theme guide how strongly you act on it.', 'logic,choice,focus'),
(60, 'Ten of Swords', 'Minor Arcana', 'Swords', 'Ten', 'completion, responsibility, thought, truth, decisions', 'A cycle is reaching a fuller or heavier stage and needs perspective. Thinking, communication, and difficult decisions are highlighted.', 'Be clear, honest, and willing to examine your assumptions. Let the ten theme guide how strongly you act on it.', 'logic,choice,focus'),
(61, 'Page of Swords', 'Minor Arcana', 'Swords', 'Page', 'curiosity, message, thought, truth, decisions', 'A beginner mindset can reveal an unexpected opportunity to learn. Thinking, communication, and difficult decisions are highlighted.', 'Be clear, honest, and willing to examine your assumptions. Let the page theme guide how strongly you act on it.', 'logic,choice,focus'),
(62, 'Knight of Swords', 'Minor Arcana', 'Swords', 'Knight', 'pursuit, momentum, thought, truth, decisions', 'Strong movement is possible, but direction matters as much as speed. Thinking, communication, and difficult decisions are highlighted.', 'Be clear, honest, and willing to examine your assumptions. Let the knight theme guide how strongly you act on it.', 'logic,choice,focus'),
(63, 'Queen of Swords', 'Minor Arcana', 'Swords', 'Queen', 'maturity, inner strength, thought, truth, decisions', 'Experience and self-awareness help you respond rather than react. Thinking, communication, and difficult decisions are highlighted.', 'Be clear, honest, and willing to examine your assumptions. Let the queen theme guide how strongly you act on it.', 'logic,choice,focus'),
(64, 'King of Swords', 'Minor Arcana', 'Swords', 'King', 'mastery, leadership, thought, truth, decisions', 'Responsibility and deliberate leadership are important. Thinking, communication, and difficult decisions are highlighted.', 'Be clear, honest, and willing to examine your assumptions. Let the king theme guide how strongly you act on it.', 'logic,choice,focus'),
(65, 'Ace of Pentacles', 'Minor Arcana', 'Pentacles', 'Ace', 'beginning, potential, work, resources, stability', 'A new possibility is available. Practical progress, skills, routines, and resources are the focus.', 'Build slowly, learn from repetition, and protect what is sustainable. Let the ace theme guide how strongly you act on it.', 'stability,learning,growth'),
(66, 'Two of Pentacles', 'Minor Arcana', 'Pentacles', 'Two', 'balance, choice, work, resources, stability', 'Two priorities or directions need attention. Practical progress, skills, routines, and resources are the focus.', 'Build slowly, learn from repetition, and protect what is sustainable. Let the two theme guide how strongly you act on it.', 'stability,learning,growth'),
(67, 'Three of Pentacles', 'Minor Arcana', 'Pentacles', 'Three', 'development, teamwork, work, resources, stability', 'Progress grows through practice or cooperation. Practical progress, skills, routines, and resources are the focus.', 'Build slowly, learn from repetition, and protect what is sustainable. Let the three theme guide how strongly you act on it.', 'stability,learning,growth'),
(68, 'Four of Pentacles', 'Minor Arcana', 'Pentacles', 'Four', 'stability, protection, work, resources, stability', 'Holding a stable position can help, but too much control can limit growth. Practical progress, skills, routines, and resources are the focus.', 'Build slowly, learn from repetition, and protect what is sustainable. Let the four theme guide how strongly you act on it.', 'stability,learning,growth'),
(69, 'Five of Pentacles', 'Minor Arcana', 'Pentacles', 'Five', 'challenge, adjustment, work, resources, stability', 'A difficulty asks you to adapt rather than give up. Practical progress, skills, routines, and resources are the focus.', 'Build slowly, learn from repetition, and protect what is sustainable. Let the five theme guide how strongly you act on it.', 'stability,learning,growth'),
(70, 'Six of Pentacles', 'Minor Arcana', 'Pentacles', 'Six', 'progress, support, work, resources, stability', 'Movement becomes easier when support and perspective improve. Practical progress, skills, routines, and resources are the focus.', 'Build slowly, learn from repetition, and protect what is sustainable. Let the six theme guide how strongly you act on it.', 'stability,learning,growth'),
(71, 'Seven of Pentacles', 'Minor Arcana', 'Pentacles', 'Seven', 'assessment, strategy, work, resources, stability', 'Pause long enough to check whether your current approach is working. Practical progress, skills, routines, and resources are the focus.', 'Build slowly, learn from repetition, and protect what is sustainable. Let the seven theme guide how strongly you act on it.', 'stability,learning,growth'),
(72, 'Eight of Pentacles', 'Minor Arcana', 'Pentacles', 'Eight', 'practice, movement, work, resources, stability', 'Focused repetition can create noticeable improvement. Practical progress, skills, routines, and resources are the focus.', 'Build slowly, learn from repetition, and protect what is sustainable. Let the eight theme guide how strongly you act on it.', 'stability,learning,growth'),
(73, 'Nine of Pentacles', 'Minor Arcana', 'Pentacles', 'Nine', 'independence, resilience, work, resources, stability', 'You are close to a result, but steady effort still matters. Practical progress, skills, routines, and resources are the focus.', 'Build slowly, learn from repetition, and protect what is sustainable. Let the nine theme guide how strongly you act on it.', 'stability,learning,growth'),
(74, 'Ten of Pentacles', 'Minor Arcana', 'Pentacles', 'Ten', 'completion, responsibility, work, resources, stability', 'A cycle is reaching a fuller or heavier stage and needs perspective. Practical progress, skills, routines, and resources are the focus.', 'Build slowly, learn from repetition, and protect what is sustainable. Let the ten theme guide how strongly you act on it.', 'stability,learning,growth'),
(75, 'Page of Pentacles', 'Minor Arcana', 'Pentacles', 'Page', 'curiosity, message, work, resources, stability', 'A beginner mindset can reveal an unexpected opportunity to learn. Practical progress, skills, routines, and resources are the focus.', 'Build slowly, learn from repetition, and protect what is sustainable. Let the page theme guide how strongly you act on it.', 'stability,learning,growth'),
(76, 'Knight of Pentacles', 'Minor Arcana', 'Pentacles', 'Knight', 'pursuit, momentum, work, resources, stability', 'Strong movement is possible, but direction matters as much as speed. Practical progress, skills, routines, and resources are the focus.', 'Build slowly, learn from repetition, and protect what is sustainable. Let the knight theme guide how strongly you act on it.', 'stability,learning,growth'),
(77, 'Queen of Pentacles', 'Minor Arcana', 'Pentacles', 'Queen', 'maturity, inner strength, work, resources, stability', 'Experience and self-awareness help you respond rather than react. Practical progress, skills, routines, and resources are the focus.', 'Build slowly, learn from repetition, and protect what is sustainable. Let the queen theme guide how strongly you act on it.', 'stability,learning,growth'),
(78, 'King of Pentacles', 'Minor Arcana', 'Pentacles', 'King', 'mastery, leadership, work, resources, stability', 'Responsibility and deliberate leadership are important. Practical progress, skills, routines, and resources are the focus.', 'Build slowly, learn from repetition, and protect what is sustainable. Let the king theme guide how strongly you act on it.', 'stability,learning,growth');

INSERT INTO questions (question_text) VALUES ('You unexpectedly get a free afternoon. What sounds best?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Go somewhere I have never been', 'adventure');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Make or build something', 'creativity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Spend time with people I like', 'connection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Stay somewhere quiet and think', 'reflection');

INSERT INTO questions (question_text) VALUES ('A group project is becoming messy. What do you naturally do?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Organize the jobs and deadlines', 'leadership');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Suggest a completely new approach', 'creativity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Make sure everyone is included', 'care');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Study the problem before speaking', 'logic');

INSERT INTO questions (question_text) VALUES ('Which compliment would you enjoy most?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'You are brave', 'courage');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'You are thoughtful', 'reflection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'You are reliable', 'stability');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'You are inspiring', 'hope');

INSERT INTO questions (question_text) VALUES ('When you learn something difficult, what helps most?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Practice it many times', 'learning');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Ask someone to explain it', 'community');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Break it into a clear system', 'logic');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Experiment until it makes sense', 'curiosity');

INSERT INTO questions (question_text) VALUES ('What usually makes a weekend memorable?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Trying something new', 'adventure');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Finishing something I worked hard on', 'achievement');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Laughing with friends', 'joy');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Having time to recharge', 'balance');

INSERT INTO questions (question_text) VALUES ('If your plan suddenly fails, what is your first reaction?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Change direction quickly', 'change');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Slow down and rethink it', 'reflection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Push harder', 'action');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Ask for help', 'community');

INSERT INTO questions (question_text) VALUES ('Which place would you choose to spend an hour?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A busy event', 'joy');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A quiet library', 'learning');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A creative studio', 'creativity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A place with a wide open view', 'hope');

INSERT INTO questions (question_text) VALUES ('A friend tells you a personal problem. What do you do first?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Listen carefully', 'care');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Offer a practical solution', 'logic');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Help them feel hopeful', 'hope');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Ask questions to understand more', 'intuition');

INSERT INTO questions (question_text) VALUES ('Which sounds most like your decision style?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I decide quickly and act', 'action');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I compare the facts', 'logic');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I follow my feeling', 'intuition');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I wait until I feel ready', 'patience');

INSERT INTO questions (question_text) VALUES ('You can improve one skill instantly. Which type do you choose?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Creative skill', 'creativity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Leadership skill', 'leadership');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Academic skill', 'learning');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Social skill', 'connection');

INSERT INTO questions (question_text) VALUES ('What do you value most in a team?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Clear roles', 'stability');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Good energy', 'joy');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Fairness', 'choice');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Support', 'care');

INSERT INTO questions (question_text) VALUES ('Which challenge sounds most interesting?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Starting from zero', 'curiosity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Leading a team', 'leadership');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Solving a mystery', 'intuition');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Training until I master something', 'focus');

INSERT INTO questions (question_text) VALUES ('When you think about the future, what matters most?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Freedom', 'freedom');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Success', 'achievement');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'People I care about', 'connection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A sense of purpose', 'hope');

INSERT INTO questions (question_text) VALUES ('What happens when you are under pressure?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I become very focused', 'focus');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I need time to calm down', 'balance');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I act immediately', 'action');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I think of many possible outcomes', 'imagination');

INSERT INTO questions (question_text) VALUES ('Which type of story attracts you most?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Adventure', 'adventure');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Mystery', 'intuition');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Friendship', 'connection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Personal growth', 'growth');

INSERT INTO questions (question_text) VALUES ('You discover that you were wrong about something. What next?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Change my opinion', 'change');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Check the evidence again', 'logic');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Think about why I believed it', 'reflection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Ask someone else what they think', 'community');

INSERT INTO questions (question_text) VALUES ('Which school task would you rather receive?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Design something original', 'creativity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Solve a difficult problem', 'logic');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Present to the class', 'confidence');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Research a topic deeply', 'learning');

INSERT INTO questions (question_text) VALUES ('Which word best describes a good life?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Balanced', 'balance');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Exciting', 'adventure');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Meaningful', 'hope');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Connected', 'connection');

INSERT INTO questions (question_text) VALUES ('What kind of progress motivates you?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Seeing fast results', 'action');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Getting a little better every day', 'growth');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Reaching a difficult goal', 'achievement');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Feeling more confident', 'confidence');

INSERT INTO questions (question_text) VALUES ('If you could change one thing about your routine, what would you want?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'More freedom', 'freedom');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'More structure', 'stability');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'More creativity', 'creativity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'More rest', 'balance');

INSERT INTO questions (question_text) VALUES ('Someone disagrees with you strongly. What matters most?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Understanding their point', 'reflection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Explaining my reasoning clearly', 'logic');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Keeping the relationship respectful', 'care');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Having the courage to stand by my view', 'courage');

INSERT INTO questions (question_text) VALUES ('Which ability feels most powerful?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Staying calm', 'patience');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Taking action', 'action');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Understanding people', 'intuition');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Getting others motivated', 'leadership');

INSERT INTO questions (question_text) VALUES ('You are choosing between a safe option and a risky opportunity. What pulls you most?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'The possibility of something new', 'adventure');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'The security of what I know', 'stability');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'What my instincts tell me', 'intuition');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Which option helps me grow', 'growth');

INSERT INTO questions (question_text) VALUES ('What do you do after achieving something important?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Celebrate with people', 'joy');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Start planning the next goal', 'achievement');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Think about what I learned', 'reflection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Help someone else improve', 'care');

INSERT INTO questions (question_text) VALUES ('Which kind of surprise do you enjoy most?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A spontaneous trip', 'freedom');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'An unexpected compliment', 'confidence');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A new idea', 'curiosity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A message from someone I miss', 'connection');

INSERT INTO questions (question_text) VALUES ('When your motivation is low, what helps?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Remembering the bigger purpose', 'hope');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Making a smaller plan', 'focus');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Taking a break', 'balance');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Working beside someone else', 'community');

INSERT INTO questions (question_text) VALUES ('What is hardest for you to ignore?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'An unfair situation', 'choice');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A new possibility', 'curiosity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Someone who needs help', 'care');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A problem that does not make sense', 'logic');

INSERT INTO questions (question_text) VALUES ('Which personal quality would you like to strengthen?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Courage', 'courage');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Patience', 'patience');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Confidence', 'confidence');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Imagination', 'imagination');

INSERT INTO questions (question_text) VALUES ('What do you usually notice first in a new place?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'The atmosphere', 'intuition');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'The people', 'connection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'How things are organized', 'stability');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'What I could explore', 'adventure');

INSERT INTO questions (question_text) VALUES ('What would make you proud at the end of a month?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Learning a useful skill', 'learning');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Creating something original', 'creativity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Keeping a good routine', 'stability');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Doing something I was afraid to try', 'courage');

INSERT INTO questions (question_text) VALUES ('When a choice has no perfect answer, what helps you most?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'My values', 'choice');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Time', 'patience');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A trusted person', 'community');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'My intuition', 'intuition');

INSERT INTO questions (question_text) VALUES ('Which result sounds most satisfying?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A finished project', 'achievement');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A stronger friendship', 'connection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A better habit', 'growth');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A peaceful mind', 'balance');


-- EXTRA RANDOM QUESTION POOL (28 more questions; total = 60)

INSERT INTO questions (question_text) VALUES ('A new student joins your class. What do you do?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Introduce myself first', 'connection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Show them where things are', 'care');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Wait and see if they need help', 'reflection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Invite them into my group', 'community');

INSERT INTO questions (question_text) VALUES ('You have to present in front of the class tomorrow. What helps most?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Practice until I know it well', 'focus');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Imagine it going well', 'hope');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Make a clear plan', 'stability');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Just start and trust myself', 'confidence');

INSERT INTO questions (question_text) VALUES ('Which kind of game sounds most fun?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Exploring a huge unknown world', 'adventure');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Solving puzzles and mysteries', 'logic');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Building and designing things', 'creativity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Playing with a team', 'community');

INSERT INTO questions (question_text) VALUES ('You get an unexpected difficult homework task. What is your first move?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Break it into smaller steps', 'logic');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Ask a friend for ideas', 'connection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Try different ways until something works', 'curiosity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Start immediately and keep going', 'action');

INSERT INTO questions (question_text) VALUES ('Which room feels most comfortable to you?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A bright room full of people', 'joy');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A quiet room with books', 'reflection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A neat room where everything has a place', 'stability');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A creative room full of art and projects', 'creativity');

INSERT INTO questions (question_text) VALUES ('Your friend disagrees with you. What matters most?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Understanding why they think that way', 'care');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Finding the fairest answer', 'choice');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Checking the facts', 'logic');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Keeping the friendship calm', 'balance');

INSERT INTO questions (question_text) VALUES ('You receive a small amount of extra money. What would you rather do?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Save it for later', 'stability');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Buy something useful for learning', 'learning');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Spend it on a fun experience', 'joy');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Use it for a new hobby', 'curiosity');

INSERT INTO questions (question_text) VALUES ('Which type of challenge gives you energy?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Something competitive', 'confidence');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Something creative', 'creativity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Something nobody has tried before', 'adventure');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Something that helps other people', 'care');

INSERT INTO questions (question_text) VALUES ('When your room or desk becomes messy, what do you usually do?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Clean it immediately', 'action');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Make a system for everything', 'stability');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Ignore it until I need space', 'freedom');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Clean while listening to music or having fun', 'joy');

INSERT INTO questions (question_text) VALUES ('You are choosing a new hobby. What attracts you most?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Learning a difficult skill', 'learning');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Meeting new people', 'connection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Expressing myself', 'creativity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Doing something exciting', 'adventure');

INSERT INTO questions (question_text) VALUES ('A plan is taking longer than expected. How do you react?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Keep working patiently', 'patience');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Change the plan', 'change');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Push myself harder', 'action');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Take a break and return later', 'balance');

INSERT INTO questions (question_text) VALUES ('Which school club would you choose?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Art or music club', 'creativity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Science or coding club', 'learning');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Sports club', 'action');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Volunteer club', 'care');

INSERT INTO questions (question_text) VALUES ('What kind of message would make you happiest?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I am proud of you', 'achievement');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I am here if you need me', 'connection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'You gave me a great idea', 'creativity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'You can do this', 'hope');

INSERT INTO questions (question_text) VALUES ('If you could travel tomorrow, what would you choose?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A famous city', 'curiosity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A quiet natural place', 'reflection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A place with exciting activities', 'adventure');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A place where friends or family live', 'connection');

INSERT INTO questions (question_text) VALUES ('Someone gives you a complicated problem. What sounds most like you?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Draw or visualize it', 'imagination');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Find the rules and facts', 'logic');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Ask questions first', 'curiosity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Try a solution immediately', 'action');

INSERT INTO questions (question_text) VALUES ('Which result feels most satisfying?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Winning', 'achievement');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Learning something new', 'learning');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Helping someone', 'care');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Creating something unique', 'creativity');

INSERT INTO questions (question_text) VALUES ('Your weekend plans are cancelled. What do you do?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Make a new plan quickly', 'change');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Enjoy having free time', 'freedom');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Invite someone to do something else', 'connection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Stay home and recharge', 'balance');

INSERT INTO questions (question_text) VALUES ('What do you notice first when entering a new place?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'The people', 'connection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'The atmosphere', 'intuition');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'How everything is organized', 'logic');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Interesting things to explore', 'curiosity');

INSERT INTO questions (question_text) VALUES ('If you were the leader of a team, what would you focus on?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Clear goals', 'leadership');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Everyone feeling included', 'care');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'New ideas', 'creativity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Finishing on time', 'focus');

INSERT INTO questions (question_text) VALUES ('Which sentence sounds most like you?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I like knowing what will happen', 'stability');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I like surprises', 'adventure');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I like understanding how things work', 'learning');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I like imagining what could happen', 'imagination');

INSERT INTO questions (question_text) VALUES ('You make a mistake in front of other people. What helps you recover?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Laugh and move on', 'joy');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Think about what I can learn', 'growth');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Stay calm and try again', 'confidence');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Take a moment before continuing', 'reflection');

INSERT INTO questions (question_text) VALUES ('What kind of success matters most to you?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Reaching a difficult goal', 'achievement');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Becoming more confident', 'growth');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Doing something meaningful with others', 'community');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Having freedom to choose my path', 'freedom');

INSERT INTO questions (question_text) VALUES ('A friend asks for advice about a big decision. What do you offer?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Pros and cons', 'logic');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Encouragement', 'hope');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Questions that help them think', 'reflection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'What my instinct says', 'intuition');

INSERT INTO questions (question_text) VALUES ('Which activity sounds best after a stressful day?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Exercise or move around', 'action');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Talk with someone I trust', 'connection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Be alone for a while', 'reflection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Do something creative', 'creativity');

INSERT INTO questions (question_text) VALUES ('What usually motivates you to finish something?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A deadline', 'focus');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A reward or result', 'achievement');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Someone depending on me', 'care');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Seeing my own improvement', 'growth');

INSERT INTO questions (question_text) VALUES ('You have to choose between a safe option and an exciting option. What do you consider most?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'How much I could learn', 'learning');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'How risky it is', 'stability');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'How memorable it could be', 'adventure');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Whether it feels right', 'intuition');

INSERT INTO questions (question_text) VALUES ('Which fictional character do you usually like most?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'The brave hero', 'courage');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'The clever strategist', 'logic');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'The funny friend', 'joy');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'The mysterious character', 'intuition');

INSERT INTO questions (question_text) VALUES ('When you start a big project, what comes first?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A clear plan', 'focus');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A lot of ideas', 'imagination');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Finding people to work with', 'community');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Just beginning and adjusting later', 'action');


-- EXTRA RANDOM QUESTION POOL (18 more questions; total = 78)

INSERT INTO questions (question_text) VALUES ('Which kind of weather matches your ideal day?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Bright and sunny', 'joy');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Cool and cloudy', 'reflection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Stormy and dramatic', 'imagination');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Fresh after rain', 'growth');

INSERT INTO questions (question_text) VALUES ('You are given a blank notebook. What would you use it for?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Plans and goals', 'focus');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Drawings and ideas', 'creativity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Private thoughts', 'reflection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Things I want to learn', 'learning');

INSERT INTO questions (question_text) VALUES ('What is hardest for you to ignore?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'An unfair situation', 'choice');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Someone who needs help', 'care');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'An interesting mystery', 'curiosity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A challenge I want to win', 'achievement');

INSERT INTO questions (question_text) VALUES ('Your team wins something together. What makes you happiest?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'We worked well together', 'community');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Our hard work paid off', 'achievement');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Everyone is excited', 'joy');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I learned what I can do', 'growth');

INSERT INTO questions (question_text) VALUES ('Which kind of surprise would you enjoy most?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A spontaneous trip', 'adventure');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A thoughtful gift', 'care');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A message from an old friend', 'connection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A chance to try something new', 'curiosity');

INSERT INTO questions (question_text) VALUES ('When you feel unsure, what do you trust first?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Facts', 'logic');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'My instincts', 'intuition');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Someone experienced', 'learning');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Time to think', 'reflection');

INSERT INTO questions (question_text) VALUES ('What do you want more of this year?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Confidence', 'confidence');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'New experiences', 'adventure');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Better balance', 'balance');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Personal progress', 'growth');

INSERT INTO questions (question_text) VALUES ('If you could improve your school environment, what would you change first?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Make it more creative', 'creativity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Make rules clearer', 'stability');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Help students support each other', 'community');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Give students more choices', 'freedom');

INSERT INTO questions (question_text) VALUES ('Which kind of goal sounds best?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A difficult goal with a clear finish', 'achievement');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A goal that helps me grow', 'growth');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A goal I can do with friends', 'connection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A goal that lets me explore', 'curiosity');

INSERT INTO questions (question_text) VALUES ('Someone changes the plan at the last minute. What do you need?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A new clear plan', 'stability');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A moment to adjust', 'patience');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Freedom to improvise', 'freedom');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A positive attitude', 'hope');

INSERT INTO questions (question_text) VALUES ('What makes a person impressive to you?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'They stay calm under pressure', 'confidence');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'They are kind to people', 'care');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'They know a lot', 'learning');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'They create original things', 'creativity');

INSERT INTO questions (question_text) VALUES ('You have one hour with no phone or internet. What do you do?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Read or learn something', 'learning');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Draw, write, or make something', 'creativity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Go outside', 'adventure');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Think and relax', 'reflection');

INSERT INTO questions (question_text) VALUES ('Which kind of decision is easiest for you?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A decision with clear facts', 'logic');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A decision based on what I want', 'freedom');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A decision that helps everyone', 'care');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'A decision that creates a new opportunity', 'hope');

INSERT INTO questions (question_text) VALUES ('What do you usually do when you feel excited about an idea?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Start immediately', 'action');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Tell someone about it', 'connection');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Plan how to make it real', 'focus');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Imagine all the possibilities', 'imagination');

INSERT INTO questions (question_text) VALUES ('Which skill would you most like people to notice in you?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Leadership', 'leadership');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Creativity', 'creativity');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Courage', 'courage');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Reliability', 'stability');

INSERT INTO questions (question_text) VALUES ('If you could change one thing about your routine, what would you choose?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'More free time', 'freedom');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'More organization', 'stability');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'More exciting activities', 'adventure');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'More time with people I like', 'connection');

INSERT INTO questions (question_text) VALUES ('What makes you keep trying after a failure?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I believe I can improve', 'hope');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I dislike giving up', 'courage');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I want to understand what went wrong', 'learning');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'I focus on the next step', 'focus');

INSERT INTO questions (question_text) VALUES ('At the end of a busy week, what feels most important?');
SET @qid = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Rest', 'balance');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Fun', 'joy');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Finishing unfinished work', 'achievement');
INSERT INTO question_options (question_id, option_text, trait) VALUES (@qid, 'Thinking about what happened', 'reflection');

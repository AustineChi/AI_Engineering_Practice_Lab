# AI Engineering Practice Lab

A free, no-dependency quiz app with **about 180 curated questions** for learning AI engineering: ML lifecycle, LLMs, RAG, evals, serving, agents, distributed training and more.

**Live site:** https://austinechi.github.io/AI_Engineering_Practice_Lab/

**Study notes:** https://austinechi.github.io/AI_Engineering_Practice_Lab/notes.html (13 connected topics; the quiz is the exam on them)

## Features
- **Study notes** page: topic navigation, search, mark-as-read, quick-reference symptom table and glossary; the quiz links back to the matching note
- **Learning mode**: hints, instant feedback, explanations and practical takeaways
- **Exam mode**: no feedback until the round ends
- Answer order is shuffled every time, so you can't memorise letters
- **Anti-guessing design**: state how sure you are first; a confident wrong answer costs points, "I don't know" is free
- Question formats: single answer, select-all-that-apply, numeric (back-of-envelope sums) and debugging scenarios
- **Spaced review**: questions you miss come back after 1, 3, 7 and 14 days (Leitner boxes)
- Topic filter, mistake review, bookmarks, confidence ratings
- Dashboard with accuracy, mastery estimate and per-topic progress
- Light/dark theme; progress is stored in your browser's local storage (nothing is sent anywhere)

## Run locally
Python 3 is required, and nothing else.

```sh
python3 -m http.server 8765   # then open http://127.0.0.1:8765
```
Or use `start_quiz.command` (macOS), `start_quiz.bat` (Windows) or `start_quiz.sh` (Linux).
Don't open `index.html` directly from disk, because browsers block loading `questions.yaml`.

## Question bank
`questions.yaml` is JSON-compatible YAML. To add a question, append an object to `questions` with a unique `id`, `section`, `type`, `question`, four `options`, a zero-based `answer`, and an `explanation` (optional: `hint`, `concept_term`, `concept`, `practical`).

## Design notes (research basis)
- Retrieval practice with feedback improves retention (the testing effect); recall formats give a modest edge over recognition, and multiple choice is still effective when feedback is given.
- Distractors follow the Haladyna et al. (2002) item-writing guidelines: plausible, based on common mistakes, similar length.
- Memory numbers follow the ZeRO paper (Rajbhandari et al., 2019): mixed-precision Adam uses (2 + 2 + K)·Ψ bytes with K = 12, i.e. 16 bytes per parameter.

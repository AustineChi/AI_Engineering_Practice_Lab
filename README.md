# AI Engineering Practice Lab

A free, no-dependency quiz app with **303 multiple-choice questions** for learning AI engineering: ML lifecycle, LLMs, RAG, evals, serving, agents, distributed training and more.

**Live site:** https://austinechi.github.io/AI_Engineering_Practice_Lab/

## Features
- **Learning mode**: hints, instant feedback, explanations and practical takeaways
- **Exam mode**: no feedback until the round ends
- Answer order is shuffled every time, so you can't memorise letters
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

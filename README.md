# ⭕ Neon Tic Tac Toe

<div align="center">

**A sleek, dark-mode take on the classic 3×3 game — built with Flutter.**

![Flutter](https://img.shields.io/badge/Flutter-3.7%2B-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.7-0175C2?logo=dart&logoColor=white)
![Platforms](https://img.shields.io/badge/platforms-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Windows%20%7C%20macOS%20%7C%20Linux-informational)
![License](https://img.shields.io/badge/license-MIT-green)

</div>

---

## 🎮 What is it?

A local 2-player **Tic Tac Toe** with a dark, neon-accented UI — cyan **X**, pink **O**, and a running scoreboard so the rematches actually mean something.

```
┌───────────────────────────┐
│   X: 3     Draws: 1   O: 2  │
├─────┬─────┬─────┤
│  X  │  O  │     │
├─────┼─────┼─────┤
│     │  X  │  O  │
├─────┼─────┼─────┤
│  O  │     │  X  │
└─────┴─────┴─────┘
│      Reset Scores           │
└───────────────────────────┘
```

## ✨ Features

- 👥 **Local 2-player**, pass-and-play on one screen
- 🏆 **Persistent match scoreboard** — tracks X wins, O wins, and draws across rounds
- ✅ **Automatic win & draw detection** across all 8 winning lines
- 💬 **Result dialog** with a one-tap **Play Again** to jump straight into the next round
- 🎨 Dark theme with cyan/pink neon accents for a clean, modern arcade feel
- 📱 Runs anywhere Flutter runs — Android, iOS, Web, Windows, macOS, and Linux

## 🕹️ How to play

1. Players take turns tapping empty cells — **X** always goes first
2. First player to line up **three in a row** (horizontally, vertically, or diagonally) wins the round
3. If the board fills up with no winner, it's a **draw**
4. A dialog announces the result — tap **Play Again** to reset the board and keep the score
5. Use **Reset Scores** to zero out the scoreboard and start a fresh match

## 🚀 Getting started

```bash
# Clone the repo
git clone https://github.com/mostafa842/tic_tac_toe.git
cd tic_tac_toe

# Install dependencies
flutter pub get

# Run it (pick your target device)
flutter run
```

### Requirements

- Flutter SDK `^3.7.2`
- Dart SDK (bundled with Flutter)

## 🧱 Tech stack

| Layer | Choice |
|---|---|
| Framework | [Flutter](https://flutter.dev) |
| Language | Dart |
| UI | Material widgets, `GridView`, custom dark theme |
| State management | `StatefulWidget` / `setState` |

## 📂 Project structure

```
lib/
├── main.dart        # App entry point
└── game_page.dart   # Board state, win/draw detection, scoring, and dialogs
```

## 🗺️ Roadmap ideas

- [ ] Single-player mode with a simple AI opponent
- [ ] Win-line highlight animation
- [ ] Larger board variants (4×4, 5×5)
- [ ] Sound effects on move/win/draw

## 📄 License

This project is available under the MIT License.

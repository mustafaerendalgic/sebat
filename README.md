<div align="center">

# Sebat

### An AI-assisted focus and note-taking workspace for research, studying, and reading

[![Status](https://img.shields.io/badge/status-work%20in%20progress-orange)](#project-status)
[![Flutter](https://img.shields.io/badge/Flutter-mobile%20application-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.12%2B-0175C2?logo=dart)](https://dart.dev)

Sebat is a mobile productivity application designed to help users stay focused, capture information naturally, and build meaningful connections between their notes.

> **This project is currently under active development.**
> Several features described below represent the planned product direction and may not yet be fully implemented.

</div>

---

## Overview

Sebat combines focused work sessions, structured note-taking, and AI-assisted knowledge analysis in a single mobile experience.

Users will be able to create separate focus areas for different subjects, books, courses, or research topics. During a session, they will be able to capture notes by typing, speaking into the microphone, or pointing the camera at printed text. The collected notes can then be explored through an AI assistant that answers questions, compares ideas, and identifies relationships across multiple notes.

The application is designed primarily for:

* Academic research
* Studying and exam preparation
* Book reading and annotation
* Long-form learning projects
* Topic-based personal knowledge management

---

## Product Vision

Most note-taking applications store information but do not actively help users understand it.

Sebat aims to turn notes into an interconnected knowledge workspace. Instead of treating each note as an isolated document, the application is intended to help users:

1. Focus on one subject at a time.
2. Capture information without interrupting their workflow.
3. Organize notes around meaningful topics.
4. Ask questions directly about their own material.
5. Compare and analyze multiple notes with AI.
6. Revisit previous study and reading sessions through an archive.

---

## Screenshots

<div align="center">
  <img src="https://github.com/user-attachments/assets/84b9c45a-8d58-45c9-8cad-a04607fb9c5c" width="250" alt="Sebat focus screen" />
  &nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/1d87b75c-2f53-4757-b2a4-79e2be060333" width="250" alt="Sebat archive screen" />
  &nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/4a2f6977-0925-4c96-8d74-bf7eb6bd5981" width="250" alt="Sebat AI assistant screen" />
</div>

---

## Planned Core Features

### Topic-Based Focus Sessions

Users will be able to create different focus areas for subjects such as a course, research project, or book. Each session will keep the related notes and activity within the selected context.

### Flexible Note Capture

Sebat is planned to support multiple note-taking methods:

* Manual text entry
* Voice-based note capture using the microphone
* Camera-based text recognition
* OCR extraction from books, documents, and printed material

### AI Assistant for Personal Notes

Users will be able to ask questions about the notes they have collected. The assistant is intended to respond using the user's own content as its primary context.

Example use cases:

* Summarizing a study session
* Explaining a difficult concept
* Generating review questions
* Finding contradictions between notes
* Comparing ideas from different chapters
* Identifying recurring concepts across multiple sources

### Cross-Note Analysis

The AI layer is planned to analyze multiple notes together rather than processing them only in isolation. This will help users discover relationships between topics and build a more connected understanding of their material.

### Archive and Search

Completed sessions and saved notes will be accessible through an archive. Search and filtering tools are planned to make it easier to find notes by subject, date, content, or context.

---

## Current Implementation

The repository currently contains the early Flutter interface and project foundation.

Implemented or partially implemented areas include:

* Cupertino-style bottom-tab navigation
* Home, Archive, AI, and Account sections
* Focus-session interface components
* Note-card UI components
* Timer-oriented home screen components
* Archive screen foundation
* AI question interface components
* Previous and suggested question views
* Reusable shared UI components
* Centralized application styling
* Multiple visual theme definitions
* Custom typography
* Lottie asset support
* Initial data, entity, enum, and repository directory structure

Camera capture, speech recognition, OCR, persistent note storage, and production AI integration are still under development.

---

## Project Structure

```text
lib/
├── data/
│   ├── entity/
│   ├── enum/
│   └── repo/
├── styles/
│   ├── app_style.dart
│   ├── default_style.dart
│   ├── green_style.dart
│   ├── main_style.dart
│   └── text_styles.dart
├── ui/
│   ├── account/
│   ├── ai/
│   ├── archives/
│   ├── common/
│   └── home/
└── main.dart
```

The current structure separates domain-related data, visual styles, and feature-based UI components. The architecture may evolve as persistence, device services, and AI integrations are added.

---

## Technology Stack

### Currently Used

* **Flutter** — cross-platform application framework
* **Dart** — primary programming language
* **Cupertino widgets** — iOS-oriented interface components
* **Lottie** — animation asset rendering
* **Custom fonts** — Unna and Rethink

### Planned Integrations

The exact packages and service providers have not yet been finalized, but the following capabilities are planned:

* Camera access
* Optical character recognition
* Speech-to-text
* Local or remote data persistence
* AI model integration
* Semantic note search
* Embedding-based note comparison

---

## Getting Started

### Prerequisites

Make sure the following tools are installed:

* Flutter SDK
* Dart SDK compatible with `^3.12.2`
* Android Studio or Visual Studio Code
* Android SDK, emulator, or a physical device
* Xcode for iOS development on macOS

### Installation

Clone the repository:

```bash
git clone https://github.com/mustafaerendalgic/sebat.git
cd sebat
```

Install dependencies:

```bash
flutter pub get
```

Check the development environment:

```bash
flutter doctor
```

Run the application:

```bash
flutter run
```

---

## Project Status

Sebat is an early-stage project and is not ready for production use.

The current priority is establishing the user experience and core application structure. Functionality will be introduced incrementally as the note model, storage layer, capture services, and AI workflow are designed.

Because the project is still evolving:

* APIs may change.
* Screens may be redesigned.
* Folder structure may be refactored.
* Features may be added, removed, or re-scoped.
* Setup instructions may change.

---

## Roadmap

* [x] Establish the Flutter project structure
* [x] Create the initial visual design system
* [x] Build the main navigation structure
* [x] Create initial Home, Archive, AI, and Account screens
* [ ] Implement the focus-session lifecycle
* [ ] Design the persistent note data model
* [ ] Add manual note creation and editing
* [ ] Add microphone-based note capture
* [ ] Add camera access and OCR text extraction
* [ ] Add note search and filtering
* [ ] Integrate the AI question-answering workflow
* [ ] Add multi-note comparison and analysis
* [ ] Add local persistence and synchronization strategy
* [ ] Improve accessibility and responsive layouts
* [ ] Add automated tests
* [ ] Prepare the first test release

---

## Design Principles

Sebat is being developed around several product principles:

### Low-Friction Capture

Taking a note should not interrupt reading, studying, or research.

### Context Before Volume

Notes should remain connected to the subject or session in which they were created.

### Calm Interface

The visual experience should support concentration rather than compete for attention.

### AI as an Analytical Layer

AI should help users understand their own material, not replace the process of learning.

### Transparent Development

Features that are planned but not yet implemented are documented as future work rather than presented as completed functionality.

---

## Contributing

The project is currently in active personal development. Issues, ideas, and constructive feedback are welcome.

Before submitting a pull request:

1. Create a dedicated feature branch.
2. Keep changes focused and clearly scoped.
3. Run static analysis.
4. Test the affected screens.
5. Describe the reason for the change in the pull request.

```bash
flutter analyze
flutter test
```

---

## License

No license has been added yet.

Until a license is included, the source code remains protected by default copyright law and should not be assumed to be available for redistribution or commercial use.

---

## Author

Developed by [Mustafa Eren Dalgıç](https://github.com/mustafaerendalgic).

---

<div align="center">

**Sebat is being built to turn focused work into connected knowledge.**

</div>
::: ​​

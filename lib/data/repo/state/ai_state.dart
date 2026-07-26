sealed class AiState {}

class InitialAiState extends AiState {}

class ThinkingState extends AiState {
  final String prompt;
  ThinkingState({required this.prompt});
}

class SuccessState extends AiState {
  final String prompt;
  final String answer;
  SuccessState({required this.prompt, required this.answer});
}

class FailureState extends AiState {
  final String failureMessage;
  FailureState({required this.failureMessage});
}

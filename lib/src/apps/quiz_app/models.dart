enum QuestionType { multiple, boolean }

enum QuestionDifficulty { any, easy, medium, hard }

class Category {
  final int id;
  final String name;
  final dynamic icon;

  Category(this.id, this.name, {this.icon});
}

class Question {
  final String categoryName;
  final QuestionType type;
  final QuestionDifficulty difficulty;
  final String question;
  final String correctAnswer;
  final List<dynamic> incorrectAnswers;

  Question({
    this.categoryName,
    this.type,
    this.difficulty,
    this.question,
    this.correctAnswer,
    this.incorrectAnswers,
  });

  Question.fromMap(Map<String, dynamic> data)
      : categoryName = data["category"],
        type = data["type"] == "multiple" ? QuestionType.multiple : QuestionType.boolean,
        difficulty = data["difficulty"] == "easy"
            ? QuestionDifficulty.easy
            : data["difficulty"] == "medium" ? QuestionDifficulty.medium : QuestionDifficulty.hard,
        question = data["question"],
        correctAnswer = data["correct_answer"],
        incorrectAnswers = data["incorrect_answers"];

  static List<Question> fromData(List<Map<String, dynamic>> data) {
    return data.map((question) => Question.fromMap(question)).toList();
  }
}

extension QuestionDifficultyExt on QuestionDifficulty {
  String get asString {
    switch (this) {
      case QuestionDifficulty.easy:
        return 'Easy';
      case QuestionDifficulty.medium:
        return 'Medium';
      case QuestionDifficulty.hard:
        return 'Hard';
      //case QuestionDifficulty.any:
      default:
        return 'Any';
    }
    //return 'Any';
  }
}

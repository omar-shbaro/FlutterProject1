import 'package:flutter/material.dart';
import 'resultscreen.dart';
class TriviaQuizGame extends StatefulWidget {
  @override
  _TriviaQuizGameState createState() => _TriviaQuizGameState();
}

class _TriviaQuizGameState extends State<TriviaQuizGame> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  List<Map<String, dynamic>> _quizData = [

    {
      'question': 'Which programming language is often used for developing Android applications?',
      'answers': ['Java', 'C++', 'Python', 'JavaScript'],
      'correctAnswer': 'Java'
    },

    {
      'question': 'What does CSS stand for in web development?',
      'answers': ['Cascading Style Sheets', 'Computer Style Sheets', 'Creative Style Sheets', 'Colorful Style Sheets'],
      'correctAnswer': 'Cascading Style Sheets'
    },
    {
      'question': 'What does HTML stand for?',
      'answers': ['Hyper Text Markup Language', 'Hyperlinks and Text Markup Language', 'Home Tool Markup Language', 'Hyper Tool Markup Language'],
      'correctAnswer': 'Hyper Text Markup Language'
    },
    {
      'question': 'What does IDE stand for in the context of programming?',
      'answers': ['Integrated Development Environment', 'Interactive Design Environment', 'Interface Design Experience', 'Intermediary Development Environment'],
      'correctAnswer': 'Integrated Development Environment'
    },
    {
      'question': 'Which company developed the programming language Swift?',
      'answers': ['Google', 'Microsoft', 'Apple', 'Mozilla'],
      'correctAnswer': 'Apple'
    },
    {
      'question': 'What is the term for a variable that is accessible only within the scope of the function where it is defined?',
      'answers': ['Local variable', 'Global variable', 'Restricted variable', 'Scoped variable'],
      'correctAnswer': 'Local variable'
    },
    {
      'question': 'Which data structure uses First In, First Out (FIFO) principle?',
      'answers': ['Stack', 'Queue', 'Tree', 'Heap'],
      'correctAnswer': 'Queue'
    },
    {
      'question': 'What does HTTP stand for in web development?',
      'answers': ['HyperText Transfer Protocol', 'Hyperlink Transmission Protocol', 'High Transfer Text Protocol', 'HyperText Transmission Protocol'],
      'correctAnswer': 'HyperText Transfer Protocol'
    },
    {
      'question': 'Which programming language is often used for machine learning and artificial intelligence?',
      'answers': ['Java', 'C#', 'Python', 'Ruby'],
      'correctAnswer': 'Python'
    },
    {
      'question': 'What does JSON stand for in web development?',
      'answers': ['JavaScript Object Notation', 'JavaScript Object Network', 'JavaScript Object Naming', 'JavaScript Oriented Notation'],
      'correctAnswer': 'JavaScript Object Notation'
    },
    {
      'question': 'What does OOP stand for in programming?',
      'answers': ['Object-Oriented Programming', 'Object-Oriented Protocol', 'Object-Oriented Process', 'Object-Oriented Practice'],
      'correctAnswer': 'Object-Oriented Programming'
    },
    {
      'question': 'In object-oriented programming, what is the term used to describe a blueprint for creating objects?',
      'answers': ['Template', 'Prototype', 'Instance', 'Class'],
      'correctAnswer': 'Class'
    },
  ];

  void _checkAnswer(String selectedAnswer) {
    String correctAnswer = _quizData[_currentQuestionIndex]['correctAnswer'];
    setState(() {
      if (selectedAnswer == correctAnswer) {
        bool isAnswerCorrect = true;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(isCorrect: isAnswerCorrect),
          ),
        );
        _score++;
      }
      else{
        bool isAnswerCorrect = false;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(isCorrect: isAnswerCorrect),
            ),
        );
      }
      _nextQuestion();
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _quizData.length - 1) {
        _currentQuestionIndex++;
      } else {
        _showResultDialog();
      }
    });
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!\nQuiz Finished!'),
          content: Text('Your Score: $_score/${_quizData.length}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _resetQuiz();
                Navigator.of(context).pop();
              },
              child: Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Trivia Quiz'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'images/pic.jpg',
            width: 300,
            height: 280,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Question ${_currentQuestionIndex + 1}/${_quizData.length}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    _quizData[_currentQuestionIndex]['question'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(height: 20.0),
                  Column(
                    children: <Widget>[
                      for (String answer in _quizData[_currentQuestionIndex]['answers'])
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: ElevatedButton(
                            onPressed: () {
                              _checkAnswer(answer);
                            },
                            child: Text(answer),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent)
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


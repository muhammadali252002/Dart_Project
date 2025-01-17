import 'dart:io';

// A list to store books in the library (with some initial books)
List<Map<String, dynamic>> books = [
  {
    'title': 'The Hobbit',
    'author': 'J.R.R. Tolkien',
    'isAvailable': true,
  },
  {
    'title': '1984',
    'author': 'George Orwell',
    'isAvailable': true,
  },
  {
    'title': 'Moby Dick',
    'author': 'Herman Melville',
    'isAvailable': true,
  },
];

void addBook(String title, String author) {
  books.add({
    'title': title,
    'author': author,
    'isAvailable': true, // Initially, all books are available
  });
}

void borrowBook(String title) {
  for (var book in books) {
    if (book['title'] == title && book['isAvailable']) {
      book['isAvailable'] = false; // Mark the book as borrowed
      print('You have borrowed: "$title"');
      return;
    }
  }
  print('Sorry, the book "$title" is not available.');
}

void returnBook(String title) {
  for (var book in books) {
    if (book['title'] == title && !book['isAvailable']) {
      book['isAvailable'] = true; // Mark the book as returned
      print('You have returned: "$title"');
      return;
    }
  }
  print('This book was not borrowed or not found.');
}

void showAvailableBooks() {
  print('Available books in the library:');
  bool found = false;
  for (var book in books) {
    if (book['isAvailable']) {
      found = true;
      print('Title: "${book['title']}", Author: ${book['author']}');
    }
  }
  if (!found) {
    print('No books are currently available.');
  }
}

void main() {
  while (true) {
    // Menu for user interaction
    print('\nLibrary Management System');
    print('1. Add a Book');
    print('2. Borrow a Book');
    print('3. Return a Book');
    print('4. Show Available Books');
    print('5. Exit');
    stdout.write('Enter your choice: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        // Add a book
        stdout.write('Enter the book title: ');
        String? title = stdin.readLineSync();
        stdout.write('Enter the author name: ');
        String? author = stdin.readLineSync();

        if (title != null &&
            author != null &&
            title.isNotEmpty &&
            author.isNotEmpty) {
          addBook(title, author);
          print('Book "$title" by $author added to the library.');
        } else {
          print('Invalid input. Please try again.');
        }
        break;
      case '2':
        // Borrow a book
        stdout.write('Enter the title of the book you want to borrow: ');
        String? borrowTitle = stdin.readLineSync();

        if (borrowTitle != null && borrowTitle.isNotEmpty) {
          borrowBook(borrowTitle);
        } else {
          print('Invalid input. Please try again.');
        }
        break;
      case '3':
        // Return a book
        stdout.write('Enter the title of the book you want to return: ');
        String? returnTitle = stdin.readLineSync();

        if (returnTitle != null && returnTitle.isNotEmpty) {
          returnBook(returnTitle);
        } else {
          print('Invalid input. Please try again.');
        }
        break;
      case '4':
        // Show available books
        showAvailableBooks();
        break;
      case '5':
        // Exit the program
        print('Exiting the Library Management System. Goodbye!');
        return;
      default:
        print('Invalid choice! Please select a valid option.');
    }
  }
}

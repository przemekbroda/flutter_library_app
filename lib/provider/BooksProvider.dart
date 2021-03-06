import 'package:library_flutter_app/model/Book.dart';

class BooksProvider {

  List<Book> get books {
    return [
      Book(1, "Muscle", "Alan Trotter", "assets/images/muscle.jpg", "In a hard-boiled city of crooks, grifts and rackets lurk a pair of toughs. They're the kind of men capable of extracting apologies and reparations, of teaching you a chilling lesson. They seldom think twice, and ask very few questions. Until one night over the poker table, they encounter a pulp writer with wild ideas and an unscrupulous private detective, leading them into what is either a classic mystery, a senseless maze of corpses, or an inextricable fever dream. Drunk on cinematic and literary influence, Muscle is a slice of noir fiction in collapse, a ceaselessly imaginative story of violence, boredom and madness."),
      Book(2, "Dominicana", "Angie Cruz", "assets/images/dominicana.jpg", "In a hard-boiled city of crooks, grifts and rackets lurk a pair of toughs. They're the kind of men capable of extracting apologies and reparations, of teaching you a chilling lesson. They seldom think twice, and ask very few questions. Until one night over the poker table, they encounter a pulp writer with wild ideas and an unscrupulous private detective, leading them into what is either a classic mystery, a senseless maze of corpses, or an inextricable fever dream. Drunk on cinematic and literary influence, Muscle is a slice of noir fiction in collapse, a ceaselessly imaginative story of violence, boredom and madness."),
      Book(3, "Silmarillion", "J. R. R. Tolkien", "assets/images/silmarillion.jpg", "In a hard-boiled city of crooks, grifts and rackets lurk a pair of toughs. They're the kind of men capable of extracting apologies and reparations, of teaching you a chilling lesson. They seldom think twice, and ask very few questions. Until one night over the poker table, they encounter a pulp writer with wild ideas and an unscrupulous private detective, leading them into what is either a classic mystery, a senseless maze of corpses, or an inextricable fever dream. Drunk on cinematic and literary influence, Muscle is a slice of noir fiction in collapse, a ceaselessly imaginative story of violence, boredom and madness."),
    ];
  }

  Book getBookById(int id) {
    return books.firstWhere((element) => element.id == id);
  }
}
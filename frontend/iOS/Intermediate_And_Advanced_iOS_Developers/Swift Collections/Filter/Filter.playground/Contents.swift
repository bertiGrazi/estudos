import UIKit

var names = ["Alex", "John", "Steven", "Mary"]

//Want only names with 4 letters
names = names.filter { name -> Bool in
    return name.count > 4
}
print(names)


struct Movie {
    let title: String
    let genre: String
}

var movies = [
    Movie(title: "Lord of Rings", genre: "Fiction"),
    Movie(title: "Harry Potter", genre: "Fiction"),
    Movie(title: "The Batman", genre: "Fiction"),
    Movie(title: "Finding Nedo", genre: "Kids"),
    Movie(title: "Cars", genre: "Kids"),
]

////we only want kids movies
let kidMovies = movies.filter { movie -> Bool in
    return movie.genre == "Kids"
}

print(kidMovies)

//delete movie
let movieToRemove =  Movie(title: "Finding Nedo", genre: "Kids")

movies = movies.filter { movie -> Bool in
    return movie.title != movieToRemove.title
}
print("\n\n\n")
print(movies)

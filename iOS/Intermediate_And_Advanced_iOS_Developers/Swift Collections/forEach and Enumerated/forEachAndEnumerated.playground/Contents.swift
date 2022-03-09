import UIKit

struct Movie {
    let title: String
    let genre: String
}

let movies = [
    Movie(title: "Lord of Rings", genre: "Fiction"),
    Movie(title: "Harry Potter", genre: "Fiction"),
    Movie(title: "The Batman", genre: "Fiction"),
    Movie(title: "Finding Nedo", genre: "Kids"),
    Movie(title: "Cars", genre: "Kids"),
]

movies.forEach { movie in
    addFavoriteList(movie)
}

func addFavoriteList(_ movie: Movie) {
    
}

movies.forEach { (movie) in
    print(movie.title)
}

//enumerated
movies.enumerated().forEach { (index, movie) in
    print("\nMovie at \(index) has a title \(movie.title)")
}

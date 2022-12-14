require './book/create_book'
require './game/create_game'
require_relative './label/label_module'
require_relative './book/book_module'
require_relative './game/game_module'
require_relative './author/author_module'
require_relative './store/preserve_book'
require_relative './store/preserve_game'
require_relative './store/preserve_label'
require_relative './store/preserve_author'
require_relative './music/methods'
require_relative './genre/methods'

class Options
  include LabelModule
  include BookModule
  include GameModule
  include AuthorModule
  include BooksPreserve
  include GamesPreserve
  include LabelsPreserve
  include AuthorsPreserve

  def initialize
    @books = load_books
    @labels = load_labels
    @games = load_games
    @authors = load_authors
    @executeBook = CreateBook.new(@books, @labels)
    @executeGame = CreateGame.new(@games, @authors)
    @music_albums = RunMusic.load_music_albums
    @genre_list = RunGenre.load_genre
  end

  def show_options
    puts ['1 - List all books',
          '2 - List all music albums',
          '3 - List of games',
          '4 - List all genre',
          '5 - List all labels',
          '6 - List all authors',
          '7 - Add a book',
          '8 - Add a music album',
          '9 - Add a game',
          '0 - quit!']
  end

  def chosen_value(value)
    case value
    when '1'
      list_all_books
    when '2'
      RunMusic.list_all_music_album(@music_albums)
    when '3'
      list_games
    when '4'
      RunGenre.list_all_genres(@genre_list)
    when '5'
      list_all_labels
    when '6'
      list_authors
    when '7'
      @executeBook.add_book
    when '8'
      RunMusic.add_music_album(@music_albums, @genre_list)
    when '9'
      @executeGame.add_game
    else
      puts 'Please enter a number between 1 and 0.'
    end
  end
end

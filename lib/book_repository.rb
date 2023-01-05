require_relative "./book"

class BookRepository
  def all
    books = []
    sql = "SELECT id, title, author_name FROM books;"
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |element|
      book = Book.new
      book.id = element["id"]
      book.title = element["title"]
      book.author_name = element["author_name"]
      books << book
    end
    return books
  end

  def find(id)
    sql = "SELECT id, title, author_name FROM books WHERE id = '#{id}';"
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |element|
      single_book = Book.new
      single_book.id = element["id"]
      single_book.title = element["title"]
      single_book.author_name = element["author_name"]
      return single_book
    end
  end
end

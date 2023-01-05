require "book_repository"
require "book"

describe BookRepository do
  def reset_books_table
    seed_sql = File.read("spec/seeds_books.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "book_store_test" })
    connection.exec(seed_sql)
  end

  before(:each) { reset_books_table }

  it "returns all books in table" do
    repo = BookRepository.new
    all_books = repo.all
    expect(all_books.length).to eq 2
    expect(all_books[0].id).to eq "1"
    expect(all_books[0].title).to eq "Pastoralia"
    expect(all_books[0].author_name).to eq "George Saunders"
    expect(all_books[1].id).to eq "2"
    expect(all_books[1].title).to eq "Barrows Boys"
    expect(all_books[1].author_name).to eq "Fergus Fleming"
  end

  it "returns a single book when passed id" do
    repo = BookRepository.new
    single_book = repo.find(1)
    expect(single_book.id).to eq "1"
    expect(single_book.title).to eq "Pastoralia"
    expect(single_book.author_name).to eq "George Saunders"
  end
end

require_relative 'lib/database_connection'
require_relative 'lib/book_repository'

DatabaseConnection.connect('book_store')

book_repository = BookRepository.new

book_list = book_repository.all  #.sort_by {|hash| hash.id.to_i}

book_list.each do |book|
  puts "#{book.id}".ljust(3) + "- #{book.title}".ljust(25) + "- #{book.author_name}".ljust(5)
end

# # Perform a SQL query on the database and get the result set.

# sql = 'SELECT examplecolumn1, examplecolumn2, etc FROM exampletablename;'
# result = DatabaseConnection.exec_params(sql, [])

# # Print out each record from the result set .
# result.each do |record|
#   p record
# end
after 'development:publishers', 'development:authors' do
  logger = Logger.new(STDOUT)

  csv_text = File.read(Rails.root.join('db', 'seeds', 'books.csv'))
  csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')

  csv.each do |row|
    c = Book.new
    c.author = Author.find_by!(name: row['name'])
    c.title = row['title']
    c.isbn = row['isbn']
    c.publishing_year = row['publishing_year']
    c.save!
  end

  logger.info "#{Book.count} Book created"
end

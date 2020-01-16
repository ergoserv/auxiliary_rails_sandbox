logger = Logger.new(STDOUT)

csv_text = File.read(Rails.root.join('db', 'seeds', 'authors.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')

csv.each do |row|
  Author.create!(
    name: row['name'],
  )
end

logger.info "#{Author.count} Authors created"

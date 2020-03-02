class BookForm < ApplicationForm
  attribute :title, :string
  attribute :isbn, :string
  attribute :publishing_year, :integer
  attribute :publisher_name, :string

  attr_reader :book


  def perform
    publisher =  Publisher.find_or_create_by!(name: publisher_name)
    book = publisher.books.create(title: title, isbn: isbn, publishing_year: publishing_year)

    return failure! if book.invalid?

    success!
  end
end

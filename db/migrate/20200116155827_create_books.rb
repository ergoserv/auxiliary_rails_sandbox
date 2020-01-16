class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.belongs_to :publisher, foreign_key: true
      t.string :title
      t.string :isbn
      t.integer :publishing_year

      t.timestamps
    end
  end
end

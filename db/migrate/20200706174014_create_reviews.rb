class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :user_id
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :book_id
      t.belongs_to :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end

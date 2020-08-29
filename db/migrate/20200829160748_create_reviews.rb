class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :author
      t.string :image_url
      t.string :link
      t.string :body

      t.timestamps
    end
  end
end

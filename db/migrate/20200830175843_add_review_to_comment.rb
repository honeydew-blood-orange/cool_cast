class AddReviewToComment < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :review, foreign_key: true
  end
end

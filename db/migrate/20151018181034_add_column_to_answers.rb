class AddColumnToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :post_id, :integer
  end
end

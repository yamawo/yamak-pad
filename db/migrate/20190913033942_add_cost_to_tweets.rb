class AddCostToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :cost, :string
  end
end

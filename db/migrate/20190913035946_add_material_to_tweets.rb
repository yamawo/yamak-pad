class AddMaterialToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :material, :string
  end
end

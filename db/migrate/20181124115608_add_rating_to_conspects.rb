class AddRatingToConspects < ActiveRecord::Migration[5.2]
  def change
    add_column :conspects, :rating, :integer, default: 0
  end
end

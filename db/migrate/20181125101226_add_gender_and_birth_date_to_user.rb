class AddGenderAndBirthDateToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :string, default: "Not specified"
    add_column :users, :date_of_birth, :date, default: nil
  end
end

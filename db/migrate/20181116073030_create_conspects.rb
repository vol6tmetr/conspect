class CreateConspects < ActiveRecord::Migration[5.2]
  def change
    create_table :conspects do |t|
      t.string :title
      t.string :description
      t.integer :speciality_number
      t.text :content
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end

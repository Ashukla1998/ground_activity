class CreateGrounds < ActiveRecord::Migration[7.1]
  def change
    create_table :grounds do |t|
      t.string :name

      t.timestamps
    end
  end
end

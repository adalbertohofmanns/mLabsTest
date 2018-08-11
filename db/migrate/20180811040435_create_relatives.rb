class CreateRelatives < ActiveRecord::Migration[5.2]
  def change
    create_table :relatives do |t|
      t.string :name
      t.string :kinship
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings do |t|
      t.references :order, foreign_key: true
      t.references :menu_item, foreign_key: true

      t.timestamps
    end
  end
end

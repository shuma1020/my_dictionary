class CreateManages < ActiveRecord::Migration[6.0]
  def change
    create_table :manages do |t|
      t.references :genre
      t.references :post
      t.timestamps
    end
  end
end

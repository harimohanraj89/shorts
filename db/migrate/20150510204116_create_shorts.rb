class CreateShorts < ActiveRecord::Migration
  def change
    create_table :shorts do |t|
      t.text :url
      t.string :short

      t.timestamps
    end
  end
end

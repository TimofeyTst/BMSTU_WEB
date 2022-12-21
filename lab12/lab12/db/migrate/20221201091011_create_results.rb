class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.integer :upper
      t.string :palindroms

      t.timestamps
    end
  end
end

class CreatePalindroms < ActiveRecord::Migration[7.0]
  def change
    create_table :palindroms do |t|
      t.integer :upper
      t.text :result

      t.timestamps
    end
  end
end

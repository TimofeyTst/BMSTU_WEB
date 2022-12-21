class AddUniqIndexForPalindrom < ActiveRecord::Migration[7.0]
  def change
    add_index :palindroms, :upper, unique: true
  end
end

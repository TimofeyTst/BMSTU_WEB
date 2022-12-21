class AddUniqIndexForResults < ActiveRecord::Migration[7.0]
  def change
    add_index :results, :upper, :unique => true
  end
end

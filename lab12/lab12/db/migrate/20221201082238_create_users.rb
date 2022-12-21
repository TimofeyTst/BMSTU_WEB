class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.datetime :last_login

      t.timestamps
    end
  end
end

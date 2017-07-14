class Adding < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :bio, :text
    add_column :contacts, :middle_name, :string
    


  end
end

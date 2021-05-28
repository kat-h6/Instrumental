class AddOccupationAndAboutMeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :occupation, :string
    add_column :users, :about_me, :text
  end
end

class ChangeNullOnPolAgeColumnOnUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :age, true
    change_column_null :users, :political_affiliation, true
  end
end

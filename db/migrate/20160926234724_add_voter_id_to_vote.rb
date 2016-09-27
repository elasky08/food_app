class AddVoterIdToVote < ActiveRecord::Migration[5.0]
  def change
    add_reference :votes, :voter, foreign_key: {to_table: :users}
    add_reference :votes, :voted, foreign_key: {to_table: :users}
    remove_column :votes, :user_id
  end
end

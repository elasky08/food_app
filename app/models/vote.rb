class Vote < ApplicationRecord
  belongs_to :voter, {class_name: "User", foreign_key: :voter_id} # user who cast the vote
  belongs_to :voted, {class_name: "User", foreign_key: :voted_id} # user who is receiving the vote
end

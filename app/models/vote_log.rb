class VoteLog < ApplicationRecord
  belongs_to :candidate, counter_cache: true
end

# counter_cache: true -> 會在寫入這張票數的同時，做更新票數的動作(更新在schema.rb的vote_logs_count這個欄位)。

class AddCounterCacheToCandidate < ActiveRecord::Migration[6.0]
  def change
    # 了解此方法要接什麼參數：https://apidock.com/rails/ActiveRecord/ConnectionAdapters/SchemaStatements/add_column
    add_column :candidates, :vote_logs_count, :integer, default: 0
  end
end

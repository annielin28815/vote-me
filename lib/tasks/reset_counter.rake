namespace :db do 
  desc 'Reset Counter Cache!'
  task :reset_counter => :environment do
    puts "prepare to reset counter"
    Candidate.all.each do |candidate|
      Candidate.reset_counters(candidate.id, :vote_logs)
    end
    puts "done!"
  end
end

# 為了解決在引入counter_cache後，票數不一致的問題，可在google搜尋rails api reset counter cache，尋找解決方法。
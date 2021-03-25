require 'csv'
namespace :users do
  desc "Import users"
  task import_csv: :environment do
    filename = File.read("test-users.csv")
    csv = CSV.parse(filename, :headers => true)
    puts csv.to_s
    csv.each do |row|
      User.create!(row.to_hash)
    end
  end
end

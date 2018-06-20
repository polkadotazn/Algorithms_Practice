require 'open-uri'
require 'csv'
require 'json'
require 'fileutils'


download = JSON.parse(open('http://skillz.com/games.json').read)

CSV.open("file.csv", "w") do |csv|
  download.each do |k, v|
    csv << [k, v]
  end
end
output = []
game_info = download["resultReferences"]
game_info.each do |k, v|
  hash = {}
  presence = "y"
  img = k["icon_url"]
  size = 0
  p_f = "pass"
  if img.is_a?(String)
    download = open("#{k["icon_url"]}")
    IO.copy_stream(download, "../../Desktop/icons2/#{Time.now}.png")
    size = img.size
    unless img[-3..-1] == "png" && img.size > 0
      p_f = "fail"
    end
  else
    presence = "n"
    p_f = "false"
  end
  hash["game id"] = k["id"]
  hash["game name"] = k["title"]
  hash["presence"] = presence
  hash["size"] = size
  hash["pass/fail"] = p_f
  output << hash
end

p output

FileUtils::mkdir_p "../../Desktop/icons2"
# directory_name = "~/Desktop/icons2"
# Dir.mkdir(directory_name) unless File.exists?(directory_name)
#
# out_file = File.new("out.csv", "w")
# download.each do |k, v|
#   File.open("out.csv", )
# csv_string = CSV.generate do |csv|
#   download.each do |k,v|
#     csv << v
#   end
# end

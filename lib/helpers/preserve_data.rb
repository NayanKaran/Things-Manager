def save_data(data, file)
  json = JSON.generate(data)
  File.write("./data/#{file}.json", json)
end

def recover_data(file)
  return unless File.exist?("./data/#{file}.json") == true

  json = File.read("./data/#{file}.json")
  JSON.parse(json, create_additions: true)
end

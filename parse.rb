require 'json'

#puts Dir.pwd

pipe = IO.popen("apcaccess")

upsdata_h = {}
data = []

loop do 

  pipe = IO.popen("apcaccess")
  upsdata_h[:ups] = {}
  data = []

  while (line = pipe.gets)
    data = line.split(':')
    upsdata_h[:ups][data[0].strip] = data[1].strip
  end

  puts "Internal temperature: #{upsdata_h[:ups]['ITEMP']}"

  File.open("upsdata.json", "w") do |f|
    f.write(upsdata_h.to_json)
  end
  
  sleep 5 

end

pipe.close




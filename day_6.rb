def parse_direction(input)
  direction = input.scan(/\d+,\d+/).map { |coord| coord.gsub(/,/, "").to_i }
  if input.include? "turn on"
    direction << "on"
  elsif input.include? "turn off"
    direction << "off"
  elsif input.include? "toggle"
    direction << "toggle"
  end
  direction
end

def parse_directions_list(input)
  formatted_directions = []
  input.each do |direction|
    formatted_directions << parse_direction(direction)
  end
  formatted_directions
end

p parse_direction("turn on 489,959 through 759,964") == [489959, 759964, "on"]
p parse_direction("turn off 820,516 through 871,914") == [820516, 871914, "off"]
p parse_direction("toggle 756,965 through 812,992") == [756965, 812992, "toggle"]
dir_input = ["turn on 489,959 through 759,964", "turn off 820,516 through 871,914", "turn off 427,423 through 929,502", "turn on 774,14 through 977,877", "turn on 410,146 through 864,337"]
dir_output = [[489959, 759964, "on"], [820516, 871914, "off"], [427423, 929502, "off"], [77414, 977877, "on"], [410146, 864337, "on"]]
p parse_directions_list(dir_input) == dir_output


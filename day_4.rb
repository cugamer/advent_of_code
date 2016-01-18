# Code day 4: http://adventofcode.com/day/4

require 'digest'

md5 = Digest::MD5.new

md5.update('abcdef609043')
p md5.hexdigest == '000001dbbfa3a5c83a2d506429c7b00e'

def get_hash(key)
  start = 0
  while(true)
    combined = key + start.to_s
    md5 = Digest::MD5.new
    md5.update(combined)
    hash = md5.hexdigest
    if(hash[0..4] == "00000")
      return [combined, hash]
    else
      start += 1
    end
  end
end

p get_hash("abcdef") == ["abcdef609043", "000001dbbfa3a5c83a2d506429c7b00e"]
p get_hash("ckczppom")
require 'json'

#x Integer
def ten_interval(x)
    i_min = (x/10).round * 10
    i_max = i_min + 9
    return "#{i_min}-#{i_max}"
end

input = JSON.parse(ARGV[0],symbolize_names: true)
output = { :ranges => {}, :top => [], :calculations => [] }
average = {}
max = 0
starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)

input.each do |i|
    interval = ten_interval(i[:amount])
    if output[:ranges][interval].nil? 
        output[:ranges][interval] = {:average => i[:amount] , :ids => [i[:id]]}
        average[interval] = i[:amount].to_f     
    else  
        output[:ranges][interval][:ids] << i[:id]
        average[interval] =  average[interval] + i[:amount].to_f
        output[:ranges][interval][:average] = ( average[interval] / output[:ranges][interval][:ids].length).round(half: :up)
    end
       
    if max < i[:amount]
        max = i[:amount]
        output[:top] = [i[:id]]
    end
end

ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)

puts "EXECUTION TIME: #{ending - starting} s"
puts output.to_json

#by Max Williams, toastkid.williams@gmail.com
class Golf
  def self.hole1(arr)
    arr.inject{|result, element| result * element}
  end
  
  def self.hole2(string)
    string.split(" ").sort_by{|s| s[1]}.join(" ")
  end
  
  def self.hole3(int)
    self.hole1((1..int).to_a)
  end
  
  def self.hole4(string_arr)
    string_arr.collect do |string|
      if string =~ /^man\(.*\)$/
        "hat(#{string})"
      elsif string =~ /^dog\(.*\)$/
        string.gsub(/\)$/,"(bone))")
      elsif string =~ /^cat\(.*\)$/
        string.gsub(/^cat/,"dead")
      else
        string
      end
    end
  end
  
  def self.hole5(arr)
    result = []
    (1..arr.size).to_a.each do |n|
      s, e = 0,n-1
      while e < arr.size
        result << arr[s..e]
        s += 1
        e += 1 
      end
    end 
    result
  end
  
  def self.hole6(int)
    (1..int).to_a.collect do |x| 
      s = ""
      s << "fizz" if x % 3 == 0 
      s << "buzz" if x % 5 == 0
      s = x if s == ""
      s
    end
  end
  
  def self.hole7(arr)
    result = []
    arr.each_with_index do |x,i|
      if  i > 0 && arr[i-1] == x - 1 
        if arr[i+1] == x + 1 
          result << "-"        
        else
          result += ["-", x]
        end
      else
        result << x
      end
    end
    result.each_with_index do |x,i| 
      if x == "-" && result[i+1] == "-"
        result.delete_at(i) 
      end
    end
    output = []
    i = 0
    while i < result.size
      if result[i+1] == "-"
        output << [result[i],result[i+1],result[i+2]].join
        i += 3
      else
        output << result[i].to_s
        i += 1
      end
    end
    output
  end  
  
  def self.hole8(n)
    fib = [1,1]
    (n-2).times do 
      fib << fib[-2] + fib[-1]
    end
    fib
  end
  
  def self.hole9(filename)
    votes = File.readlines(filename).collect{|line| line.chomp.split(/,\s+/)}
    winner = false
    until winner
      candidates = votes.flatten.uniq    
      vote_count = []
      candidates.each{|candidate| vote_count << [candidate, votes.select{|vote| vote.first == candidate}.size]}
      vote_count = vote_count.sort_by(&:last).reverse
      if vote_count[0][1] != vote_count[1][1] && vote_count[0][1] >= vote_count[1..-1].collect(&:last).inject{|res,el| res + el}
        winner = vote_count[0][0]
      else
        loser = vote_count[-1][0]
        votes.each{|vote| vote.delete(loser)}
      end
    end
    winner
  end
  
end

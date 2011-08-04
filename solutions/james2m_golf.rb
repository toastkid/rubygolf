#By James McCarthy, james2mccarthy@gmail.com
class Golf
  
  class << self
    
    def hole1(*numbers)
     numbers.flatten.inject(1) {|sum, n| sum * n }
    end
    
    def hole2(string)
      string.split(' ').sort { |a , b| a[1] <=> b[1] }.join(' ')
    end
    
    def hole3(num)
      (1..(num - 1)).to_a.reverse.inject(num) { |sum, n| sum * n }
    end
    
    def hole4(*strings)
      strings.flatten.map do |string| 
        case string
        when /^man.*/ then "hat(#{string})" 
        when /^dog.*/ then string.gsub(/\)$/, '(bone))')
        when /^cat.*/ then string.gsub(/^cat/, 'dead') 
        end
      end
    end
    
    def hole6(int)
      Array.new(int) do |i|
        i += 1 and val = ''
        val << 'fizz' if i % 3 == 0
        val << 'buzz' if i % 5 == 0
        val.empty? ? i : val
     end
     
   end
   
   def hole7(numbers)
     start = last = numbers.shift
     numbers.collect do |current|
       if last == (current - 1) && numbers.last != current
         last = current
         nil
       else
         fin = numbers.last == current ? current : last
         val = start == fin ? fin.to_s : [start, fin].join('-')
         last = start = current
         val
       end
     end.compact
   end
    
    def hole8(num)
      fib = lambda { |n, fib| n < 3 ? 1 : fib.call(n - 1, fib) + fib.call(n - 2, fib) }
      Array.new(num) { |n| fib.call(n+1, fib) }
    end
    
  end
  
  
end

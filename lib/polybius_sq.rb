module PolybiusSq
  # replace first elt with second elt
  private_class_method def self.check_replace_char(inchar)
    begin
      if inchar.length != 1
        raise ArgumentError, "elts of replace should be strings of length 1!"
        end
      rescue
        raise ArgumentError, "elts of replace should be strings!" unless inchar.is_a?(String)
      end
    end
  
  private_class_method def self.check_replace(replace=['j','i'])
    begin
      if replace.length != 2
        raise ArgumentError, "replace argt should be array of 2 strings!"
      else
        unless replace.is_a?(Array)
          raise ArgumentError, "replace argt should be an array!"
        else
          replace.map{|x| check_replace_char(x)}
      end
      end   
    rescue
      raise ArgumentError, "replace argt not an array!"
    end
    end
 
  private_class_method def self.sanitize(input, replace=['j','i'])
    return input.downcase.tr('^a-z0-9\s', '').sub(replace[0], replace[1])
    end
 
  def self.encode(input, replace=['j','i'])
    check_replace(replace)
    sanitized = sanitize(input, replace)
    replaced = replace[0].downcase.ord - 'a'.ord
    return sanitized.split("").map{
      |x| cur_val = x.ord - 'a'.ord
               if cur_val >= replaced
                 cur_val -= 1
                 end
               left_val = (cur_val/5.0).floor + 1
               right_val = (cur_val % 5) + 1
               [left_val, right_val]}
    end

  def self.decode(input, replace=['j','i'])
    check_replace(replace)
    replaced = replace[0].downcase.ord
    begin
      ltr_arr = input.map{
        |pair|
        if pair[0] <= 0 or pair[0] > 5 or pair[1] <= 0 or pair[1] > 5
          raise ArgumentError, "input out of range"
        end
        cur_row = ((pair[0]-1) * 5)
        cur_col = pair[1] -1
        cur_val = cur_row + cur_col + 'a'.ord
        if cur_val >= replaced
          cur_val += 1
        end
        cur_val.chr}
      return ltr_arr.join
    rescue
      raise ArgumentError, "improper input"
    end
  end
end  

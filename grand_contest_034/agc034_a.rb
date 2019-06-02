class Agc034A
  def self.input()
    _, a, b, c, d = STDIN.gets.to_s.chomp.split(/ /)
    line_map = STDIN.gets()
    [a.to_i, b.to_i, c.to_i, d.to_i, line_map]
  end

  def self.output(result)
    puts (result ? "Yes": "No")
  end

  def self.non_duplicated_zone_check(start_i, end_i, line_map)
    part_of_line_map = line_map[start_i..end_i]
    line_map[start_i] == '.' && line_map[end_i] == '.' && !part_of_line_map.match(/##/)
  end

  def self.duplicated_zone_check(start_i, end_i, line_map, need_reverse)
    part_of_line_map = line_map[(start_i - 1)..(end_i + 1)]
    line_map[start_i] == '.' && line_map[end_i] == '.' && !part_of_line_map.match(/##/) &&
        (!need_reverse || !!part_of_line_map.match(/\.\.\./))
  end

  def self.have_duplicated_zone_calc(a,b,c,d,line_map)
    non_duplicated_zone_check([a,b].min,[a,b].max,line_map) &&
        non_duplicated_zone_check([c,d].min,[c,d].max,line_map) &&
        duplicated_zone_check([a,b].max,[c,d].min, line_map, d <= c)
  end

  def self.calc(a, b, c, d, line_map)
    a_i = a - 1
    b_i = b - 1
    c_i = c - 1
    d_i = d - 1
    return non_duplicated_zone_check(a_i,c_i,line_map) && non_duplicated_zone_check(b_i,d_i,line_map) if (c_i < b_i)
    return have_duplicated_zone_calc(a_i, b_i, c_i, d_i,line_map)
  end

  def self.main()
    a, b, c, d, line_map = input()
    result = calc(a,b,c,d,line_map)
    output(result)
  end
end

if __FILE__ == $0
  Agc034A.main
  exit
end
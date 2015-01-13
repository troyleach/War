def clear_screen!
  print "\e[2J"
end

def move_to_home!
  print "\e[H"
end

def reset_screen!
  clear_screen!
  move_to_home!
end

def wait
    sleep(0.7)
end

def line
  puts "- " * 30
end

def center_it
  line_width = 50
end



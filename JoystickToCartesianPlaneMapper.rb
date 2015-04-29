JOYSTICK_BORDER = 1023/2
CPLANE_BORDER = 1023/2

jx = ARGV[0].to_f
jy = ARGV[1].to_f

puts "----------------------"
puts "CPLANE_BORDER: " + CPLANE_BORDER.to_s
puts "----------------------"
puts "jx: " + jx.to_s
puts "jy: " + jy.to_s

x = JOYSTICK_BORDER * (jx / CPLANE_BORDER + 1)
y = JOYSTICK_BORDER * (jy / CPLANE_BORDER + 1)

puts ""
puts "Cartesian x: " + x.to_s
puts "Cartesian y: " + y.to_s

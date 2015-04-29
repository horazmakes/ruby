#                          |(0, CPLANE_BORDER)
#                          |
#                          |
#                          |
#                          |  (X_AXIS_THRESHOLD_FACTOR * CPLANE_BORDER, Y_AXIS_THRESHOLD_FACTOR * CPLANE_BORDER)
#             - - - - - - -|- - - - - - -
#                       |  |  |
#            -----------------------------
# (-CPLANE_BORDER, 0)   |  |  |          (CPLANE_BORDER, 0)
#             - - - - - - -|- - - - - - -
#                          |
#                          |
#                          |
#                          |
#                          |(0, -CPLANE_BORDER)

CPLANE_BORDER = 1023/2
MAX_TURN_LOSS_FACTOR = 0.5
X_AXIS_THRESHOLD_FACTOR = 0.25
Y_AXIS_THRESHOLD_FACTOR = 0.25

FULL_SPEED = 255.0
FORWARD = 1
BACKWARD = 0

x = ARGV[0].to_f
y = ARGV[1].to_f

puts "-------------------------"
puts "CPLANE_BORDER: " + CPLANE_BORDER.to_s
puts "MAX_TURN_LOSS_FACTOR: " + MAX_TURN_LOSS_FACTOR.to_s
puts "X_AXIS_THRESHOLD_FACTOR: " + X_AXIS_THRESHOLD_FACTOR.to_s
puts "Y_AXIS_THRESHOLD_FACTOR: " + Y_AXIS_THRESHOLD_FACTOR.to_s
puts "-------------------------"
puts ""
puts "x: " + x.to_s
puts "y: " + y.to_s

x_threshold = X_AXIS_THRESHOLD_FACTOR * CPLANE_BORDER
y_threshold = Y_AXIS_THRESHOLD_FACTOR * CPLANE_BORDER

if x.abs < x_threshold and y.abs < y_threshold
  puts "Case: Nothing to do"
  exit
end

if x.abs >= x_threshold and y.abs < y_threshold
  puts "Case: Full turn"

  full_turn_speed = FULL_SPEED * x / CPLANE_BORDER
  ls = full_turn_speed
  rs = -full_turn_speed
else
  puts "Case: Coordinates (not a full turn)"
  default_speed = FULL_SPEED * y / CPLANE_BORDER

  turn_factor = 1
  if x >= 0
    turn_factor -= MAX_TURN_LOSS_FACTOR * x / CPLANE_BORDER
  elsif x < 0
    turn_factor += MAX_TURN_LOSS_FACTOR * x / CPLANE_BORDER
  end

  if x >= 0
    ls = default_speed
    rs = turn_factor * default_speed
  elsif x < 0
    ls = turn_factor * default_speed
    rs = default_speed
  end
end

ld = ls < 0 ? 0 : 1
rd = rs < 0 ? 0 : 1

ls = ls.abs
rs = rs.abs

puts ""
puts "Left motor - " + "speed: " + ls.to_s + ", dir: " + (ld == FORWARD ? "FORWARD" : "BACKWARD")
puts "Right motor - " + "speed: " + rs.to_s + ", dir: " + (rd == FORWARD ? "FORWARD" : "BACKWARD")

# Angle Between Hands of a Clock

# Given two numbers, hour and minutes. Return the smaller angle (in degrees) formed between the hour and the minute hand.

# How to calculate the two angles with respect to 12:00?
# The minute hand moves 360 degrees in 60 minute(or 6 degrees in one minute) and hour hand moves 360 degrees in 12 hours(or 0.5 degrees in 1 minute). In h hours and m minutes, the minute hand would move (h*60 + m)*6 and hour hand would move (h*60 + m)*0.5.
 
# Constraints:
#
# 1 <= hour <= 12
# 0 <= minutes <= 59
# Answers within 10^-5 of the actual value will be accepted as correct.

def angle_clock(hour, minutes)
  h = hour
  m = minutes

  # The idea is to take 12:00 (h = 12, m = 0) as a reference. Following are detailed steps.
  # 1. Calculate the angle made by hour hand with respect to 12:00 in h hours and m minutes.
  # 2. Calculate the angle made by minute hand with respect to 12:00 in h hours and m minutes.
  # 3. The difference between the two angles is the angle between the two hands.

  # validate the input
  if (h < 0 || m < 0 || h > 12 || m > 60)
    print('Wrong input')
  end

  if (h == 12)
      h = 0
  end
  if (m == 60)
    m = 0
    h += 1
    if h>12
      h = h-12
    end
  end

  # Calculate the angles moved by
  # hour and minute hands with
  # reference to 12:00
  hour_angle = 0.5 * (h * 60 + m)
  minute_angle = 6 * m

  # Find the difference between two angles
  angle = (hour_angle - minute_angle).abs

  # Return the smaller angle of two
  # possible angles
  if angle > 360 - angle
    angle = 360 - angle
  end

  angle
end

hour = 12
minutes = 30
angle_clock(hour, minutes)
# Output: 165

hour = 3
minutes = 30
angle_clock(hour, minutes)
# Output: 75

hour = 3
minutes = 15
angle_clock(hour, minutes)
# Output: 7.5

hour = 4
minutes = 50
angle_clock(hour, minutes)
# Output: 155

hour = 12
minutes = 0
angle_clock(hour, minutes)
# Output: 0

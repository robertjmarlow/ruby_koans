require 'set'

# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  if (a == 0 || b == 0 || c == 0)
    raise TriangleError, "Triangle sides cannot be zero length"
  end

  if (a < 0 || b < 0 || c < 0)
    raise TriangleError, "Triangle sides cannot be negative length"
  end

  unless isATriangle(a, b, c)
    raise TriangleError, "A triangle with lengths of #{a}, #{b}, and #{c} is impossible"
  end

  sides = Set[a, b, c]

  if sides.length == 1
    return :equilateral
  elsif sides.length == 2
    return :isosceles
  else
    return :scalene
  end
end

def isATriangle(a, b, c)
  # thanks, wikihow! https://www.wikihow.com/Determine-if-Three-Side-Lengths-Are-a-Triangle
  return (a + b > c) && (a + c > b) && (b + c > a)
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end

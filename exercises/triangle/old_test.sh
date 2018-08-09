#!/usr/bin/env bats

# Test returns true if the triangle is equilateral

@test "true if all sides are equal" {
  skip
  run bash triangle.sh equilateral 222
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "false if any side is unequal" {
  skip
  run bash triangle.sh equilateral 232
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "false if no sides are equal" {
  skip
  run bash triangle.sh equilateral 546
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "All zero sides are illegal, so the triangle is not equilateral" {
  skip
  run bash triangle.sh equilateral 000
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

# Bonus: deal with floats

@test "sides may be floats" {
  skip
  run bash triangle.sh equilateral 0.50.50.5
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

# Test returns true if the triangle is isosceles

@test "true if last two sides are equal" {
  skip
  run bash triangle.sh isosceles 344
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "true if first two sides are equal" {
  skip
  run bash triangle.sh isosceles 443
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "true if first and last sides are equal" {
  skip
  run bash triangle.sh isosceles 434
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "equilateral triangles are also isosceles" {
  skip
  run bash triangle.sh isosceles 444
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "false if no sides are equal" {
  skip
  run bash triangle.sh isosceles 234
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "Sides that violate triangle inequality are not isosceles, even if two are equal" {
  skip
  run bash triangle.sh isosceles 113
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

# Bonus: deal with floats

@test "sides may be floats" {
  skip
  run bash triangle.sh isosceles 0.50.40.5
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

# Test returns true if the triangle is scalene

@test "true if no sides are equal" {
  skip
  run bash triangle.sh scalene 546
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}

@test "false if all sides are equal" {
  skip
  run bash triangle.sh scalene 444
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "false if two sides are equal" {
  skip
  run bash triangle.sh scalene 443
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

@test "Sides that violate triangle inequality are not scalene, even if they are all different" {
  skip
  run bash triangle.sh scalene 732
  [ "$status" -eq 0 ]
  [ "$output" == "false" ]
}

# Bonus: deal with floats

@test "sides may be floats" {
  skip
  run bash triangle.sh scalene 0.50.40.6
  [ "$status" -eq 0 ]
  [ "$output" == "true" ]
}


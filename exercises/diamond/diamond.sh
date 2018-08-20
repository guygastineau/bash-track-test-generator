#!/usr/bin/env bash

error () {
  printf "%s\n" "Invalid input" && exit 1
}

check_args () {
  [[ -z $1 || ${#1} -ne 1 || $# -ne 1 ]] && error
  [[ $1 != ${1//[![:upper:]]/} ]] && error
}

pad () {
  padding=$1

  x=1
  while [[ $x -le $padding ]]; do
    printf ' '
    ((x++))
  done
}

line_a () {
  padding=$(( line_width / 2 ))
  pad $padding
  printf 'A'
  pad $padding
  printf "\n"
}

up_to_max () {
  level=2
  int_padding=1 ext_padding=$(( line_width / 2 - 1 ))
  while [[ $level -le $max_level ]]; do
    letter="${from_idx_map[$level]}"
    pad $ext_padding
    printf "%s" "$letter"
    pad $int_padding
    printf "%s" "$letter"
    pad $ext_padding
    printf "\n"
    ((level++)); ((ext_padding--))
    int_padding=$(( int_padding + 2 ))
  done
}

down_to_last () {
  level=$(( max_level - 1 ))
  ext_padding=1 int_padding=$(( line_width - 4 ))
  while [[ $level -ge 2 ]]; do
    letter="${from_idx_map[$level]}"
    pad $ext_padding
    printf "%s" "$letter"
    pad $int_padding
    printf "%s" "$letter"
    pad $ext_padding
    printf "\n"
    ((level--)); ((ext_padding++))
    int_padding=$(( int_padding - 2 ))
  done
}

main () {
  check_args "$@"

  readonly LETTER="$1"

  [[ $1 == 'A' ]] && printf "%s\n" "A" && exit 0

  # make the maps
  declare -A to_idx_map from_idx_map

  i=1
  for letter in {A..Z}; do
    to_idx_map[$letter]=$i
    from_idx_map[$i]="$letter"
    ((i++))
  done

  readonly max_level=${to_idx_map[$LETTER]}
  readonly line_width=$(( max_level * 2 - 1 ))

  line_a # print the first line
  up_to_max # print up to $max_level
  down_to_last # print down to the last line
  line_a # print the last line
}

main "$@"


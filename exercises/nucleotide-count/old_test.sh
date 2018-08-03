#!/usr/bin/env bats

# count all nucleotides in a strand

@test "empty strand" {
  skip
  run bash nucleotide_count.sh 
}

@test "can count one nucleotide in single-character input" {
  skip
  run bash nucleotide_count.sh G
}

@test "strand with repeated nucleotide" {
  skip
  run bash nucleotide_count.sh GGGGGGG
}

@test "strand with multiple nucleotides" {
  skip
  run bash nucleotide_count.sh AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC
}

@test "strand with invalid nucleotides" {
  skip
  run bash nucleotide_count.sh AGXXACT
}


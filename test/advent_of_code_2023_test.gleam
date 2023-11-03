import gleeunit
import gleeunit/should
import solutions/year2022day01

pub fn main() {
  gleeunit.main()
}

pub fn verify_year_2022_day_1_part_1_test() {
  year2022day01.part_1()
  |> should.equal(68_802)
}

pub fn verify_year_2022_day_1_part_2_test() {
  year2022day01.part_2()
  |> should.equal(205_370)
}

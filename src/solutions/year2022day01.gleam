import gleam/int
import gleam/string
import gleam/list
import gleam/erlang/file

pub fn solution() {
  let assert Ok(contents) = file.read("./src/inputs/2022_1")
  let splited = string.split(contents, "\n")

  let is_empty = fn(n) { n == "" }
  let chunks = list.chunk(splited, by: is_empty)

  let any_empty = fn(x) { list.any(x, is_empty) == False }
  let no_empty_chunks_list = list.filter(chunks, any_empty)

  let string_to_int = fn(n) {
    let assert Ok(number) = int.parse(n)
    number
  }

  let string_list_to_int_list = fn(chunk) { list.map(chunk, string_to_int) }
  let number_chunks = list.map(no_empty_chunks_list, string_list_to_int_list)

  let sum_numbers_in_list = fn(chunk) { int.sum(chunk) }
  let summed_chunks = list.map(number_chunks, sum_numbers_in_list)

  let assert Ok(highest_number) =
    list.sort(summed_chunks, by: int.compare)
    |> list.last

  highest_number
}

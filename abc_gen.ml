open Ast

let note_to_abc note = 
  match note with
  | 'A' -> "A"
  | 'B' -> "B"
  | 'C' -> "C"
  | 'D' -> "D"
  | 'E' -> "E"
  | 'F' -> "F"
  | 'G' -> "G"
  | 'R' -> "z"
  | _ -> failwith "Invalid note"

let modifier_to_abc = function
  | Natural -> ""
  | Sharp -> "^"
  | Flat -> "_"

let pitch_to_abc (Note (note, modifier)) = 
  modifier_to_abc modifier ^ note_to_abc note

let duration_to_abc duration = 
  string_of_int duration

let song_line_to_abc (pitch, duration) =
  pitch_to_abc pitch ^ duration_to_abc duration

let song_to_abc song =
  let header = "X:1\nT:Untitled\nM:4/4\nK:C\n" in
  let body = String.concat " " (List.rev (List.map song_line_to_abc song)) ^ "|\n" in
  header ^ body

let create_abc_file filename song =
  let abc = song_to_abc song in
  let oc = open_out (filename ^ ".abc") in
  output_string oc abc;
  close_out oc

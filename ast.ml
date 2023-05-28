type note = 
  | A | B | C | D | E | F | G | R

type modifier = 
  | Natural | Sharp | Flat

type pitch = 
  | Note of char * modifier

type duration = int

type song_line = pitch * duration

type song = song_line list

let check_song song =
  let is_valid_duration d = List.mem d [1; 2; 4] in
  let is_valid_note = function
    | Note (_, modifier) -> true (* For simplicity, we assume all notes are valid. *)
  in
  let is_valid_song_line (pitch, duration) =
    is_valid_note pitch && is_valid_duration duration
  in
  if List.for_all is_valid_song_line song then Ok song
  else Error "Invalid song"

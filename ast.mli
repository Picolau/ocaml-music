type note = 
  | A | B | C | D | E | F | G | R

type modifier = 
  | Natural | Sharp | Flat

type pitch = 
  | Note of char * modifier

type duration = int

type song_line = pitch * duration

type song = song_line list

val check_song : song -> (song, string) result

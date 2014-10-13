;This tutorial is all about finding out the name of the real tutorial by
;playing with strings. Let's get to it!

pro fake_out

     readcol, 'clues.txt', clues, format = 'A'
     ;the above function just reads in
     ;strings from the text file clues.txt
     ;we'll learn more about this next week
     
     ;please avoid simply printing clues to
     ;get an idea of what the strings 
     ;look like. The idea is to work with the
     ;functions within idl.

     ;FOLLOW THE FOLLOWING INSTRUCTIONS AND CONCATENATE THE RESULTS OF EACH INTO AN ARRAY
     

     ;1. extract the first letter of the first string in clues and make it
     ;   lowercase (use strlowcase)
final = strlowcase(STRMID(clues(0),0,1))
;print, final


   ;2. find the string containing the
   ;substring 'og' and extract it from that
   ;string

;print, STRPOS(clues, 'og',0)
og_pos = WHERE(STRPOS(clues,'og',0) GE 0)
og_pos2 = STRPOS(clues(og_pos), 'og')
;print,og_pos ; should be 4
final+=STRMID(clues(og_pos),og_pos2,2)
;print, final

     ;3. add in an '_'
final+='_'
;print, final

     ;4. find the string containing 'ate' and
     ;extract 3 letters from the p on

;print, STRPOS(clues,'ate',0)
;find the position of the string that contains 'ate' in clues
ate_pos = WHERE(STRPOS(clues,'ate',0) GE 0)
;find the position of 'p' in the string that contains 'ate'
p_pos = STRPOS(clues(ate_pos),'p')
;print the positions just to make sure
;print, ate_pos ;should be 19
;print, p_pos ;should be 5
;add the 3 letters after 'p' to the final string
final+=STRMID(clues(ate_pos),p_pos,3)
;print, final




       ;5. find the string containing 'x' and
       ;extract the first two letters
;print, STRPOS(clues,'x',0)
x_pos = WHERE(STRPOS(clues,'x',0) GE 0)
;print, x_pos ; should be 5,22
;add the first two letters of the string that has 'x' and add it to the
;final string
final+=STRMID(clues(x_pos),0,2)
;print, final


     ;6. use strjoin to collape your array into a single string
;i was using a string that added on each time


     ;7. use repstr to replace the second o in your string with ''
     ;   (try using the /reverse_search option in strpos)    

  second_o_pos=STRPOS(final,'o',/REVERSE_SEARCH)
 ; print, second_o_pos ; should be 5
 ; takes the first half of the final string unchanged and takes the second half changed and puts them together
  final = STRMID(final,0,second_o_pos) + REPSTR(STRMID(final,second_o_pos),'o')
  ;print, final

     ;8. add in a '.pro'
  final+='.pro'
     ;9. print your string and go find the file  in /home/jzalesky/public_html
     ;   and open it in emacs

print, final
;print, clues
;Lumberjack fantasies have me oggling axes with less prudent intentions. Don't judge me
;for finding an amusing way to incorporate the word axes.

end     

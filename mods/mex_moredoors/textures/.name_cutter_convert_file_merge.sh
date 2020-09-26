#!/bin/bash
for file in *
do
    #####Minta 1######
    #new_name=$(echo $file | cut -d '-' -f 2 | cut -c 2-| cut -d '(' -f 1 | rev | cut -c 2- | rev)
    
    #####Minta 2######
    #new_name=$(echo $file | cut -d '/' -f 2 | cut -d '.' -f 1)
    #new_name+=' '
    #new_name+=$(echo $file | cut -d '.' -f 2)
    #new_name+=' '
    #new_name+=$(echo $file | cut -d '.' -f 3)
    #new_name+=$(echo $file | tail -c 5)
    
    selected_file=$(echo $file | tail -c 4)
    in_name=$(echo $file | rev | tail -c 34 | rev)
    selected_file="avi"

    if [ $selected_file = "avi" ]; then
        new_name="${file//crops/farming}"
 
        #new_name=$(echo ${new_name:2} | rev)
        #new_name+="E10S"
        #new_name=$(echo $new_name | rev)
        #new_name=$(echo $new_name | cut -d '-' -f 1)
        #new_name+=" - "
        #new_name+=$(echo $file | cut -d '-' -f 2 | cut -d '.' -f 1)
        #episode_number=$(echo $episode_number | tail -c 3)
        #new_name+=$episode_number
        #new_name+=$(echo $file | tail -c 6)
          
        echo "$new_name"
        #mv "$file" "$new_name"
        #ffmpeg -i "$file" "$new_name.mp3"
        #ffmpeg -i "$file" -map v -map a:1 -map a:0 -codec:v copy -codec:a aac -disposition:a 0 -disposition:a:0 default "$new_name.mp4"
        #ffmpeg -i "$file" -i $in_name"-en.srt" -map v -map a -map 1:0 -codec:v copy -codec:a aac -codec:s mov_text "$new_name.mp4"
        #ffmpeg -i "$file" -map v -map a -map s:0 -map s:1 -codec:v copy -codec:a aac -af "pan=stereo|FL < 1.0*FL + 0.707*FC + 0.707*BL|FR < 1.0*FR + 0.707*FC + 0.707*BR" -codec:s mov_text -disposition:a 0 -disposition:a:0 default "$new_name.mp4"
    fi
done



#cut
#    cuts a string
#    -d    delimiter character
#    -f    which delimited field to print
#    -c    select only these caracters()
#
#rev
#    reverse a string
#
#tail
#   print the last [c] caracters of a string
#   -c    how many caracters to print
#
#${"string":[n]}
#   print the string from the [n]-th caracter 
#
#String replacement
#message='The secret code is 12345'
#echo "${message//[0-9]/X}"
# prints 'The secret code is XXXXX'
#
#ffmpeg
#   media stream manipulator
#   -i      input file
#   stream_specifiers:
#       'v' for video
#       'a' for audio
#       's' for subtitle
#       'd' for data
#       't' for attachments
#   -map    designate input streams as a source for the output file
#       For example, to map ALL streams from the first input file to output:
#           fmpeg -i INPUT -map 0 output
#       For example, if you have two audio streams in the input file (identified as "0:0" and "0:1") you can select which streams to place in an output file:
#          ffmpeg -i INPUT -map 0:1 out.wav
#   -disposition
#       For example, to make the second audio stream the default stream:
#           ffmpeg -i in.mkv -codec copy -disposition:a:1 default out.mkv
#       For example, to make the second subtitle stream the default stream and remove the default disposition from the first subtitle stream:
#           ffmpeg -i in.mkv -codec copy -disposition:s:0 0 -disposition:s:1 default out.mkv
#   Stream copy
#       -codec (or just -c) copy    makes ffmpeg omit the decoding and encoding step for the specified stream
#
#   ffmpeg -encoders    list the available encoders
#
#   Example 1:
#       copy the first (and only) video steram,
#       map the second audio stream to the first place,
#       map the first audio stream to the second place,
#       map the second subtitle stream into the output, (first not needed) 
#       convert all the audio streams into aac,
#       remove the default flag from all the audio streams,
#       put the default flag on the first audio stream,
#       converting the subtitle to be able to put into the mp4:
#           ffmpeg -i "$file" -map v -map a:1 -map a:0 -map s:1 -codec:v copy -codec:a aac -codec:s mov_text -disposition:a 0 -disposition:a:0 default "$new_name.mp3"

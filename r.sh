rm *.log
pip install .
rm -r -f output/

declare -a inputs=("videos/cameratips.mp4" "videos/jordi.mp4" "videos/jobinterview.mp4" "videos/jordimaskudosallhands.mp4" "videos/michael.mp4" "videos/simplicty.mp4")
declare -a target_languages=("cat")  # Catalan (cat) and French (fra)
declare -a tts_list=("mms" "coqui")
declare -a inputs=("videos/jordimaskudosallhands.mp4" "videos/jobinterview.mp4")

for tts in "${tts_list[@]}"; do
    for input_file in "${inputs[@]}"; do
      for language in "${target_languages[@]}"; do
        # Derive the output directory from the input file and language
        output_directory="output/$(basename "${input_file%.*}").${language}.${tts}/"

        # Run the dubbing command
        open-dubbing \
          --input_file "$input_file" \
          --output_directory="$output_directory" \
          --source_language=eng \
          --target_language="$language" \
          --tts="$tts" \
          --device=cpu
        echo ""
      done
    done
done

#!/bin/bash
 
SRC_PATH="/mnt/c/corpus"
BASE="/mnt/c"
OUTPUT="$BASE/aligned"

echo "Preparing files..."
if [ ! -d "$OUTPUT" ]; then
	echo "Creating $OUTPUT..."
	mkdir -p "$OUTPUT"
fi

for folder in "$SRC_PATH"/*; do
	if [ -d "$folder" ]; then
		folder_name=$(basename "$folder")
		echo "----------------------------------------------------"
		echo "Processing folder: $folder_name"
		echo "----------------------------------------------------"

		TMP="$BASE/tmp_$folder_name"
		mkdir -p "$TMP"

		cp "$folder"/*.txt "$TMP/" 2>/dev/null

		echo "Converting .wav from $folder_name to 16kHz..."
		for f in "$folder"/*.wav; do
			if [ -f "$f" ]; then
				ffmpeg -i "$f" -ar 16000 -ac 1 -sample_fmt s16 "$TMP/$(basename "$f")" -y
			fi			
		done

		TMP_OUTPUT="$OUTPUT/$folder_name"
		mkdir -p "$TMP_OUTPUT"

		echo "MFA execution for $folder_name..."
		mfa align "$TMP" cmudict.dict english_mfa "$TMP_OUTPUT" --single_speaker --clean
		echo "MFA process for $folder_name is completed!"
		if [[ "$TMP" == *"/tmp_"* ]]; then
			echo "Deleting $TMP..."
			rm -rf "$TMP"
		fi
	fi
done

echo "==========================================================================="
echo "All folders processed! Final results are in: $OUTPUT"

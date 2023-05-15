#!/bin/bash

# Specify the path to the folder containing the image files
folder_path="../images"

# Get the base names of JPEG and PNG files in the folder
file_names=($(find "$folder_path" -type f \( -iname "*.jpeg" -o -iname "*.png" \) -exec basename {} \;))

# Specify the output file
output_file="output.txt"

# Iterate through each file name
for name in "${file_names[@]}"; do
    # Generate the HTML code
    html_code="<li>${name}</li>\n<a href=\"./recipes/${name}.html\"><img src=\"../images/${name}\" alt=\"${name}\" width=\"400\"></a></li>"
    html_code="<li>${name}</li>\n<a href=\"./recipes/${name}.html\"><img src=\"${name}\" alt=\"${name}\" width=\"400\"></a></li>"

    # Append the HTML code to the output file
    echo -e "${html_code}\n" >> "$output_file"
done

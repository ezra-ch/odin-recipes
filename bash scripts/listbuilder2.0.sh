#!/bin/bash
#outputs lists for index.html by creating an array populated with image names from /images

# Specify the path to the folder containing the image files
folder_path="../images"

# Get the base names of JPEG and PNG files in the folder
file_names=($(find "$folder_path" -type f \( -iname "*.jpeg" -o -iname "*.jpg" \) -exec basename {} \;))

# Specify the output file
output_file="listbuilder2.0_output.txt"

# Function to capitalize the first letter of a string and all letters after a space
#In this implementation, the sed command uses the -E flag for extended regular expressions.
#The pattern (^| ). matches the start of the string or a space followed by any character. 
#The replacement \U& converts the matched character to uppercase. 
#The g flag is used to apply the replacement globally in the string.
capitalize() {
  local string="$1"
  echo "$string" | sed -E 's/(^| )./\U&/g'
}

# Iterate through each file name
for name in "${file_names[@]}"; do
    # Remove hyphens and underscores from the name
    name_no_special_chars=${name//[-_]/ }
    # Capitalize the first letter of the modified name
    name_capitalized=$(capitalize "$name_no_special_chars")
    # Generate the HTML code
    html_code="<li>${name_capitalized%.*}</li>\n<a href=\"./recipes/${name%.*}.html\"><img src=\"./images/${name}\" alt=\"${name%.*}\" width=\"400\"></a></li>"


    # Append the HTML code to the output file
    echo -e "${html_code}\n" >> "$output_file"
done

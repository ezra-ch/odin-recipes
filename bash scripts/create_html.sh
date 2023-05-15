#!/bin/bash
# check path before executing
# Specify the path to the folder containing the JPEG files
jpeg_folder="../images"

# Specify the path to the target directory where HTML files should be created
html_folder="../recipes"

# Iterate through each JPEG file in the folder
for file_path in "$jpeg_folder"/*.jpeg; do
    # Extract the file name without the extension
    file_name=$(basename "$file_path" .jpeg)

    # Construct the path to the HTML file
    html_file="$html_folder/${file_name}.html"

    # Check if the HTML file already exists
    if [ -f "$html_file" ]; then
        echo "HTML file '$html_file' already exists. Skipping..."
    else
        # Create the HTML file and populate it with boilerplate HTML code
        cat <<EOT >> "$html_file"
<!DOCTYPE html>
<html lang= en>
    <head>
        <meta charset = "utf-8">
        <title>$file_name recipe</title>
    </head>
    <body>
        <h1>$file_name recipe</h1>
        <img src = "../images/$file_name.jpg" width = "1000">
        <h2>Ingredients</h2>
        <ul>
            <li>2 egg</li>
            <li>100g baby spinach</li>
            <li>pinch of salt</li>
            <li>pinch of pepper</li>
        </ul>
        <h2>Instructions</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore <br>
        et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip <br>
        ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat <br>
        nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id <br>
        est laborum</p>
    </body>
    <footer>
        <a href = "../index.html">back to homepage</a>
    </footer>
</html>
EOT
        echo "Created HTML file: $html_file"
    fi
done

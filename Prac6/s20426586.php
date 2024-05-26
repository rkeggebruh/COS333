<?php
// Check if correct number of arguments are provided
if ($argc !== 3) {
    exit("Usage: php php_script.php <input_file> <word_to_search>\n");
}

// Read input file contents
$input_file = $argv[1];
$word_to_search = $argv[2];

// Check if file exists and is readable
if (!file_exists($input_file) || !is_readable($input_file)) {
    exit("error: I hate to be that guy, but the file is called 'input.txt', try again bro.\n");
}

// Read file contents
$file_contents = file_get_contents($input_file);

// Convert to lowercase and strip non-alphabetic characters
$file_contents = preg_replace("/[^a-zA-Z]/", "", strtolower($file_contents));

// Count occurrences of the word in reverse order
$matches = substr_count(strrev($file_contents), strrev($word_to_search));

// Output the result as HTML
echo "<!DOCTYPE html>\n";
echo "<html>\n";
echo "<head><title>PHP Script Output</title></head>\n";
echo "<body>\n";
echo "<h1>Matches: $matches</h1>\n";
echo "</body>\n";
echo "</html>\n";
?>

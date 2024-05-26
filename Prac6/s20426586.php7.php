<!DOCTYPE html>
<html>
<head>
    <title>Search Word Occurrences</title>
</head>
<body>
    <h2>Search Word Occurrences</h2>
    <form action="s20426586.php" method="post">
        Input File: <input type="text" name="input_file"><br>
        Word to Search: <input type="text" name="word_to_search"><br>
        <input type="submit" value="Search">
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $input_file = $_POST['input_file'] ?? '';
        $word_to_search = $_POST['word_to_search'] ?? '';

        // Check if file exists and is readable
        if (!file_exists($input_file) || !is_readable($input_file)) {
            echo "Error: File not found or not readable. Please try again.";
        } else {
            // Read file contents
            $file_contents = file_get_contents($input_file);

            // Convert to lowercase and strip non-alphabetic characters
            $file_contents = preg_replace("/[^a-zA-Z]/", "", strtolower($file_contents));

            // Count occurrences of the word in reverse order
            $matches = substr_count(strrev($file_contents), strrev($word_to_search));

            // Output the result
            echo "Matches: $matches";
        }
    }
    ?>
</body>
</html>

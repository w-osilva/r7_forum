# Define simple_blacklist file
SimpleBlacklist.set_blacklist_file(File.join(BLACKLIST_BASE, "config", "blacklist.yml"))

# Defines masks that will replace the words contained in the simple_blacklist
SimpleBlacklist.set_mask_to_denied_words("xxxxx")

# list of letters and characters that can replace the letters
SimpleBlacklist.set_letters_variations({
 'a' => ['@', '4', 'ª'],
 'e' => ['3', '&'],
 'i' => ['|', '1'],
 'o' => ['0', 'º'],
 's' => ['$', '5'],
 't' => ['7'],
 'g' => ['6'],
 'b' => ['6', '8']
})

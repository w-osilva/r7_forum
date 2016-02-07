module Blacklist
  @@letters_variations = {}
  @@blacklist = []

  module_function
  def set_blacklist_file(file)
    @@file = file
  end

  def set_letters_variations(list)
    raise "Given object is not a hash" unless list.instance_of? Hash
    @@letters_variations = list
  end

  def reload_blacklist
    f = File.open(@@file, 'rb')
    content = f.read
    @@blacklist = content.split(/\W+/)
    @@blacklist.map!(&:downcase)
  end

  def sanitize(text)
    reload_blacklist
    words = text.split(/[\s,.]/)
    words.each do |word|
      replaced = replace_letters(word)
      text.gsub!(/(#{word})+/i, 'xxxx') if @@blacklist.include? replaced.downcase
    end
    text
  end

  def replace_letters(word)
    replaced = word.clone
    chars = word.split('')
    chars.each do |char|
      @@letters_variations.each do |(key,list_chars)|
        replaced.gsub!(/(#{char})+/i, "#{key}") if list_chars.include? char.downcase
      end
    end
    replaced
  end

end
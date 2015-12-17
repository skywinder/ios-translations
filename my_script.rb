class Translator
  @dir = ""
  @translation = ""
  @tr_langs = []
  @tr_words = []

  def initialize(dir, translations)
    @dir = dir
    @translation = translations
    @tr_langs = []
    @tr_words = []
  end

  def run
    parse_translation
    @tr_words.each { |words|
      words.each_with_index { |word, index|
        replace_word(words[0], word, @tr_langs[index])
      }
    }
    puts self.inspect
  end

  def get_trans_files
    string = @dir + "/*.xliff"
    Dir[string]
    # "/path/to/search/**/*.rb"
  end

  def existing_trans_langs
    get_trans_files.map { |f| File.basename(f, ".xliff") }
  end

  def parse_translation
    line_num = 0
    File.open(@translation).each do |line|
      line = line.delete("\n")
      line_split = line.split(",")
      if line_num == 0
        @tr_langs = line_split
      else
        @tr_words.push(line_split)
      end
      line_num += 1
    end
  end

  def get_base_lang
    @tr_langs[0]
  end

  def replace_word(base, to_translation, for_lang)
    filename = file_for_lang for_lang
    if filename
      text = File.read(filename)
      new_file = text.gsub("<target>#{base}</target>", "<target>#{to_translation}</target>")
      File.open(filename, 'w'){|f| f.puts new_file}
    end
  end

  def file_for_lang(for_lang)
    langs_index = existing_trans_langs.index(for_lang)
    if langs_index
      get_trans_files[langs_index]
    end

  end
end


if __FILE__ == $PROGRAM_NAME
  translator = Translator.new(Dir.pwd, "translation.txt")
  translator.run
end
class Translator
  @dir = ""
  @translation = ""
  @tr_langs = []
  @tr_words = []

  def initialize(dir, translations)
    @dir = dir
    @translation = translations
  end

  def run
    puts get_trans_files
    puts existing_trans_langs
    puts parse_translation
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
      line_split = line.split(",")
      if line_num == 0
        @tr_langs = line_split
      else
        @tr_words.push(line_split)
      end
    end
  end
end


if __FILE__ == $PROGRAM_NAME
  translator = Translator.new(Dir.pwd, "translation.txt")
  translator.run
end
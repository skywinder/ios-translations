class Translator
  @dir = ""
  @translation = ""

  def initialize(dir, translations)
    @dir = dir
    @translation = translations
  end

  def run
    puts self.inspect
    puts get_trans_files
    puts existing_trans_langs

  end

  def get_trans_files
    string = @dir + "/*.xliff"
    Dir[string]
    # "/path/to/search/**/*.rb"
  end
  def existing_trans_langs
    get_trans_files.map{|f| File.basename(f, ".xliff")}
  end
end


if __FILE__ == $PROGRAM_NAME
  translator = Translator.new(Dir.pwd, "translation.txt")
  translator.run
end
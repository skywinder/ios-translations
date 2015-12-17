class Translator
  @dir = ""
  @translation = ""

  def initialize(dir, translations)
    @dir = dir
    @translation = translations
  end

  def run
    puts self.inspect
  end

  def get_trans_files
    Dir["/path/to/search/**/*.rb"]
  end
end


if __FILE__ == $PROGRAM_NAME
  translator = Translator.new(Dir.pwd, "translation.txt")
  translator.run
end
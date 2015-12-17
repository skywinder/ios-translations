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
end


if __FILE__ == $PROGRAM_NAME
  translator = Translator.new("dir_path", "langs_file")
  translator.run
end
class AptFeatures

  attr_reader :features_hash

  def initialize(text)
    @text = text.to_s
    @terms = parse_terms
    @features_hash = {}
    parse
    self
  end

  def parse
    @terms.each do |feature, terms|
      @features_hash[feature] = false
      terms.each { |term|
        if @text[/\W+#{term}\W+/i] != nil
          @features_hash[feature] = true
          break
        end
      }
    end
  end

  def to_s(features_hash = @features_hash)
    s = ""
    features_hash.each do |feature, has|
      s += "#{feature}\t\t\t#{has}\n"
    end
    s
  end

  def true_to_s
    features = []
    @features_hash.each do |feature, has|
      features << feature.to_s if has
    end
    features.sort.join(', ')
  end

  #-----------
  private
  def parse_terms
    hash = {}
    f = File.open('parser/terms.txt')
    f.each_line do |line|
      feature, terms = line.chomp.split('=')
      hash[feature.to_sym] = terms.split(',')
    end
    f.close
    hash
  end

end

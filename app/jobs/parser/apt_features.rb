require "../models/feature_term"

class AptFeatures < ActiveRecord::Base

  attr_reader :features_array

  def initialize(text)
    @text = text.to_s
    @features_array = []
    parse
    self
  end

  def parse
		FeatureTerm.all.each do |feature_obj|
      feature_obj.variations.each { |variation|
        if @text[/\W+#{variation}\W+/i] != nil
					@features_array << feature_obj.feature
          break
        end
      }
    end
  end

#  def to_s(features_hash = @features_hash)
#    s = ""
#    features_hash.each do |feature, has|
#      s += "#{feature}\t\t\t#{has}\n"
#    end
#    s
#  end
#
#  def true_to_s
#    features = []
#    @features_hash.each do |feature, has|
#      features << feature.to_s if has
#    end
#    features.sort.join(', ')
#  end

end

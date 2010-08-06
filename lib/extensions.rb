# MN: 7.20.2010 - Placing contents of rspec-on-rails-matchers in extensions for now until rspec-on-rails-matchers 
# Gem is fully functional
module Spec
  module Rails
    module Matchers  
      # Associations
      def belong_to(association)
        return simple_matcher("model to belong to #{association}") do |model|
          model = model.class if model.is_a? ActiveRecord::Base
          model.reflect_on_all_associations(:belongs_to).find { |a| a.name == association }
        end
      end

      def have_many(association)
        return simple_matcher("model to have many #{association}") do |model|
          model = model.class if model.is_a? ActiveRecord::Base
          model.reflect_on_all_associations(:has_many).find { |a| a.name == association }
        end
      end

      def have_one(association)
        return simple_matcher("model to have one #{association}") do |model|
          model = model.class if model.is_a? ActiveRecord::Base
          model.reflect_on_all_associations(:has_one).find { |a| a.name == association }
        end
      end

      def have_and_belong_to_many(association)
        return simple_matcher("model to have and belong to many #{association}") do |model|
          model = model.class if model.is_a? ActiveRecord::Base
          model.reflect_on_all_associations(:has_and_belongs_to_many).find { |a| a.name == association }
        end
      end           
      # Validations
      def validate_presence_of(attribute)
        return simple_matcher("model to validate the presence of #{attribute}") do |model|
          model.send("#{attribute}=", nil)
          !model.valid? && model.errors.invalid?(attribute)
        end
      end

      def validate_length_of(attribute, options)
        if options.has_key? :within
          min = options[:within].first
          max = options[:within].last
        elsif options.has_key? :is
          min = options[:is]
          max = min
        elsif options.has_key? :minimum
          min = options[:minimum]
        elsif options.has_key? :maximum
          max = options[:maximum]
        end
        
        return simple_matcher("model to validate the length of #{attribute} within #{min || 0} and #{max || 'Infinity'}") do |model|
          invalid = false
          if !min.nil? && min >= 1
            model.send("#{attribute}=", 'a' * (min - 1))

            invalid = !model.valid? && model.errors.invalid?(attribute)
          end
          
          if !max.nil?
            model.send("#{attribute}=", 'a' * (max + 1))

            invalid ||= !model.valid? && model.errors.invalid?(attribute)
          end
          invalid
        end
      end

      def validate_uniqueness_of(attribute)
        return simple_matcher("model to validate the uniqueness of #{attribute}") do |model|
          model.class.stub!(:find).and_return(true)
          !model.valid? && model.errors.invalid?(attribute)
        end
      end

      def validate_confirmation_of(attribute)
        return simple_matcher("model to validate the confirmation of #{attribute}") do |model|
          model.send("#{attribute}_confirmation=", 'asdf')
          !model.valid? && model.errors.invalid?(attribute)
        end
      end
      
      def validate_date_of(attribute)
        return simple_matcher("model to validate the date of #{attribute}") do |model|
          model.send("#{attribute}=",'invalid_date')
          !model.valid? && model.errors.invalid?(attribute)
        end
      end
      
      def validate_datetime_of(attribute)
        return simple_matcher("model to validate the datetime of #{attribute}") do |model|
          model.send("#{attribute}=",'invalid_date')
          !model.valid? && model.errors.invalid?(attribute)
        end
      end
    end
  end
end      

class Money                              
  attr_accessor :id # HACK for use with factory_girl
  
  def save
    true
  end
  
  alias_method :save!, :save
  
  def initialize(cents = 0, currency = Money.default_currency, bank = Money.default_bank)
    @cents = cents.round 
    if currency.is_a?(Hash)
      # Earlier versions of Money wrongly documented the constructor as being able
      # to accept something like this:
      #
      #   Money.new(50, :currency => "USD")
      #
      # We retain compatibility here.
      @currency = Currency.wrap(currency[:currency] || Money.default_currency)
    else
      @currency = Currency.wrap(currency)
    end
    @bank = bank
  end  
end

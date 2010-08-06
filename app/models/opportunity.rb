class Opportunity < ActiveRecord::Base
  # Relationships
  belongs_to :project
  has_many :sites

  composed_of :cost,
    :class_name => "Money",
    :mapping => [%w(cents cents), %w(currency currency_as_string)],
    :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) }  
end

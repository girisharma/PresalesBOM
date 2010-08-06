class Project < ActiveRecord::Base
  belongs_to :user
  has_many :sites
  has_many :opportunities         
  
  composed_of :cost,
    :class_name => "Money",
    :mapping => [%w(cents cents), %w(currency currency_as_string)],
    :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) }
end

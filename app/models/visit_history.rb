class VisitHistory < ApplicationRecord
  belongs_to :short_url, counter_cache: true
end

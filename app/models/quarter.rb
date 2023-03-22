class Quarter < ApplicationRecord
    belongs_to :semester

    def full_description
      "#{started_at} / #{ended_at}"
    end
end

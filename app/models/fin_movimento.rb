class FinMovimento < ActiveRecord::Base

    belongs_to :contrato
    belongs_to :despesa

end

class Despesa < ActiveRecord::Base
    has_many :fin_movimentos
end

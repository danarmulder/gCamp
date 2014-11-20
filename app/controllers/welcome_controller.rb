class WelcomeController < ApplicationController
  def index
    @quotes = [['"Productivity is never an accident.  It is always the result of a commitment to excellence, intelligent planning, and focused effort."', "-Paul J. Meyer",],
                ['"Your time is limited, so don\'t waste it living somebody else\'s life."', "-Steve Jobs",],
                ['"Better Ingredients, Better Pizza."', "-Papa John",],
  ]
  end
end

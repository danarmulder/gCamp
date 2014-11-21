class WelcomeController < ApplicationController
  def index
    @quotes = [['"Failure is not an option.  Everyone has to Succeed."', "-Arnold Schwarzenegger",],
                ['"Your time is limited, so don\'t waste it living somebody else\'s life."', "-Steve Jobs",],
                ['"Better Ingredients, Better Pizza."', "-Papa John",],
  ]
  end
end

class FaqController < ApplicationController

  def index
    @faqs = [['What is gCamp?', 'gCamp is an awesome tool that is going to change your life.  gCamp is your one stop shop to organize all your tasks and documents.  You\'ll also be able to track comments that you and others make.  gCamp may eventually replace all need for papers and pens in the world.  Well maybe not but it\'s going to be really cool.',],
             ['How do I join gCamp?', 'Right now, gCamp is still in production.  So there is not a sign up page open to the public yet! Your best option is to become super best friends with a gCamp developer.  They can be found hanging around gSchool during the day and hanging out at the hottest clubs at night.',],
             ['When will gCamp be finished?', 'gCamp is a work in progress.  That being said is should be fully functional by December 2014.  Functional but our developers are going to continue to improve the site for the foreseeable future.  It\'s going to blow your mind.  Organziation is only, (well, will only) be a click away.  Amazing!',],
  ]
  end

end

class PagesController < ApplicationController

  def index
   
  end

  def about
  end

  def top5
    @top_dorm_assistants = DormAssistant.order(:hours_rendered).last(5)
  end
end

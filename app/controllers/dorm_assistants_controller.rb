class DormAssistantsController < ApplicationController

	def index
		@dorm_assistants = DormAssistant.order(:name)
	end

	def new
		@dorm_assistant = DormAssistant.new
	end

	def create
		@dorm_assistant = DormAssistant.new(dorm_assistant_params)
                @dorm_assistant.update_attributes(:hours_rendered => 0)
		if @dorm_assistant.save
		  redirect_to dorm_assistants_path
		else
                  @error = true
                  @message = @dorm_assistant.errors.messages
	          render :new
		end
	end

	def edit
		@dorm_assistant = DormAssistant.find(params[:id])
	end

	def update
		@dorm_assistant = DormAssistant.find(params[:id])
		if @dorm_assistant.update(dorm_assistant_params)
		  redirect_to dorm_assistants_path
		else
                  @message = @dorm_assistant.errors.messages
	          render :edit
		end
	end

	def show
		@dorm_assistant = DormAssistant.find(params[:id])                
                redirect_to :controller => 'service_hours', :action => 'index', :id => params[:id]
	end

	def destroy
		@dorm_assistant = DormAssistant.find(params[:id])
                @service_hours = ServiceHour.all
                @service_hours.each do |service_hour|
                  if service_hour.id_num == @dorm_assistant.id_num
                    service_hour.destroy
                  end  
                end
		@dorm_assistant.destroy
		redirect_to dorm_assistants_path
	end

	def dorm_assistant_params
		params.require(:dorm_assistant).permit!
	end

end

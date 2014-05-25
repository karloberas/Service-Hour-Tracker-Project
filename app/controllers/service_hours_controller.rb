class ServiceHoursController < ApplicationController
       
       def index
          @dorm_assistant = DormAssistant.find(params[:id]) 
	  @service_hours = ServiceHour.order(:time_start)
       end

       def new
          @dorm_assistant = DormAssistant.find(params[:id]) 
          @service_hour = ServiceHour.new
       end

       def create
          @service_hour = ServiceHour.new(service_hour_params)
          @dorm_assistant = DormAssistant.find_by id_num: @service_hour.id_num
          num_hours = ((@service_hour.time_end - @service_hour.time_start) / 1.hour).to_i
          if num_hours > 0
            @service_hour.update_attributes(:num_hours => num_hours) 
	    if @service_hour.save
              redirect_to :action => 'index', :id => @dorm_assistant.id
            else           
	      render :new
	    end
          else
              @message = "Warning! Number of Hours is zero or negative."
              render :new
          end
	end

	def edit
	  @service_hour = ServiceHour.find(params[:id])
          @dorm_assistant = DormAssistant.find_by id_num: @service_hour.id_num
	end

	def update
	  @service_hour = ServiceHour.find(params[:id])
          @dorm_assistant = DormAssistant.find_by id_num: @service_hour.id_num
	  if @service_hour.update(service_hour_params)
              num_hours = ((@service_hour.time_end - @service_hour.time_start) / 1.hour).to_i
              if num_hours > 0
                @service_hour.update_attributes(:num_hours => num_hours)                
                redirect_to :action => 'index', :id => @dorm_assistant.id
              else
                @message = "Warning! Number of Hours is zero or negative."  
                render :edit
              end
          else
              render :edit
          end
	end

	def destroy
	  @service_hour = ServiceHour.find(params[:id])
          @dorm_assistant = DormAssistant.find_by id_num: @service_hour.id_num
          @render = params[:render]
          if @render == "true"         
            num_hours = @dorm_assistant.hours_rendered.to_i + @service_hour.num_hours.to_i
            if num_hours > @dorm_assistant.num_hours
              redirect_to :action => 'index', :id => @dorm_assistant.id
            else
              @dorm_assistant.update_attributes(:hours_rendered => num_hours)
  	      @service_hour.destroy
              redirect_to :action => 'index', :id => @dorm_assistant.id
            end
           else
            @service_hour.destroy
            redirect_to :action => 'index', :id => @dorm_assistant.id
          end
	end  
      
	def service_hour_params
	  params.require(:service_hour).permit!
	end
        


end

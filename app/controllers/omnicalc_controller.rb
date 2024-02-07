class OmnicalcController < ApplicationController
  def home
    render({ :template => "omnicalc_temps/home" })
  end
 
  def square_results
  @user_input = params.fetch("user-input").to_f
  
  @the_result = @user_input * @user_input
  
  render({ :template => "omnicalc_temps/square_results" }) 
 end

 def square_root
 
  render({ :template => "omnicalc_temps/square_root" }) 
 end
 
def square_root_results
  @the_num = params.fetch("user-input").to_f

  @the_root = Math.sqrt(@the_num)
  render({ :template => "omnicalc_temps/square_root_results" })
end

 def payment
  render({ :template => "omnicalc_temps/payment" })
end
  def payment_results
    
    @apr = params.fetch("user_apr").to_f

@num_of_years= params.fetch("user_num_years").to_f

@prin = params.fetch("user_principals").to_f



@apr_result = @apr.to_fs(:percentage, {:precision => 4})

 
@apr = @apr / 100

@apr = @apr / 12

@num_of_years = @num_of_years * 12

top = @apr * @prin
 
bottom = 1.0 - (1.0 +@apr)** -@num_of_years


 @payment = top / bottom

 @payment = @payment.round(2)
  
 @payment = @payment.to_fs(:currency)
    
    render({ :template => "omnicalc_temps/payment_results" })
  end


  def random
  
    render({ :template => "omnicalc_temps/random" })
  end

 def random_results
  
  @min_num = params.fetch("min_number").to_f
@max_num = params.fetch("max_number").to_f

@rand_num = rand(@min_num..@max_num)
  render({ :template => "omnicalc_temps/random_results" })
end
end

class CalculatorController < ApplicationController
  def home
    render(:template => "calculator_templates/square_form")
  end
  
  def new
    @operation = params.fetch("operation")

    if @operation == "square"
      render(:template => "calculator_templates/square_form")
    elsif @operation == "square_root"
      render(:template => "calculator_templates/square_root_form")
    elsif @operation == "payment"
      render(:template => "calculator_templates/payment_form")
    elsif @operation == "random"
      render(:template => "calculator_templates/random_form")
    end

  end

  def results
    @operation = params.fetch("operation")

    if @operation == "square"
      @input = params.fetch("input").to_f
      result = @input ** 2
      @results = {"Number": @input, "Square": result}
      @instructions = "Calculate another square"

    elsif @operation == "square_root"
      @input = params.fetch("input").to_f
      result = @input ** 0.5
      @results = {"Number": @input, "Square Root": result}
      @instructions = "Calculate another square root"

    elsif @operation == "payment"
      apr = params.fetch("apr").to_f
      p = params.fetch("principal").to_f
      years = params.fetch("years").to_i
      #calculate monthly payment
      r = (apr/12)/100
      n = years*12
      payment = p*(r*(1+r)**n)/((1+r)**n-1)
      @results = {"APR" => apr.to_fs(:percentage,{:precision => 4}), "Number of Years" => years, "Principal" => p.to_fs(:currency), "Monthly Payment" => payment.to_fs(:currency)}
      @instructions = "Calculate another payment"

    elsif @operation == "random"
      @min = params.fetch("min").to_f
      @max = params.fetch("max").to_f
      result = rand(@min..@max)
      @results = {"Minimum": @min, "Maximum": @max, "Random Number": result}
      @instructions = "Pick another random number"
    end

    render(:template => "calculator_templates/results")
  end
end

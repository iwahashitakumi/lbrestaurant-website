class Public::LbrController < Public::ApplicationController
  def message
  end

  def show
  end

  (1..4).each do |num|
    define_method("staff_interview#{num}") do
    end
  end

  def premium
  end
end

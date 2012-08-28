# coding: utf-8

class LessonController < ApplicationController
  before_filter :do_before, only: :step7
  def step1
    render text: "こんにちは、#{params[:name]}さん"
  end
  def step2
    # render text: params[:controller] + "#" + params[:action]
    render text: "your ip: #{request.remote_ip}"
  end
  def step3
    redirect_to action: "step4"
  end
  def step4
    render text: "welcome step3->step4"
  end
  def step5
    flash[:notice] = "moved from step5"
    redirect_to action: "step6"
  end
  def step6
    render text: flash[:notice]
  end
  def step7
    render text: @message
  end
  def step8
    @price = (2000 * 1.05).floor
  end
  def step9
    @price = (1000 * 1.05).floor
    render "step8"
  end
  def step10
    @comment = "<script>alert('XSS')</script>"
  end
  def step13
    @time = Time.now
  end
  def step19
    @items = { "オマール海老" => 4980, "バナメイエビ" => 120,
              "伊勢エビ" => 2580, "ブラックタイガー" => 1289 }
  end

  private
  def do_before
    @message = "こんにちはこんにちは"
  end
end

class PagesController < ApplicationController
  
  def hello
    render :text => "hello, world !<br />"
  end
  
  def weather
    render :text => "今天早上的天氣不錯。"
  end
  
  def who
    render :text => "我是李一詩"
  end
  
  def son
    render :text => "我有一個小孩。他是個男孩。"
  end
  
  def index
  
  end
  
  def welcome
    #render :text => "action welcome"
    puts "hello."
  end

end

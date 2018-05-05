class RaitingsController < ApplicationController
attr_accessor :data, :students_groups, :raiting

  def index
    @count = 0;
    @rait = Raiting.new
    @data = @rait.get_data
    @students_groups = @rait.get_students_groups
  end
end

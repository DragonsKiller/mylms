class RaitingsController < ApplicationController
attr_accessor :data, :students_groups, :raiting

  def index
    @count = 0;
    @rait = Raiting.last
    @data = @rait.data
    @students_groups = @rait.get_students_groups
  end

  def create
    Raiting.create
  end
end

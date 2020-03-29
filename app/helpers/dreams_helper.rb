# frozen_string_literal: true

module DreamsHelper
  def dreams_list; end

  def title_cut(dream_title)
    dream_title.split(" ").first
  end
end

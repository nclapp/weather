helpers do

  def current_conditions
    open(WX_LINK) do |f|  # This is OpenURI
      return JSON.parse(f.read)
    end
  end

end

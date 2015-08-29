module SlideDecorator
  def share_url
    if published?
      slide_url(self)
    else
      slide_url(self, token: self.token)
    end
  end
end

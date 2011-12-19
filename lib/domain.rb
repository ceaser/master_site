class Domain
  def self.matches?(request)
    case request.domain
    when "localhost", '', nil
      false
    else
      true
    end
  end
end

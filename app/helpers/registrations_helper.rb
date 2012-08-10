module RegistrationsHelper
  def provider?(user, provider)
    if user.authorizations.find_by_provider(provider)
      user
    end
  end
end

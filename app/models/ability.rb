class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    return unless user.present?
    can %i[read create], Recipe

    can %i[read create], Food

    can :update, Recipe, user_id: user.id

    can :toggle_public, Recipe, user_id: user.id

    can %i[add_ingredient create_ingredient remove_ingredient], Recipe, user_id: user.id

    can :destroy, Recipe, user_id: user.id
    can %i[update destroy], Food, user_id: user.id
  end
end

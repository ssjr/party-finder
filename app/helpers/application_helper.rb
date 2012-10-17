module ApplicationHelper
  def brazil_states
    State.names_with_ids
  end

  def brazil_cities(state_id)
    state_id ||= State.first.id
    City.names_with_ids(state_id)
  end
end

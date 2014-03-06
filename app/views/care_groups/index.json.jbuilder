json.array!(@care_groups) do |care_group|
  json.extract! care_group, :user_id, :patient_id
  json.url care_group_url(care_group, format: :json)
end
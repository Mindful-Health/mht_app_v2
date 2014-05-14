json.array!(@patients) do |patient|
  json.extract! patient, :name, :email, :phone, :condition, :deviceId, :vitalThreshold
  json.url patient_url(patient, format: :json)
end
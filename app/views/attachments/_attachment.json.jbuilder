json.extract! attachment, :id, :created_by_id, :updated_by_id, :attachable_id, :attachable_type, :created_at, :updated_at
json.url attachment_url(attachment, format: :json)

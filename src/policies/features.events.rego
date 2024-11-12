package rebac.features.events

default allowed = false
default visible = false
default enabled = false

# Check if "admin" is one of the user's roles
allowed {
	ds.check({
    "object_type": "tenant",
    "object_id": input.tenant.id,
    "relation": "viewer",
    "subject_type": "user",
    "subject_id": input.user.id
  })

  ds.check({
    "object_type": "group",
    "object_id": "viewer",
	"relation": "member",
    "subject_type": "user",
    "subject_id": input.user.id
  })
}

# Visible if the policy is allowed
visible {
	allowed
}

# Enabled if the policy is allowed
enabled {
	allowed
}
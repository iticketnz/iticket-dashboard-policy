package rebac.features.events

default allowed = false
default visible = false
# feature flag
default enabled = true

# Check if "admin" tenant and at least viewer role
allowed {
	ds.check({
    "object_type": "tenant",
    "object_id": input.resource.tenant.id,
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

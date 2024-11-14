package api.get.event.id

import input.policy.path
import input.user.properties.roles as user_roles

default allowed = false
default visible = false
# feature flag
default enabled = true

# Check if tenant and at least viewer role
allowed {
	ds.check({
    "object_type": "tenant",
    "object_id": input.resource.tenant.id,
    "relation": "can_read_events",
    "subject_type": "user",
    "subject_id": input.user.id
  })
}


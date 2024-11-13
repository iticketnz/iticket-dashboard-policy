package rebac.features.users

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
    "relation": "can_view",
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

visible {
	allowed
}

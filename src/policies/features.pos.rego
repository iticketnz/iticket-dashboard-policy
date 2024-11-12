package rebac.features.pos

import input.policy.path
import input.user.properties.roles as user_roles

default allowed = false
default visible = false
# feature flag
default enabled = true

allowed {
	some i
	data.roles[user_roles[i]].perms[path].allowed
}

visible {
	some i
	data.roles[user_roles[i]].perms[path].visible
}

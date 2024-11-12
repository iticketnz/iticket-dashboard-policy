package rebac.features.users

import input.policy.path
import input.user.properties.roles as user_roles

default allowed = false
default visible = false
# Enabled if feature flag is on
default enabled = false

allowed {
	some i
	data.roles[user_roles[i]].perms[path].allowed
}

visible {
	some i
	data.roles[user_roles[i]].perms[path].visible
}

enabled {
}
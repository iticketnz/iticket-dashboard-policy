package rebac.features.rego

import input.policy.path
import input.user.properties.roles as user_roles

default allowed = false
default visible = false
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
	some i
	data.roles[user_roles[i]].perms[path].enabled
}

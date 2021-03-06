//
// to be called by obj_portal during a collision with another object
//

var dest_portal = -1;

for (var i = 0; i < instance_number(obj_portal); i++) {
	var inst = instance_find(obj_portal, i);
	if links_to == inst.link_id {
		dest_portal = inst;
	}
}

with other {
	switch dest_portal.entrance {
		case LEFT:
			x = dest_portal.bbox_left - sprite_get_width(sprite_index) / 2;
			y = dest_portal.y;
		break;
		case RIGHT:
			x = dest_portal.bbox_right + sprite_get_width(sprite_index) / 2;
			y = dest_portal.y;
		break;
		case UP:
			x = dest_portal.x;
			y = dest_portal.bbox_top - sprite_get_height(sprite_index) / 2;
		break;
		case DOWN:
			x = dest_portal.x;
			y = dest_portal.bbox_bottom + sprite_get_height(sprite_index) / 2;
		break;
	}
}
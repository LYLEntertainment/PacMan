// key input
get_input();

// movement
calc_movement();

// apply speed
apply_speed(hsp_apply, vsp_apply);

// check collisions
check_collisions();

var enter_slow_motion = false;

// apply slow motion
with obj_ghost {
	if state == ghost_states.IDLE or state == ghost_states.IDLE_TRANSITION {
		with other {
			var threshold = 2 * TILE_SIZE;
			var x2 = hsp != 0 ? x + h_facing * threshold : x;
			var y2 = vsp != 0 ? y + v_facing * threshold : y;

			var idle_ghost = collision_line(x, y, x2 , y2, other, false, true);
			if idle_ghost != noone {
				var distance = distance_to_object(other);
				hsp_apply = max(0.5, hsp_max * distance / threshold);
				vsp_apply = max(0.5, vsp_max * distance / threshold);
				slowed = true;
				enter_slow_motion = true;
			}
		}
	} else if state != ghost_states.FLEE {
		var threshold = 2 * TILE_SIZE;	
		var player_right = collision_line(x, y, bbox_right + threshold, y, other, false, true);
		var player_left = collision_line(x, y, bbox_left - threshold, y, other, false, true);
		var player_bottom = collision_line(x, y, x, bbox_bottom + threshold, other, false, true);
		var player_top = collision_line(x, y, x, bbox_top - threshold, other, false, true);
		
		if player_right != noone or
			player_left != noone or
			player_bottom != noone or
			player_top != noone {
			var distance = distance_to_object(other);
			other.hsp_apply = other.hsp_max * distance / threshold;
			other.vsp_apply = other.vsp_max * distance / threshold;
			
			if state == ghost_states.CHASE {
				path_speed = 2 * distance / threshold;
			} else {
				hsp_apply = max(0.5, 2 * distance / threshold);
				vsp_apply = max(0.5, 2 * distance / threshold);	
			}
			enter_slow_motion = true;
			other.slowed = true;
			slowed = true;
		} else if slowed {
			alarm[ALLOW_CHASE] = 30;
			slowed = false;
		}
	}
}

if slowed and !enter_slow_motion {
	hsp_apply = hsp_max;
	vsp_apply = vsp_max;
}

// animation
anim();
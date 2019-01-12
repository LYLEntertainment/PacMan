//
// ghost wander state
//

if hsp == 0 and vsp == 0 {
	switch next_dir {
		case LEFT:
			next_dir = choose(LEFT, UP, DOWN);
		break;
		case RIGHT:
			next_dir = choose(RIGHT, UP, DOWN);
		break;
		case UP:
			next_dir = choose(LEFT, RIGHT, UP);
		break;
		case DOWN:
			next_dir = choose(LEFT, RIGHT, DOWN);
		break;
	}
}

apply_speed(hsp_max, vsp_max);

check_collisions();

// animation
anim();
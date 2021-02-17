if (other.initialized) {
    image_xscale -= eat_speed * other.bite_scale;
    image_yscale -= eat_speed * other.bite_scale;
    if (image_xscale > .2) {
        physics_remove_fixture(self, bound_fix);
        
        fix_scale = 1 - ((1 - image_xscale)/2)
        fix = get_food_fixture(fix_scale*sprite_width/2);
        bound_fix = physics_fixture_bind(fix, self);
        physics_fixture_delete(fix);
    } else {
      to_destroy = true; 
    }
}


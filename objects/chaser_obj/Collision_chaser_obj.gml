//ugly hack plz resolve
if (initialized && other.initialized && global.cannibals) {
    // Get more energy from similarly colored food.
    
    if (other.area < area/2) {
        energy += other.energy;
    }
    
    if (area < other.area/2) {
        to_destroy = true;
    }
    
    /*color_sim = color_similarity(self, other);
    color_dampening = .6;
    color_sim *= color_dampening;
    color_multiplier = 1 + color_sim;
    
    // TODO don't let it eat more food than exists!
    meal_size = food_energy * color_multiplier * bite_scale;
    
    energy = min(max_energy, energy + meal_size);*/
}

/* */
/*  */

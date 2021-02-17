//ugly hack plz resolve
if (initialized) {
    // Get more energy from similarly colored food.
    color_sim = color_similarity(self, other);
    color_dampening = .6;
    color_sim *= color_dampening;
    color_multiplier = 1 + color_sim;
    
    // TODO don't let it eat more food than exists!
    meal_size = food_energy * color_multiplier * bite_scale;
    
    energy = min(max_energy, energy + meal_size);
}


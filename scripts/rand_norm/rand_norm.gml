function rand_norm(mu, sigma) {
	return sigma * sqrt(-2 * ln(random(1))) * cos(2 * pi * random(1)) + mu;
}

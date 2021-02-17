if (target != -1 && instance_exists(target)) {
    (target).chosen = false;
}
target = random_instance(chaser_obj);
if (target != -1) {
    (target).chosen = true;
}


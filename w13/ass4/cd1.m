function ret = cd1(rbm_w, visible_data)
% <rbm_w> is a matrix of size <number of hidden units> by <number of visible units>
% <visible_data> is a (possibly but not necessarily binary) matrix of size <number of visible units> by <number of data cases>
% The returned value is the gradient approximation produced by CD-1. It's of the same shape as <rbm_w>.
    visible_data = sample_bernoulli(visible_data);
    hidden_probability = visible_state_to_hidden_probabilities(rbm_w, visible_data);
    hidden_state = sample_bernoulli(hidden_probability);
    d_G_by_rbm_w = configuration_goodness_gradient(visible_data, hidden_state);
    w_p = d_G_by_rbm_w;
    visible_probability = hidden_state_to_visible_probabilities(rbm_w, hidden_state);
    visible_state = sample_bernoulli(visible_probability);
    hidden_probability = visible_state_to_hidden_probabilities(rbm_w, visible_state);
    % hidden_state = sample_bernoulli(hidden_probability);
    d_G_by_rbm_w = configuration_goodness_gradient(visible_state, hidden_probability);
    w_m = d_G_by_rbm_w;
    ret =  w_p .- w_m;
    % error('not yet implemented');
end

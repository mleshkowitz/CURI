%% Experiment 1
ex1_now = [0.75, 0.273, 0.682, 0.636, 0.375, 0.682, 0.773, 0.308, 0.636, 0.2, 0.381, 0.762, 0.545, 0.4, 0.364, 0.364, 0.864, 0.571, 0.591, 0.571, 0.235, 0.167, 0.667, 0.476, 0.6, 0.35, 0.273, 0.762, 0.182, 0.6, 0.769, 0.583, 0.35, 0.5, 0.476, 0.545, 0.3, 0.357, 0.636, 0.545, 0.545, 0.818, 0.294, 0.455, 0.727, 0.867, 0.524, 0.762, 0.667, 0.5, 0.476, 0.727, 0.227, 0.619, 0.5, 0.65, 0.364, 0.727, 0.476, 0.227, 0.789, 0.864, 0.5, 0.524, 0.167, 0.471, 0.364, 0.8, 0.333, 0.524, 0.529, 0.682, 0.545, 0.318, 0.409, 0.1, 0.318, 0.619, 0.55, 0.158, 0.619, 0.429, 0.762, 0.722, 0.556, 0.421, 0.636, 0.545, 0.727, 0.438, 0.727, 0.765, 0.682, 0.591, 0.737, 0.381, 0.333, 0.364, 0.455, 0.333];
ex1_later = [0.727, 0.636, 0.455, 0.591, 0.684, 0.773, 0.727, 0.381, 0.773, 0.571, 0.188, 0.714, 0.462, 0.364, 0.55, 0.682, 0.6, 0.778, 0.5, 0.682, 0.591, 0.722, 0.421, 0.667, 0.824, 0.227, 0.667, 0.45, 0.611, 0.381, 0.727, 0.308, 0.8, 0.632, 0.81, 0.545, 0.824, 0.55, 0.4, 0.5, 0.938, 0.706, 0.682, 0.667, 0.545, 0.909, 0.727, 0.684, 0.6, 0.35, 0.333, 0.579, 0.438, 0.65, 0.5, 0.857, 0.706, 0.682, 0.7, 0.636, 0.762, 0.7, 0.364, 0.438, 0.429, 0.579, 0.857, 0.533, 0.312, 0.667, 0.773, 0.571, 0.538, 0.571, 0.545, 0.444, 0.952, 0.571, 0.364, 1, 0.611, 0.4, 0.667, 0.714, 0.455, 0.818, 0.55, 0.762, 0.5, 0.45, 0.471, 0.5, 0.476, 0.615, 0.524, 0.864, 0.682, 0.308, 0.545, 0.85, 0.591, 0.571, 0.368, 0.588, 0.5, 0.529, 0.524, 0.824];
p_permutation_ex1 = permutation_test(ex1_now, ex1_later); % p = 7.1000e-04
print_experiment_summary('Experiment 1', ex1_now, ex1_later, p_permutation_ex1);

%% Experiment 3 - prepare data
load('experiment_3_in_matlab_matrices.mat')
AXIS = 2; % 1 analysis on questions, 2 on participants

% disp('Now, standard Urge')
exp3_ns = round(mean(experiment3now,AXIS,'omitnan')',3);
% disp('Later, standard Urge')
exp3_ls = round(mean(experiment3later,AXIS,'omitnan')' ,3);
% disp('Now, increased Urge')
exp3_nm = round(mean(experiment3nowmanipulated,AXIS,'omitnan')',3);
% disp('Later, increased Urge')
exp3_lm = round(mean(experiment3latermanipulated,AXIS,'omitnan')',3);

%% Experiment 3 - now vs. later
e3now = [exp3_nm, exp3_ns];
e3later = [exp3_lm, exp3_ls];
p_permutation_ex3_now_later = permutation_test(e3now, e3later); % p_experiment_3_now_later = 0.0122
print_experiment_summary('Experiment 3', e3now, e3later, p_permutation_ex3_now_later);

%% Experiment 3 - modulated vs. standard
e3standard = [exp3_ns, exp3_ls];
e3modulated = [exp3_nm, exp3_lm];
p_permutation_ex3_standard_modulated = permutation_test(e3standard, e3modulated); % p_experiment_3_now_later = 0.0285

%% Experiment 3 - now, modulated vs. standard
p_permutation_ex3_now_modulated_vs_standard = permutation_test(exp3_ns, exp3_nm); % p_permutation_ex3_now_modulated_vs_standard=0.0120
print_experiment_summary('Experiment 3: now modulated vs. standard', exp3_nm, exp3_ns, p_permutation_ex3_now_modulated_vs_standard);

%% Experiment 3 - Future, modulated vs. standard
p_permutation_ex3_later_modulated_vs_standard = permutation_test(exp3_ls, exp3_lm); % p_permutation_ex3_later_modulated_vs_standard=
print_experiment_summary('Experiment 3: later modulated vs. standard', exp3_ls, exp3_lm, p_permutation_ex3_later_modulated_vs_standard);
bootstrap_test(exp3_ls, exp3_lm)
%% Experiment 3 - What group size should we use for interaction effect
% So as to maintain the two main effects directionality
figure
IS_RUN_WHAT_GROUP_SIZE = false;
if IS_RUN_WHAT_GROUP_SIZE
    SUBSAMPLE_PROPORTIONS = 0.69:0.01:0.71;
    SIMULATION_REPETITION = 1e5;
    now = [exp3_ns exp3_nm];
    later = [exp3_ls exp3_lm];
    standard = [exp3_ns exp3_ls]; 
    manipulated = [exp3_nm exp3_lm]; 
    manipulated_standard_diff = zeros(length(SUBSAMPLE_PROPORTIONS), SIMULATION_REPETITION);
    manipulated_standard_diff = zeros(length(SUBSAMPLE_PROPORTIONS), SIMULATION_REPETITION);
    for jj = 1:length(SUBSAMPLE_PROPORTIONS)
        subsample_proportion = SUBSAMPLE_PROPORTIONS(jj)
        for ii=1:SIMULATION_REPETITION
            now = reshuffle(now); how_many_now = round(length(now)*subsample_proportion);
            later = reshuffle(later); how_many_later = round(length(later)*subsample_proportion);       
            later_now_diff(jj,ii) = mean(later(1:how_many_later))-mean(now(1:how_many_now)); 

            standard = reshuffle(standard); how_many_standard = round(length(standard)*subsample_proportion);
            manipulated = reshuffle(manipulated); how_many_manipulated = round(length(manipulated)*subsample_proportion);       
            manipulated_standard_diff(jj,ii) = mean(manipulated(1:how_many_manipulated))-mean(standard(1:how_many_standard)); 

        end
    end

    main_effects_simulated_diffs = [manipulated_standard_diff, later_now_diff];
    plot(SUBSAMPLE_PROPORTIONS, mean(main_effects_simulated_diffs > 0, 2))
    xlabel('Subgroup roportion sampling (e.g. 0.5 = half of every group)')
    ylabel('Proportion of simulations in which main effect directionality holds');
    set(gca,'FontSize', 16)
end

%% Experiment 3 - Interaction effect
clc
SAMPLE_P = 0.7;
REPETITIONS = 1e5;
manipulated_diff_greater_than_controled_diff = zeros(1, REPETITIONS);
for ii=1:REPETITIONS
    control_diff = mean(reshuffle_p_percent(exp3_ls, SAMPLE_P)) - mean(reshuffle_p_percent(exp3_ns, SAMPLE_P));
    manipulated_diff = mean(reshuffle_p_percent(exp3_lm, SAMPLE_P)) - mean(reshuffle_p_percent(exp3_nm, SAMPLE_P));
    manipulated_diff_greater_than_controled_diff(ii) = control_diff>manipulated_diff;
end
mean(manipulated_diff_greater_than_controled_diff);

now_diff_greater_than_later_diff = zeros(1, REPETITIONS);
for ii=1:REPETITIONS
    later_diff = mean(reshuffle_p_percent(exp3_lm, SAMPLE_P)) - mean(reshuffle_p_percent(exp3_ls, SAMPLE_P));
    now_diff = mean(reshuffle_p_percent(exp3_nm, SAMPLE_P)) - mean(reshuffle_p_percent(exp3_ns, SAMPLE_P));
    now_diff_greater_than_later_diff(ii) = now_diff>later_diff;
end

mean(now_diff_greater_than_later_diff);

exp3_interaction = 1-mean([now_diff_greater_than_later_diff, manipulated_diff_greater_than_controled_diff]) %  p = 0.0254

%% Experiment 4 -

e4now = [0.750, 0.364, 0, 0.182, 0.615, 0.750, 0.600, 0.611, 0.450, 0.250, 0.385, 0.615, 0.357, 0.438, 0.222, 0.667, 0.632, 0.619, 0.955, 0.667, 0.438, 0.400, 0.824, 0.278, 0.625, 0.500, 0.389, 0.250, 0.563, 0.700, 0.375, 0.188, 0.333, 0.647, 0.417, 0.533, 0.182, 0.300, 0.471, 0.438, 0.563, 0.467, 0.682, 0.500, 0.316, 0.563, 0.500, 0.400, 0.214, 0.200, 0.417, 0.357, 0.563, 0.412, 0.500, 0.533, 0.364, 0.364, 0.316, 0.467, 0.278, 0.737, 0.273, 0.364, 0.471, 0.714, 0.313, 0.429, 0.250, 0.214, 0.722, 0.385, 0.545, 0.500, 0.333, 0.444, 0.688, 0.462, 0.455, 0.353, 0, 0.571, 0.318, 0.524];
e4later = [0.357, 0.273, 0.706, 0.636, 0.429, 0.467, 0.550, 0.647, 0.421, 0.588, 0.462, 0.438, 0.176, 0.313, 0.647, 0.545, 0.684, 0.333, 0.647, 0.364, 0.308, 0.650, 0.600, 0.667, 0.474, 0.417, 0.333, 0.333, 0.524, 0.467, 0.588, 0.533, 0.429, 0.500, 0.500, 0.450, 0.588, 0.538, 0.545, 0.526, 0.286, 0.632, 0.333, 0.529, 0.526, 0.400, 0.471, 0.474, 0.579, 0.333, 0.455, 0.364, 0.600, 0.444, 0.471, 0.615, 0.688, 0.333, 0.579, 0.692, 0.429, 0.500, 0.600, 0.684, 0.636, 0.579, 0.667, 0.357, 0.313, 0.529, 0.238, 0.500];

p_permutation_ex4 = permutation_test(e4now, e4later); % p_permutation_ex4 = 0.0555

print_experiment_summary('Experiment 3', e4now, e4later, p_permutation_ex4);
% [h,p,q,stats] = ttest2(e4now, e4later,'Tail','left')%  0.0563


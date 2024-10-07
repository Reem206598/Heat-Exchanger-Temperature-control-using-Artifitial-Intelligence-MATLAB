% Define the number of variables
no_var = 3;

% Define the lower and upper bounds
lb = [0 0 -1];
ub = [6 6 3];

% Set GA options
ga_opt = optimoptions('ga', 'Display', 'off', 'Generations', 10, ...
    'PopulationSize', 70, 'PlotFcn', @gaplotbestf);

% Define the objective function
obj_fn = @(k) optimization_PID(k);

% Run the Genetic Algorithm
[k, best] = ga(obj_fn, no_var, [], [], [], [], lb, ub, [], ga_opt);

% Display the best parameters found and the best fitness value
disp('Best PID parameters:');
disp(k);
disp('Best objective function value:');
disp(best);

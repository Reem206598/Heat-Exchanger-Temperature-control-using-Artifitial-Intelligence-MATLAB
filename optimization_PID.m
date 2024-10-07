function cost = optimization_PID(k)
assignin('base','k',k);
sim("GA_Pid.slx");
cost=ITAE(length(ITAE))
end
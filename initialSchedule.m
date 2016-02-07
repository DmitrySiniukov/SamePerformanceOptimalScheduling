function [ result ] = initialSchedule( preparedTasks, processorsNumber )

result = {};               % result schedule
n = size(preparedTasks, 1);
m = processorsNumber;
escapeTimes = zeros(1, m);  % auxiliary array
currentState = cell(m, 2);  % current schedule

i = 0;  %tasks iteration var.
j = 0;  % processors iteration var.
% Iterating all tasks and processors
while i <= n && j < m
    
    i = i + 1;
    currentTask = preparedTasks(i,:);
    
    target = 0;
    % check if in j processors exists such, Ck + li <= di...
    for k = 1:j
        if escapeTimes(k) > currentTask(4)
            continue;
        end
        if target ~= 0
            return;
        end
        target = k;
    end
    
    if target ~= 0
        currentState{target,2}(end + 1) = currentTask(1);
        escapeTimes(target) = escapeTimes(target) + currentTask(2);
        continue;
    end
    
    % engage next processor
    j = j + 1;
    currentState{j,1} = currentTask(4);
    currentState{j,2} = currentTask(1);
    escapeTimes(j) = currentTask(3);
    
end

result = { 1 escapeTimes currentState };
% Define the sign of optimality
if i ~= j
    result{1} = 2;
end

end
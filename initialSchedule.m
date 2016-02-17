function [ indicator, m, n, initSchedule, lastTaskIndex ] = ...
    initialSchedule( preparedTasks, processorsNumber )

indicator = 0;
m = processorsNumber;
n = size(preparedTasks, 1);
initSchedule = cell(m, 3);
lastTaskIndex = 0;

i = 0;  %tasks iteration var.
j = 0;  % processors iteration var.
% Iterating all tasks and processors
while i < n && j < m
    
    i = i + 1;
    currentTask = preparedTasks(i,:);
    
    target = 0;
    % check if in j processors exists such, Ck + li <= di...
    for k = 1:j
        if initSchedule{k,3} > currentTask(4)
            continue;
        end
        % the optimality indicator does not work
        if target ~= 0
            return;
        end
        target = k;
    end
    
    if target ~= 0
        initSchedule{target,2}(end + 1) = currentTask(1);
        initSchedule{target,3} = initSchedule{target,3} + currentTask(2);
        continue;
    end
    
    % engage next processor
    j = j + 1;
    initSchedule{j,1} = currentTask(4);
    initSchedule{j,2} = currentTask(1);
    initSchedule{j,3} = currentTask(3);
    
end

indicator = 1;
% Define the indicator of optimality
if i ~= j
    indicator = 2;
end

lastTaskIndex = i;

end
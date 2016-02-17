function [ schedule ] = a1_1( preparedTasks, m, n, initSchedule, startTaskIndex )
%Algorithm A1.1

schedule = {};

% sort initSchedule by escape times
queue = sortrows([ (1:m)' cat(1, initSchedule{:,3}) ], 2);
for i = startTaskIndex:n
    currentTask = preparedTasks(i,:);
    if queue(1,2) + currentTask(2) > currentTask(3)
        return;
    end
    queue(1,2) = queue(1,2) + currentTask(2);
    initSchedule{queue(1,1),2}(end + 1) = currentTask(1);
    newPlace = 1;
    % find new place for updated element
    while newPlace < m && queue(1,2) > queue(newPlace + 1,2)
        newPlace = newPlace + 1;
    end
    queue = [ queue(2:newPlace,:); queue(1,:); queue((newPlace + 1):m,:) ];
end

schedule = initSchedule;

end
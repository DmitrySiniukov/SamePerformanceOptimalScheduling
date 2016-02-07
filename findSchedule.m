function [ schedule ] = findSchedule( tasksInfo, processorsInfo )
%findSchedule tries to find the optimal schedule in polynomial time
%   tasksInfo - information describing tasks
%   processorsInfo - information describing processors
%   schedule - resulting schedule

% Check arguments
if ~exist('tasksInfo','var') || ~exist('processorsInfo','var') || ...
        ~isnumeric(tasksInfo) || ~isnumeric(processorsInfo) || ...
        isempty(tasksInfo) || isempty(processorsInfo) || ...
        size(tasksInfo, 2) < 2 || (size(processorsInfo, 2) ~= 1 && ...
        size(tasksInfo, 1) ~= size(processorsInfo, 1))
    disp('Arguments error.');
    return;
end

schedule = {};

if any(tasksInfo(:,2) < tasksInfo(:,1))
    return;
end

% sorting by d - l
preparedTasks = [(1:size(tasksInfo, 1))' tasksInfo (tasksInfo(:, 2) - tasksInfo(:, 1))];    
preparedTasks = sortrows(preparedTasks, 4);

if size(processorsInfo, 2) == 1
    % Same performances processors
    initSchedule = initialSchedule(preparedTasks, processorsInfo(1));
    if ~isempty(initSchedule)
        % a_1_1, a_1_2, ...
        
    end
    % Approximation
    return;
end

% Different performances processors
disp('Different performances processors.');

end
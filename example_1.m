% Tasks array initialization
tasksInfo(1,:)  = [2 6];
tasksInfo(2,:)  = [1 7];
tasksInfo(3,:)  = [9 18];
tasksInfo(4,:)  = [6 18];
tasksInfo(5,:)  = [3 16];
tasksInfo(6,:)  = [4 20];
tasksInfo(7,:)  = [1 17];
tasksInfo(8,:)  = [1 18];
tasksInfo(9,:)  = [1 19];
tasksInfo(10,:) = [2 22];
tasksInfo(11,:) = [17 37];
tasksInfo(12,:) = [9 34];
tasksInfo(13,:) = [39 65];
tasksInfo(14,:) = [20 50];
tasksInfo(15,:) = [16 52];
tasksInfo(16,:) = [4 54];

% The number of processors
processorsNumber = 3;

% Display result
result = findSchedule(tasksInfo, processorsNumber);
disp(result);
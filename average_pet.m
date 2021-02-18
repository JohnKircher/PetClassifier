%This function takes in a data matrix X and a label
%vector y and outputs the average cat image and average dog image.
function [avgcat avgdog] = average_pet(X,y)


i = find(y == 1);
avgdog = mean(X(i,:));

j = find(y == -1);
avgcat = mean(X(j,:));

end


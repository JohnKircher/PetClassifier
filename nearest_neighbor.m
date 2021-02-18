%Nearest neighbor training error rate is [0%].
%Nearest neighbor test error rate is [20%].

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess. Each guess is found
%by searching through Xtrain to find the closest row, and then 
%outputting its label.
function yguess = nearest_neighbor(Xtrain,ytrain,Xrun)

runSize = size(Xrun, 1);

yguess = zeros(runSize, 1);

trainSize = size(Xtrain, 1);

for i = 1:runSize
    j = 1;
    
    for k = 1:trainSize
        if(norm(Xtrain(k,:) - Xrun(i,:)) < norm(Xtrain(j,:) - Xrun(i,:)))
            j = k;
        end
    end
    yguess(i) = ytrain(j);
end

end

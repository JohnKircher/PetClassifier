%Closest average training error rate is [20%].
%Closest average test error rate is [18%].

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess, corresponding to whether
%each row of Xtest is closer to the average cat or average dog.
function yguess = closest_average(Xtrain,ytrain,Xrun)

[avgcat, avgdog] = average_pet(Xtrain, ytrain);


numberOfTests = size(Xrun,1);
yguess = zeros(numberOfTests,1);

for i = 1:numberOfTests
    if(norm(Xrun(i,:) - avgcat) > norm(Xrun(i,:) - avgdog))
        yguess(i) = 1;
    else
        yguess(i) = -1;
    end
end

end
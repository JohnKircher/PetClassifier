%Linear discriminant analysis training error rate is [1.2%].
%Linear discriminant analysis test error rate is [16%].

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the cat
%and dog sample mean vectors as well as the sample covariance matrix 
%(which is assumed to be equal for cats and dogs). 
%It also takes in a data matrix Xrun and produces a vector of
%label guesses yguess, corresponding to the ML rule for
%jointly Gaussian vectors with different means and the same 
%covariance matrix.
function yguess = lda(Xtrain,ytrain,Xrun)

[avgTrainCat, avgTrainDog] = average_pet(Xtrain,ytrain);

dog = cov(Xtrain(find(ytrain == 1),:));
cat = cov(Xtrain(find(ytrain == -1),:));

dogSize = sum(ytrain == 1);
catSize = sum(ytrain == -1);

trainSize = length(ytrain);

sigma = (1/(trainSize-2)) * (((catSize-1) * cat) + ((dogSize-1) * dog));

A = pinv(sigma) * transpose(avgTrainDog - avgTrainCat);

B = (avgTrainDog * pinv(sigma) * transpose(avgTrainDog)) - (avgTrainCat * pinv(sigma) * transpose(avgTrainCat));

[runSize,~] = size(Xrun);

for i = 1:runSize
    if((2 * (Xrun(i,:)) * A) >= B)
        yguess(i,1) = 1;
    else
        yguess(i,1) = -1;
    end
end

end
%Perceptron training error rate is [0%]
%Perceptron test error rate is [18%]

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to the decision rule corresponding
%to a very simple one-layer neural network: the perceptron. 
%It also takes in a data matrix Xrun and produces a vector of label
%guesses yguess, corresponding to the sign of the linear prediction.
function yguess = perceptron(Xtrain,ytrain,Xrun)

matrix = pinv(Xtrain' * Xtrain);

perceptron = matrix * Xtrain' * ytrain;

runSize = size(Xrun, 1);

yguess = zeros(runSize, 1);

yguess = sign(Xrun * perceptron);

end
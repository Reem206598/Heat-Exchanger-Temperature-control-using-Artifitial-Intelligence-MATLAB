bCanContinue = true;
Cycles = 0;

%while (bCanContinue)

x = out.error';
t = out.output';

trainFnc = 'trainlm';
hiddenLayerSize = [1 1 1 1];
net = fitnet(hiddenLayerSize, trainFnc);

net.trainParam.epochs = 10000;
net.trainParam.goal = 1e-10;
net.trainParam.lr = 0.1;
net.trainParam.max_fail = 1000;

net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
[net,tr] = train(net,x,t);
%Test the Network

y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y);
Cycles = Cycles + 1;

if (performance <= 1e-10)
bCanContinue = false;
 end
 
 %end


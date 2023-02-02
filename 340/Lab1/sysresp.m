function y =  sysresp(x, a)
%
% computes the output in response to an arbitrary input x[n], n=0,¡­N-1
% assume that the system has 0 initial conditions
% input:
% x: the input signal,
% a: the system parameter
% output:
% y: the output signal
N = length(x); % length of the vector
% initialization of the output signal
y = zeros(1,N);

% the first element in y is y[0], the second is y[1], ...
% note that in Matlab, the vector index starts from 1 and must be a pos. integer
% so the output at time n (y[n]) is the (n+1)th element in the vector y
% we are interested in the output for 0<=n<=N-1
% assume that y[n]=0 for n<0, first calculate y[0]

% finding the output y[1] to y[N-1]
y(1) = x(1);
for k = 2:N
    y(k) = a*y(k-1)+x(k);
end

return
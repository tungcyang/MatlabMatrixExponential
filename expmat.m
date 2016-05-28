function [EX] = expmat(X)
% expmat(X) returns the matrix exponential of the input square matrix X.
%   It returns a NaN matrix of the same dimension as X if X is not
%   2-dimensional or X is not square.

% Parameters used in this function.
    threshold = 0.000001;   % the threshold on when the infinite series stop.

    msize = size(X);
    if ((length(msize) ~= 2) || (msize(1) ~= msize(2)))
        % X is not a 2-dimensional matrix, or it is not a square one
        EX = NaN(msize);
        return
    end
    
% Now we handled the cases for bad input X.  We will use the power series
% in "Matrix Exponential" in
% https://en.wikipedia.org/wiki/Matrix_exponential to evaluate the result.
    EX = zeros(msize);
    k = 0;
    term = eye(msize);

    while (norm(term) > threshold*norm(EX))
        EX = EX + term;
        
        k = k + 1;
        term = (term*X)/k;
    end
    
% When the loop breaks, EX should be the sum from the power series.
end


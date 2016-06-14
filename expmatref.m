function [EX] = expmatref(X)
% expmatref(X) returns the matrix exponential of the input square matrix X.
%   It computes the exponential with Taylor's series with a tweak that it
%   is believed to be accurate.

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
    listofterms = zeros(msize(1),msize(2), 1);

    while (norm(term) > threshold*norm(EX))
        EX = EX + term;
        k = k + 1;
        listofterms(:,:, k) = term;
        term = (term*X)/k;
    end
    
    % When this while loop ends, we would keep evaluating term and
    % listofterms from (k + 1) to 3*k
    for i = (k + 1):(3*k)
        listofterms(:,:, i) = term;
        term = (term*X)/i;
    end
    
    % Now we are done.  We will add listofterms to get EX, though we do it
    % in reverse.
    EX = zeros(msize);
    for i = (3*k):-1:1
        EX = EX + listofterms(:,:, i);
    end
end
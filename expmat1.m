function [EX] = expmat1(X)
% expmat1(X) returns the matrix exponential of the input square matrix X.
%   It computes the exponential with Sylvester's Formula if X is
%   diagonalizable, and it appeals to Taylor Series expansion if it is not.

% Diagonalizable matrices: https://en.wikipedia.org/wiki/Diagonalizable_matrix
% Sylvester's Formula: https://en.wikipedia.org/wiki/Sylvester%27s_formula

    msize = size(X);
    if (msize(1) ~= msize(2))
        % X is not a square matrix.
        EX = NaN(msize);
        return
    end
    
    [V, D] = eig(X);
    
    if (size(unique(diag(D)), 1) < size(diag(D), 1))
        % Some of D eigenvalues are not unique and thus it is not
        % diagonalizable.  We will fall back to Taylor Series Expansion
        % (expmat()).
        EX = expmat(X);
        return
    end
    
    EX = (V*diag(exp(diag(D))))/V;
end



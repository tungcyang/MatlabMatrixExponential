% This script will evaluate the matrix exponential function for a
% predetermined iterations on randomly generated matrices.  The elapsed
% time will be recoreded for comparison among different evaluation methods.
NUM_ITERATIONS = 65536;
MAX_MATRIX_DIMENSION = 10;
MIN_MATRIX_DIMENSION = 2;

rng('default');
profile on
for i = 1:NUM_ITERATIONS
    msize = MIN_MATRIX_DIMENSION + ...
            floor((MAX_MATRIX_DIMENSION - MIN_MATRIX_DIMENSION + 1)*rand(1));
    % msize would be the dimension of the matrix X we generate in this
    % iteration.  It lies between MIN_MATRIX_DIMENSION and
    % MAX_MATRIX_DIMENSION (inclusive on both ends).
    X = randn(msize);
    EX = expmat(X);
end

p = profile('info');
disp(['Total Time: ' num2str(p.FunctionTable.TotalTime) ' seconds'])



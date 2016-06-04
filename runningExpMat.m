% This script will evaluate the matrix exponential function for a
% predetermined iterations on randomly generated matrices.  The elapsed
% time will be recoreded for comparison among different evaluation methods.
NUM_ITERATIONS = 262114;
MAX_MATRIX_DIMENSION = 10;
MIN_MATRIX_DIMENSION = 2;

% Verification of correctness of expmat() and expmat1()
rng('default');
maxRelativeError = 0.0;
maxRelativeErrorRatio = 0.0;
for i = 1:NUM_ITERATIONS
    msize = MIN_MATRIX_DIMENSION + ...
            floor((MAX_MATRIX_DIMENSION - MIN_MATRIX_DIMENSION + 1)*rand(1));
    % msize would be the dimension of the matrix X we generate in this
    % iteration.  It lies between MIN_MATRIX_DIMENSION and
    % MAX_MATRIX_DIMENSION (inclusive on both ends).
    X = randn(msize);
    EX = expm(X);
    EX0 = expmat(X);
    EX1 = expmat1(X);
    expmatError = norm(EX0 - EX)/norm(EX);
    expmat1Error = norm(EX1 - EX)/norm(EX);
    if (expmat1Error > maxRelativeError)
        maxRelativeError = expmat1Error;
    end
    if (expmat1Error/expmatError > maxRelativeErrorRatio)
        maxRelativeErrorRatio = expmat1Error/expmatError;
    end
end
% Going over the loop above for NUM_ITERATIONS = 262114,
% maxRelativeError = 4.4028e-13 and maxRelativeErrorRatio = 6.7119e-07.

rng('default');
tStart = tic;
for i = 1:NUM_ITERATIONS
    msize = MIN_MATRIX_DIMENSION + ...
            floor((MAX_MATRIX_DIMENSION - MIN_MATRIX_DIMENSION + 1)*rand(1));
    % msize would be the dimension of the matrix X we generate in this
    % iteration.  It lies between MIN_MATRIX_DIMENSION and
    % MAX_MATRIX_DIMENSION (inclusive on both ends).
    X = randn(msize);
    EX = expm(X);
end
elapsedTime = toc(tStart);
disp(['Total Time for ' num2str(NUM_ITERATIONS) ' calls of expm(): ' ...
      num2str(elapsedTime) ' seconds'])
  
rng('default');
tStart = tic;
for i = 1:NUM_ITERATIONS
    msize = MIN_MATRIX_DIMENSION + ...
            floor((MAX_MATRIX_DIMENSION - MIN_MATRIX_DIMENSION + 1)*rand(1));
    % msize would be the dimension of the matrix X we generate in this
    % iteration.  It lies between MIN_MATRIX_DIMENSION and
    % MAX_MATRIX_DIMENSION (inclusive on both ends).
    X = randn(msize);
    EX = expmat(X);
end
elapsedTime = toc(tStart);
disp(['Total Time for ' num2str(NUM_ITERATIONS) ' calls of expmat(): ' ...
      num2str(elapsedTime) ' seconds'])

rng('default');
tStart = tic;
for i = 1:NUM_ITERATIONS
    msize = MIN_MATRIX_DIMENSION + ...
            floor((MAX_MATRIX_DIMENSION - MIN_MATRIX_DIMENSION + 1)*rand(1));
    % msize would be the dimension of the matrix X we generate in this
    % iteration.  It lies between MIN_MATRIX_DIMENSION and
    % MAX_MATRIX_DIMENSION (inclusive on both ends).
    X = randn(msize);
    EX = expmat1(X);
end
elapsedTime = toc(tStart);
disp(['Total Time for ' num2str(NUM_ITERATIONS) ' calls of expmat1(): ' ...
      num2str(elapsedTime) ' seconds'])



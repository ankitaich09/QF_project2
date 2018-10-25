for b, c & A in function 2 
   - is saved in corresponding 'fun2_b.txt','fun2_c.txt', and 'fun2_A.txt'
   - b and c should be read out as column vectors, where b is of dimension m by 1, and c is of dimension n by 1
   - A should be read out as matrices of dimension m by n. Each column of A, i.e., A(:,i) corresponds to a_i
   - Examples of how to read the matrices out:

 fid = fopen('fun2_A.txt','r');
  A = fscanf(fid,'%e ',[500,100]);
  fclose(fid);
   
   - The gradient and Hessian of function 2 is given in project description. Hint: you should use vector & matrix calculation in your code as much as possible, instead of accessing to the elements in the vectors or matrices. The matlab expression of the function, its gradient and Hessian is basically given in the project description.
   
   

-- this test procedures and speccially the following points:
--1. can procedure use global varable i.e assign variables or signals that
-------are not declared in the package parameter list
--2. when "IN" parameter is a constant, can we pass in a signal or a variable that has been
------- initialized  upfront


---Summary -----
--1. When the parameter list in a procedure contains an input as a constant,
-- you can declare either variable, signal or a constant for this input.
-- if you declare a signal in the parameter list, and you use a initialized signal,
-- compiler "complains".
-- provided the signal and the variables are INITIALIZED befere he parameter list 
--2.if signal or variables are not initializes, then in the parameter list use signal 
--or a variable.
--3. Can a procedure assign a value to a global parameterhat (one that is not in the parameter list): YES!
--/this is the last state of the program/


--Conclusion--
--1. the use of a Function is for utility purposes and shorthand writing. Output of the
-- function(the retun value) does not have a "synthesizable" meaning, more or less conversion or short writing.

--2. The use of a procedure is like a direct replacement of code in a process or combinational logic.
-- It has a synthesizable meaning the same as all the signals and variables in a process.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

 -----------------------------------------------------------------
 ENTITY min_max IS
 GENERIC (limit : INTEGER := 255);
    PORT ( ena: IN BIT;
           inp1, inp2: IN INTEGER RANGE 0 TO limit;
           min_out, max_out: OUT INTEGER RANGE 0 TO limit);
 END min_max;
 
 
 ------------------------------------------------------------------
 ARCHITECTURE my_architecture OF min_max IS
 -------------------------------------------------------------------
 PROCEDURE sort (in1: IN INTEGER RANGE 0 to limit;
                 --SIGNAL in2: IN INTEGER RANGE 0 TO limit;
                 SIGNAL min, max: OUT INTEGER RANGE 0 TO limit) IS
                 
 BEGIN
 IF (in1 > inp2) THEN
 max <= in1;
 min <= inp2;
 ELSE
 max <= inp2;
 min <= in1;
 END IF;
 END sort;
 --------------------------------------------------------------------
 
  --signal temp: integer range 0 to limit:=3;
  constant temp: integer:=3;
BEGIN
 
 PROCESS (ena)
   -- variable temp: integer range 0 to limit:=3;
 BEGIN
 IF (ena='1') THEN sort (temp, min_out, max_out);
 END IF;
 END PROCESS;
 END my_architecture;
------------------------------------------------------
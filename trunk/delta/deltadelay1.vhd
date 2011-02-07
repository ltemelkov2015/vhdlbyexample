--delta delay example from the book VHDL programming by example by Perry
--@Author: Lachezar Temelkov
-- observe the spurios edge when no delays are specified!
-- in fact you might expect that the circuit would behave differently
-- this is the reason that every compilet has a delta delays on the signal assignment
-- observe what happens if you add inertial delays to circuit

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg IS
   PORT( a, clock : in bit;
         d : out bit);
END reg;

ARCHITECTURE test OF reg IS
SIGNAL b, c : bit;
BEGIN
 
-- No delay added( delta assumed by default)--  
--b <= NOT(a); -- notice no delay
--c <= NOT( clock AND b);
--d <= c AND b;

-- Case 2 inertial delay added ---
-- Note that the NAND evals first and 5 ns later "AND" evals
-- no spur in this case
--b <= NOT(a);
--c <= NOT( clock AND b)after 10 ns;
--d <= c AND b after 15 ns;

--Case 3: Let the NANA evals last and AND evalvs first
-- Note that the glitch showed up again.
b <= NOT(a);
c <= NOT( clock AND b)after 15 ns;
d <= c AND b after 10 ns;

--Conclusion: How this circuit will behave in real time depends on the delays of AND
--and NAND gates, but .. what if the inertal delays are the same(different than )
--The circuit will work with no glitch.
-- As far as the simulator is concerned, the simulator evaluates concurently after delta delay
-- so the results look the same every time the simulator is run.
-- the delay we added are not synthesizablke by real FPGA, but they hels us realize what will happen
-- if we do not understand the boundary between simulator and real circuit.
--Imagine we have a D- Flip Flop on the output D. It will trigger on that glitch without us knowing what is going on!  

END test;

# RPN-calculator
## Functional Reverse Polish Notation calculation complier built using Flex and Bison

### Prerequisites:
* Ensure you have Flex installed on your system
  * can be found at [GNU](http://gnuwin32.sourceforge.net/packages/flex.htm)
* Ensure you have Bison installed on your system
	* can be found at [GNU](http://gnuwin32.sourceforge.net/packages/bison.htm)
* Ensure you have MinGw installed on your system
	* can be found at [OSDN](https://osdn.net/projects/mingw/releases/)
* Set the PATH variable to include the bin directories of gcc (in `C:\MinGW\bin)`
	and flex\bison (in `C:\GnuWin32\bin)`. 
	* To do that, copy this: `C:\MinGw\bin;C:\GnuWin32\bin` 
		and append it to the end of the PATH variable

### How to build:
* In CMD set directory to location of *'rpnCalc.l'*, *'rpnCalc.y'*, and *'makefile'*
* Enter `mingw32-make` or what ever command you use to build C programs on your system into CMD
* You will see the 3 defult test cases run and give results:
  * Test cases:
	1. (3.141 (2 3 +) (1.571 sin) *)	expected output: 15.705
	2. 3.141 2 3 + 1.571 sin *		expected output: 15.705
	3. 5 10 * 5 / 10 +			expected output: 20
	

### How to run/use:
* In CMD set directory to location of *'finalCalc.exe'*
* Enter `finalCalc.exe`
* Enter a math problem in reverse polish notion and press enter

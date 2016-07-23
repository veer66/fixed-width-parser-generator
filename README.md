fixed-width-parser-generator
============================

_fixed-width-parser-genertor_ is a Emacs Lisp program that generate Java code for parsing fixed-width text. It takes a CSV file of column name, offset and column width as input.

Input example
-------------

````csv
FIRST NAME,,1,40
LAST NAME,,41,40
TELEPHONE NUMEBER,,81,20
````

Output example
--------------

````java
row.setFirstName(line.substring(0,40));
row.setLastName(line.substring(40,80));
row.setTelephoneNumber(line.substring(80,100));
````
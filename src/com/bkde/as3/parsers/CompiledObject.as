﻿/* ***********************************************************************
The classes in the package
bkde.as3.* were created by

Barbara Kaskosz of the University of Rhode Island
(bkaskosz@math.uri.edu) and
Douglas E. Ensley of Shippensburg University
(deensl@ship.edu).

Feel free to use and modify the classes in the package 
bkde.as3.* to create
your own Flash applications for educational purposes under the
following two conditions:

1) Please include a line acknowledging this work and the authors
with your application in a way that is visible in your compiled file
or on your html page. 

2) If you choose to modify the classes in the package 
bkde.as3.parsers, put them into a package different from
the original. In this case too, please acknowledge this work
in a way visible to the user.

If you wish to use the materials for commercial purposes, you need our
permission.

This work is supported in part by the National Science Foundation
under the grant DUE-0535327.


Last modified: May 15, 2007
************************************************************************ */

package com.bkde.as3.parsers {

public class CompiledObject {
	
	public var PolishArray:Array;
	
	public var errorMes:String;
	
	public var errorStatus:Number;
	
	
	public function CompiledObject(){
		
		this.PolishArray=[];
		
		this.errorMes="";
		
		this.errorStatus=0;
			
	}
		
}

}
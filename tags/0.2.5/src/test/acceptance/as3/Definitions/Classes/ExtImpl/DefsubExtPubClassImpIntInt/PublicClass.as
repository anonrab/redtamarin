/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is [Open Source Virtual Machine.].
 *
 * The Initial Developer of the Original Code is
 * Adobe System Incorporated.
 * Portions created by the Initial Developer are Copyright (C) 2004-2006
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *   Adobe AS3 Team
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** */


package PubClassImpInternalInt{
use namespace ns;
         internal interface InternalInt{
	
		function deffunc():String;  			       //Default                             //function deffunc2():Number; //interface namespace  method
                function deffunc3():int;     //interface namespace  method                                                       //attribute method

	
	}

	public class PublicClass implements InternalInt{
		

		public function deffunc():String{  			       //Default method
			return"PASSED";
		}
                /*InternalInt function deffunc2():Number{ //Interface Namespace method 			        var a:Number;
                        a=10;
			return a;
		}*/
                public function deffunc3():int{ //Interface Namespace method 			        var b:int;
                        b=20;
			return b;
		}
        	

		public function pubFunc():Boolean{	       //Public method
				return true;
		}	
			
		ns function nsFunc(a="test"):int{	       //Namespace method
			return a.length;	
		}
		
	}
 class DefaultsubClass extends PublicClass{
		

		override public function deffunc():String{ //Default method
			return "really"+"PASSED";
		}


		override public function pubFunc():Boolean{//Public method
                  

				return !true;
		}	
			
		ns override function nsFunc(a="test"):int{	       //Namespace method
			return a.length;	
		}
		
	}

	public class DefaultsubClassAccessor extends DefaultsubClass{
                //var pubsupacc = new DefaultClassAccesor();
                var DefSubClass = new DefaultsubClass();
                var DefSupClass = new PublicClass();
                var i:InternalInt = DefSupClass;
		public function accdeffunc(){return DefSubClass.deffunc();}
		// access default function deffunc
                //public function accdeffunc2(){return i.deffunc2();}
                public function accdeffunc3(){return DefSupClass.InternalInt::deffunc3();}
                public function accsupdeffunc(){return DefSupClass.deffunc();}
                public function accpubfunc(){return pubFunc();}
        	
		public function accnsFunc(a="test"){return ns::nsFunc(a);}
		// access default function nsFunc
       } 	
      
	
}  

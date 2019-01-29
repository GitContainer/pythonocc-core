/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)


This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

*/
%define XCAFAPPDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=XCAFAPPDOCSTRING) XCAFApp

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%include XCAFApp_headers.i

/* templates */
/* end templates declaration */


/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(XCAFApp_Application)

%nodefaultctor XCAFApp_Application;
class XCAFApp_Application : public TDocStd_Application {
	public:
		%feature("compactdefaultargs") GetApplication;
		%feature("autodoc", "	* Initializes (for the first time) and returns the static object (XCAFApp_Application) This is the only valid method to get XCAFApp_Application object, and it should be called at least once before any actions with documents in order to init application

	:rtype: Handle_XCAFApp_Application
") GetApplication;
		static Handle_XCAFApp_Application GetApplication ();
		%feature("compactdefaultargs") InitDocument;
		%feature("autodoc", "	* Set XCAFDoc_DocumentTool attribute

	:param aDoc:
	:type aDoc: Handle_TDocStd_Document &
	:rtype: void
") InitDocument;
		virtual void InitDocument (const Handle_TDocStd_Document & aDoc);
		%feature("compactdefaultargs") ResourcesName;
		%feature("autodoc", "	* methods from TDocStd_Application ================================

	:rtype: char *
") ResourcesName;
		virtual const char * ResourcesName ();
};


%make_alias(XCAFApp_Application)

%extend XCAFApp_Application {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */

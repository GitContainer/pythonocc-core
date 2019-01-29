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
%define IGESCONTROLDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=IGESCONTROLDOCSTRING) IGESControl

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


%include IGESControl_headers.i

/* templates */
/* end templates declaration */


/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%wrap_handle(IGESControl_ActorWrite)
%wrap_handle(IGESControl_AlgoContainer)
%wrap_handle(IGESControl_Controller)
%wrap_handle(IGESControl_IGESBoundary)
%wrap_handle(IGESControl_ToolContainer)

%nodefaultctor IGESControl_ActorWrite;
class IGESControl_ActorWrite : public Transfer_ActorOfFinderProcess {
	public:
		%feature("compactdefaultargs") IGESControl_ActorWrite;
		%feature("autodoc", "	:rtype: None
") IGESControl_ActorWrite;
		 IGESControl_ActorWrite ();
		%feature("compactdefaultargs") Recognize;
		%feature("autodoc", "	* Recognizes a ShapeMapper

	:param start:
	:type start: Handle_Transfer_Finder &
	:rtype: bool
") Recognize;
		virtual Standard_Boolean Recognize (const Handle_Transfer_Finder & start);
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "	* Transfers Shape to IGES Entities //! ModeTrans may be : 0 -> groups of Faces or 1 -> BRep

	:param start:
	:type start: Handle_Transfer_Finder &
	:param FP:
	:type FP: Handle_Transfer_FinderProcess &
	:rtype: Handle_Transfer_Binder
") Transfer;
		virtual Handle_Transfer_Binder Transfer (const Handle_Transfer_Finder & start,const Handle_Transfer_FinderProcess & FP);
};


%make_alias(IGESControl_ActorWrite)

%extend IGESControl_ActorWrite {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IGESControl_AlgoContainer;
class IGESControl_AlgoContainer : public IGESToBRep_AlgoContainer {
	public:
		%feature("compactdefaultargs") IGESControl_AlgoContainer;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") IGESControl_AlgoContainer;
		 IGESControl_AlgoContainer ();
};


%make_alias(IGESControl_AlgoContainer)

%extend IGESControl_AlgoContainer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IGESControl_Controller;
class IGESControl_Controller : public XSControl_Controller {
	public:
		%feature("compactdefaultargs") ActorRead;
		%feature("autodoc", "	* Returns the Actor for Read attached to the pair (norm,appli) It is an Actor from IGESToBRep, adapted from an IGESModel : Unit, tolerances

	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:rtype: Handle_Transfer_ActorOfTransientProcess
") ActorRead;
		Handle_Transfer_ActorOfTransientProcess ActorRead (const Handle_Interface_InterfaceModel & model);
		%feature("compactdefaultargs") Customise;
		%feature("autodoc", "	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:rtype: void
") Customise;
		virtual void Customise (Handle_XSControl_WorkSession & WS);
		%feature("compactdefaultargs") IGESControl_Controller;
		%feature("autodoc", "	* Initializes the use of IGES Norm (the first time) and returns a Controller for IGES-5.1 If <modefnes> is True, sets it to internal FNES format

	:param modefnes: default value is Standard_False
	:type modefnes: bool
	:rtype: None
") IGESControl_Controller;
		 IGESControl_Controller (const Standard_Boolean modefnes = Standard_False);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Standard Initialisation. It creates a Controller for IGES and records it to various names, available to select it later Returns True when done, False if could not be done Also, it creates and records an Adaptor for FNES

	:rtype: bool
") Init;
		static Standard_Boolean Init ();
		%feature("compactdefaultargs") NewModel;
		%feature("autodoc", "	* Creates a new empty Model ready to receive data of the Norm. It is taken from IGES Template Model

	:rtype: Handle_Interface_InterfaceModel
") NewModel;
		Handle_Interface_InterfaceModel NewModel ();
		%feature("compactdefaultargs") TransferWriteShape;
		%feature("autodoc", "	* Takes one Shape and transfers it to the InterfaceModel (already created by NewModel for instance) <modetrans> is to be interpreted by each kind of XstepAdaptor Returns a status : 0 OK 1 No result 2 Fail -1 bad modeshape -2 bad model (requires an IGESModel) modeshape : 0 groupe of face (version < 5.1) 1 BREP-version 5.1 of IGES

	:param shape:
	:type shape: TopoDS_Shape &
	:param FP:
	:type FP: Handle_Transfer_FinderProcess &
	:param model:
	:type model: Handle_Interface_InterfaceModel &
	:param modetrans: default value is 0
	:type modetrans: int
	:rtype: IFSelect_ReturnStatus
") TransferWriteShape;
		virtual IFSelect_ReturnStatus TransferWriteShape (const TopoDS_Shape & shape,const Handle_Transfer_FinderProcess & FP,const Handle_Interface_InterfaceModel & model,const Standard_Integer modetrans = 0);
};


%make_alias(IGESControl_Controller)

%extend IGESControl_Controller {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IGESControl_IGESBoundary;
class IGESControl_IGESBoundary : public IGESToBRep_IGESBoundary {
	public:
		%feature("compactdefaultargs") Check;
		%feature("autodoc", "	* Checks result of translation of IGES boundary entities (types 141, 142 or 508). Checks consistency of 2D and 3D representations and keeps only one if they are inconsistent. Checks the closure of resulting wire and if it is not closed, checks 2D and 3D representation and updates the resulting wire to contain only closed representation.

	:param result:
	:type result: bool
	:param checkclosure:
	:type checkclosure: bool
	:param okCurve3d:
	:type okCurve3d: bool
	:param okCurve2d:
	:type okCurve2d: bool
	:rtype: void
") Check;
		virtual void Check (const Standard_Boolean result,const Standard_Boolean checkclosure,const Standard_Boolean okCurve3d,const Standard_Boolean okCurve2d);
		%feature("compactdefaultargs") IGESControl_IGESBoundary;
		%feature("autodoc", "	* Creates an object and calls inherited constuctor.

	:rtype: None
") IGESControl_IGESBoundary;
		 IGESControl_IGESBoundary ();
		%feature("compactdefaultargs") IGESControl_IGESBoundary;
		%feature("autodoc", "	* Creates an object and calls inherited constuctor.

	:param CS:
	:type CS: IGESToBRep_CurveAndSurface &
	:rtype: None
") IGESControl_IGESBoundary;
		 IGESControl_IGESBoundary (const IGESToBRep_CurveAndSurface & CS);
};


%make_alias(IGESControl_IGESBoundary)

%extend IGESControl_IGESBoundary {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IGESControl_Reader;
class IGESControl_Reader : public XSControl_Reader {
	public:
		%feature("compactdefaultargs") GetReadVisible;
		%feature("autodoc", "	:rtype: bool
") GetReadVisible;
		Standard_Boolean GetReadVisible ();
		%feature("compactdefaultargs") IGESControl_Reader;
		%feature("autodoc", "	* Creates a Reader from scratch

	:rtype: None
") IGESControl_Reader;
		 IGESControl_Reader ();
		%feature("compactdefaultargs") IGESControl_Reader;
		%feature("autodoc", "	* Creates a Reader from an already existing Session

	:param WS:
	:type WS: Handle_XSControl_WorkSession &
	:param scratch: default value is Standard_True
	:type scratch: bool
	:rtype: None
") IGESControl_Reader;
		 IGESControl_Reader (const Handle_XSControl_WorkSession & WS,const Standard_Boolean scratch = Standard_True);
		%feature("compactdefaultargs") IGESModel;
		%feature("autodoc", "	* Returns the model as a IGESModel. It can then be consulted (header, product)

	:rtype: Handle_IGESData_IGESModel
") IGESModel;
		Handle_IGESData_IGESModel IGESModel ();
		%feature("compactdefaultargs") NbRootsForTransfer;
		%feature("autodoc", "	* Determines the list of root entities from Model which are candidate for a transfer to a Shape (type of entities is PRODUCT) <theReadOnlyVisible> is taken into account to define roots

	:rtype: int
") NbRootsForTransfer;
		virtual Standard_Integer NbRootsForTransfer ();
		%feature("compactdefaultargs") PrintTransferInfo;
		%feature("autodoc", "	* Prints Statistics and check list for Transfer

	:param failwarn:
	:type failwarn: IFSelect_PrintFail
	:param mode:
	:type mode: IFSelect_PrintCount
	:rtype: None
") PrintTransferInfo;
		void PrintTransferInfo (const IFSelect_PrintFail failwarn,const IFSelect_PrintCount mode);
		%feature("compactdefaultargs") SetReadVisible;
		%feature("autodoc", "	* Set the transion of ALL Roots (if theReadOnlyVisible is False) or of Visible Roots (if theReadOnlyVisible is True)

	:param ReadRoot:
	:type ReadRoot: bool
	:rtype: None
") SetReadVisible;
		void SetReadVisible (const Standard_Boolean ReadRoot);
};


%extend IGESControl_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IGESControl_ToolContainer;
class IGESControl_ToolContainer : public IGESToBRep_ToolContainer {
	public:
		%feature("compactdefaultargs") IGESBoundary;
		%feature("autodoc", "	* Returns IGESControl_IGESBoundary

	:rtype: Handle_IGESToBRep_IGESBoundary
") IGESBoundary;
		virtual Handle_IGESToBRep_IGESBoundary IGESBoundary ();
		%feature("compactdefaultargs") IGESControl_ToolContainer;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") IGESControl_ToolContainer;
		 IGESControl_ToolContainer ();
};


%make_alias(IGESControl_ToolContainer)

%extend IGESControl_ToolContainer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor IGESControl_Writer;
class IGESControl_Writer {
	public:
		%feature("compactdefaultargs") AddEntity;
		%feature("autodoc", "	* Adds an IGES entity (and the ones it references) to the model

	:param ent:
	:type ent: Handle_IGESData_IGESEntity &
	:rtype: bool
") AddEntity;
		Standard_Boolean AddEntity (const Handle_IGESData_IGESEntity & ent);
		%feature("compactdefaultargs") AddGeom;
		%feature("autodoc", "	* Translates a Geometry (Surface or Curve) to IGES Entities and adds them to the model Returns True if done, False if geom is neither a Surface or a Curve suitable for IGES or is null

	:param geom:
	:type geom: Handle_Standard_Transient &
	:rtype: bool
") AddGeom;
		Standard_Boolean AddGeom (const Handle_Standard_Transient & geom);
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "	* Translates a Shape to IGES Entities and adds them to the model Returns True if done, False if Shape not suitable for IGES or null

	:param sh:
	:type sh: TopoDS_Shape &
	:rtype: bool
") AddShape;
		Standard_Boolean AddShape (const TopoDS_Shape & sh);
		%feature("compactdefaultargs") ComputeModel;
		%feature("autodoc", "	* Computes the entities found in the model, which is ready to be written. This contrasts with the default computation of headers only.

	:rtype: None
") ComputeModel;
		void ComputeModel ();
		%feature("compactdefaultargs") IGESControl_Writer;
		%feature("autodoc", "	* Creates a writer object with the default unit (millimeters) and write mode (Face). IGESControl_Writer (const Standard_CString unit, const Standard_Integer modecr = 0);

	:rtype: None
") IGESControl_Writer;
		 IGESControl_Writer ();
		%feature("compactdefaultargs") IGESControl_Writer;
		%feature("autodoc", "	* Creates a writer with given values for units and for write mode. unit may be any unit that is accepted by the IGES standard. By default, it is the millimeter. modecr defines the write mode and may be: - 0: Faces (default) - 1: BRep.

	:param unit:
	:type unit: char *
	:param modecr: default value is 0
	:type modecr: int
	:rtype: None
") IGESControl_Writer;
		 IGESControl_Writer (const char * unit,const Standard_Integer modecr = 0);
		%feature("compactdefaultargs") IGESControl_Writer;
		%feature("autodoc", "	* Creates a writer object with the prepared IGES model model in write mode. modecr defines the write mode and may be: - 0: Faces (default) - 1: BRep.

	:param model:
	:type model: Handle_IGESData_IGESModel &
	:param modecr: default value is 0
	:type modecr: int
	:rtype: None
") IGESControl_Writer;
		 IGESControl_Writer (const Handle_IGESData_IGESModel & model,const Standard_Integer modecr = 0);
		%feature("compactdefaultargs") Model;
		%feature("autodoc", "	* Returns the IGES model to be written in output.

	:rtype: Handle_IGESData_IGESModel
") Model;
		Handle_IGESData_IGESModel Model ();
		%feature("compactdefaultargs") SetTransferProcess;
		%feature("autodoc", "	* Returns/Sets the TransferProcess : it contains final results and if some, check messages

	:param TP:
	:type TP: Handle_Transfer_FinderProcess &
	:rtype: None
") SetTransferProcess;
		void SetTransferProcess (const Handle_Transfer_FinderProcess & TP);
		%feature("compactdefaultargs") TransferProcess;
		%feature("autodoc", "	:rtype: Handle_Transfer_FinderProcess
") TransferProcess;
		Handle_Transfer_FinderProcess TransferProcess ();
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Computes then writes the model to an OStream Returns True when done, false in case of error

	:param S:
	:type S: Standard_OStream &
	:param fnes: default value is Standard_False
	:type fnes: bool
	:rtype: bool
") Write;
		Standard_Boolean Write (Standard_OStream & S,const Standard_Boolean fnes = Standard_False);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Prepares and writes an IGES model either to an OStream, S or to a file name,CString. Returns True if the operation was performed correctly and False if an error occurred (for instance, if the processor could not create the file).

	:param file:
	:type file: char *
	:param fnes: default value is Standard_False
	:type fnes: bool
	:rtype: bool
") Write;
		Standard_Boolean Write (const char * file,const Standard_Boolean fnes = Standard_False);
};


%extend IGESControl_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */

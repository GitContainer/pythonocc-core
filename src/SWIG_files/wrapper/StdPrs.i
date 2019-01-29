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
%define STDPRSDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=STDPRSDOCSTRING) StdPrs

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


%include StdPrs_headers.i

/* templates */
%template(StdPrs_Point) Prs3d_Point <Handle_Geom_Point , StdPrs_ToolPoint>;
%template(StdPrs_Vertex) Prs3d_Point <TopoDS_Vertex , StdPrs_ToolVertex>;
/* end templates declaration */


/* typedefs */
typedef Prs3d_Point <Handle_Geom_Point , StdPrs_ToolPoint> StdPrs_Point;
typedef Prs3d_Point <TopoDS_Vertex , StdPrs_ToolVertex> StdPrs_Vertex;
/* end typedefs declaration */

/* public enums */
enum StdPrs_Volume {
	StdPrs_Volume_Autodetection = 0,
	StdPrs_Volume_Closed = 1,
	StdPrs_Volume_Opened = 2,
};

/* end public enums declaration */


%nodefaultctor StdPrs_BndBox;
class StdPrs_BndBox : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Computes presentation of a bounding box. @param thePresentation [in] the presentation. @param theBndBox [in] the bounding box. @param theDrawer [in] the drawer.

	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theBndBox:
	:type theBndBox: Bnd_Box &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & thePresentation,const Bnd_Box & theBndBox,const Handle_Prs3d_Drawer & theDrawer);
};


%extend StdPrs_BndBox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_Curve : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds to the presentation aPresentation the drawing of the curve aCurve. The aspect is defined by LineAspect in aDrawer. If drawCurve equals Standard_False the curve will not be displayed, it is used if the curve is a part of some shape and PrimitiveArray visualization approach is activated (it is activated by default).

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param drawCurve: default value is Standard_True
	:type drawCurve: bool
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Adaptor3d_Curve & aCurve,const Handle_Prs3d_Drawer & aDrawer,const Standard_Boolean drawCurve = Standard_True);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds to the presentation aPresentation the drawing of the curve aCurve. The aspect is defined by LineAspect in aDrawer. The drawing will be limited between the points of parameter U1 and U2. If drawCurve equals Standard_False the curve will not be displayed, it is used if the curve is a part of some shape and PrimitiveArray visualization approach is activated (it is activated by default).

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param drawCurve: default value is Standard_True
	:type drawCurve: bool
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Adaptor3d_Curve & aCurve,const Standard_Real U1,const Standard_Real U2,const Handle_Prs3d_Drawer & aDrawer,const Standard_Boolean drawCurve = Standard_True);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* adds to the presentation aPresentation the drawing of the curve aCurve. The aspect is the current aspect. aDeflection is used in the circle case. Points give a sequence of curve points. If drawCurve equals Standard_False the curve will not be displayed, it is used if the curve is a part of some shape and PrimitiveArray visualization approach is activated (it is activated by default).

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param Points:
	:type Points: TColgp_SequenceOfPnt
	:param drawCurve: default value is Standard_True
	:type drawCurve: bool
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Adaptor3d_Curve & aCurve,const Handle_Prs3d_Drawer & aDrawer,TColgp_SequenceOfPnt & Points,const Standard_Boolean drawCurve = Standard_True);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* adds to the presentation aPresentation the drawing of the curve aCurve. The aspect is the current aspect. The drawing will be limited between the points of parameter U1 and U2. aDeflection is used in the circle case. Points give a sequence of curve points. If drawCurve equals Standard_False the curve will not be displayed, it is used if the curve is a part of some shape and PrimitiveArray visualization approach is activated (it is activated by default).

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Points:
	:type Points: TColgp_SequenceOfPnt
	:param aNbPoints: default value is 30
	:type aNbPoints: int
	:param drawCurve: default value is Standard_True
	:type drawCurve: bool
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Adaptor3d_Curve & aCurve,const Standard_Real U1,const Standard_Real U2,TColgp_SequenceOfPnt & Points,const Standard_Integer aNbPoints = 30,const Standard_Boolean drawCurve = Standard_True);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	* returns true if the distance between the point (X,Y,Z) and the drawing of the curve is less than aDistance.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Adaptor3d_Curve & aCurve,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	* returns true if the distance between the point (X,Y,Z) and the drawing of the curve is less than aDistance.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDeflection:
	:type aDeflection: float
	:param aLimit:
	:type aLimit: float
	:param aNbPoints:
	:type aNbPoints: int
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Adaptor3d_Curve & aCurve,const Standard_Real aDeflection,const Standard_Real aLimit,const Standard_Integer aNbPoints);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	* returns true if the distance between the point (X,Y,Z) and the drawing of the curve aCurve is less than aDistance. The drawing is considered between the points of parameter U1 and U2;

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Adaptor3d_Curve & aCurve,const Standard_Real U1,const Standard_Real U2,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	* returns true if the distance between the point (X,Y,Z) and the drawing of the curve aCurve is less than aDistance. The drawing is considered between the points of parameter U1 and U2;

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param aDeflection:
	:type aDeflection: float
	:param aNbPoints:
	:type aNbPoints: int
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Adaptor3d_Curve & aCurve,const Standard_Real U1,const Standard_Real U2,const Standard_Real aDeflection,const Standard_Integer aNbPoints);
};


%extend StdPrs_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_HLRPolyShape : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Defines the hidden line removal display of the topology aShape in the projection defined by aProjector. The shape and the projection are added to the display aPresentation, and the attributes of the elements present in the aPresentation are defined by the attribute manager aDrawer.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param aProjector:
	:type aProjector: Handle_Prs3d_Projector &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const TopoDS_Shape & aShape,const Handle_Prs3d_Drawer & aDrawer,const Handle_Prs3d_Projector & aProjector);
};


%extend StdPrs_HLRPolyShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_HLRShape : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:param theProjector:
	:type theProjector: Handle_Prs3d_Projector &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & thePresentation,const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer,const Handle_Prs3d_Projector & theProjector);
};


%extend StdPrs_HLRShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdPrs_HLRToolShape;
class StdPrs_HLRToolShape {
	public:
		%feature("compactdefaultargs") Hidden;
		%feature("autodoc", "	:param TheEdge:
	:type TheEdge: BRepAdaptor_Curve &
	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:rtype: None
") Hidden;
		void Hidden (BRepAdaptor_Curve & TheEdge,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") InitHidden;
		%feature("autodoc", "	:param EdgeNumber:
	:type EdgeNumber: int
	:rtype: None
") InitHidden;
		void InitHidden (const Standard_Integer EdgeNumber);
		%feature("compactdefaultargs") InitVisible;
		%feature("autodoc", "	:param EdgeNumber:
	:type EdgeNumber: int
	:rtype: None
") InitVisible;
		void InitVisible (const Standard_Integer EdgeNumber);
		%feature("compactdefaultargs") MoreHidden;
		%feature("autodoc", "	:rtype: bool
") MoreHidden;
		Standard_Boolean MoreHidden ();
		%feature("compactdefaultargs") MoreVisible;
		%feature("autodoc", "	:rtype: bool
") MoreVisible;
		Standard_Boolean MoreVisible ();
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	:rtype: int
") NbEdges;
		Standard_Integer NbEdges ();
		%feature("compactdefaultargs") NextHidden;
		%feature("autodoc", "	:rtype: None
") NextHidden;
		void NextHidden ();
		%feature("compactdefaultargs") NextVisible;
		%feature("autodoc", "	:rtype: None
") NextVisible;
		void NextVisible ();
		%feature("compactdefaultargs") StdPrs_HLRToolShape;
		%feature("autodoc", "	:param TheShape:
	:type TheShape: TopoDS_Shape &
	:param TheProjector:
	:type TheProjector: HLRAlgo_Projector &
	:rtype: None
") StdPrs_HLRToolShape;
		 StdPrs_HLRToolShape (const TopoDS_Shape & TheShape,const HLRAlgo_Projector & TheProjector);
		%feature("compactdefaultargs") Visible;
		%feature("autodoc", "	:param TheEdge:
	:type TheEdge: BRepAdaptor_Curve &
	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:rtype: None
") Visible;
		void Visible (BRepAdaptor_Curve & TheEdge,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend StdPrs_HLRToolShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdPrs_Isolines;
class StdPrs_Isolines : public Prs3d_Root {
	public:
		class PntOnIso {};
		class SegOnIso {};
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Computes isolines presentation for a TopoDS face. This method chooses proper version of isoline builder algorithm : on triangulation or surface depending on the flag passed from Prs3d_Drawer attributes. This method is a default way to display isolines for a given TopoDS face. @param thePresentation [in] the presentation. @param theFace [in] the face. @param theDrawer [in] the display settings. @param theDeflection [in] the deflection for isolines-on-surface version.

	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theFace:
	:type theFace: TopoDS_Face &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:param theDeflection:
	:type theDeflection: float
	:rtype: inline void
") Add;
		inline static void Add (const Handle_Prs3d_Presentation & thePresentation,const TopoDS_Face & theFace,const Handle_Prs3d_Drawer & theDrawer,const Standard_Real theDeflection);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Computes isolines presentation for a TopoDS face. This method chooses proper version of isoline builder algorithm : on triangulation or surface depending on the flag passed from Prs3d_Drawer attributes. This method is a default way to display isolines for a given TopoDS face. @param theFace [in] the face. @param theDrawer [in] the display settings. @param theDeflection [in] the deflection for isolines-on-surface version.

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:param theDeflection:
	:type theDeflection: float
	:param theUPolylines:
	:type theUPolylines: Prs3d_NListOfSequenceOfPnt &
	:param theVPolylines:
	:type theVPolylines: Prs3d_NListOfSequenceOfPnt &
	:rtype: void
") Add;
		static void Add (const TopoDS_Face & theFace,const Handle_Prs3d_Drawer & theDrawer,const Standard_Real theDeflection,Prs3d_NListOfSequenceOfPnt & theUPolylines,Prs3d_NListOfSequenceOfPnt & theVPolylines);
		%feature("compactdefaultargs") AddOnSurface;
		%feature("autodoc", "	* Computes isolines on surface and adds them to presentation. @param thePresentation [in] the presentation. @param theFace [in] the face. @param theDrawer [in] the display settings. @param theDeflection [in] the deflection value.

	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theFace:
	:type theFace: TopoDS_Face &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:param theDeflection:
	:type theDeflection: float
	:rtype: void
") AddOnSurface;
		static void AddOnSurface (const Handle_Prs3d_Presentation & thePresentation,const TopoDS_Face & theFace,const Handle_Prs3d_Drawer & theDrawer,const Standard_Real theDeflection);
		%feature("compactdefaultargs") AddOnSurface;
		%feature("autodoc", "	* Computes isolines on surface and adds them to presentation. @param theFace [in] the face @param theDrawer [in] the display settings @param theDeflection [in] the deflection value @param theUPolylines [out] the sequence of result polylines @param theVPolylines [out] the sequence of result polylines

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:param theDeflection:
	:type theDeflection: float
	:param theUPolylines:
	:type theUPolylines: Prs3d_NListOfSequenceOfPnt &
	:param theVPolylines:
	:type theVPolylines: Prs3d_NListOfSequenceOfPnt &
	:rtype: void
") AddOnSurface;
		static void AddOnSurface (const TopoDS_Face & theFace,const Handle_Prs3d_Drawer & theDrawer,const Standard_Real theDeflection,Prs3d_NListOfSequenceOfPnt & theUPolylines,Prs3d_NListOfSequenceOfPnt & theVPolylines);
		%feature("compactdefaultargs") AddOnSurface;
		%feature("autodoc", "	* Computes isolines on surface and adds them to presentation. @param thePresentation [in] the presentation. @param theSurface [in] the surface. @param theDrawer [in] the display settings. @param theDeflection [in] the deflection value. @param theUIsoParams [in] the parameters of u isolines to compute. @param theVIsoParams [in] the parameters of v isolines to compute.

	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theSurface:
	:type theSurface: Handle_BRepAdaptor_HSurface &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:param theDeflection:
	:type theDeflection: float
	:param theUIsoParams:
	:type theUIsoParams: TColStd_SequenceOfReal &
	:param theVIsoParams:
	:type theVIsoParams: TColStd_SequenceOfReal &
	:rtype: void
") AddOnSurface;
		static void AddOnSurface (const Handle_Prs3d_Presentation & thePresentation,const Handle_BRepAdaptor_HSurface & theSurface,const Handle_Prs3d_Drawer & theDrawer,const Standard_Real theDeflection,const TColStd_SequenceOfReal & theUIsoParams,const TColStd_SequenceOfReal & theVIsoParams);
		%feature("compactdefaultargs") AddOnTriangulation;
		%feature("autodoc", "	* Computes isolines on triangulation and adds them to a presentation. @param thePresentation [in] the presentation. @param theFace [in] the face. @param theDrawer [in] the display settings.

	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theFace:
	:type theFace: TopoDS_Face &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") AddOnTriangulation;
		static void AddOnTriangulation (const Handle_Prs3d_Presentation & thePresentation,const TopoDS_Face & theFace,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") AddOnTriangulation;
		%feature("autodoc", "	* Computes isolines on triangulation. @param theFace [in] the face. @param theDrawer [in] the display settings. @param theUPolylines [out] the sequence of result polylines @param theVPolylines [out] the sequence of result polylines

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:param theUPolylines:
	:type theUPolylines: Prs3d_NListOfSequenceOfPnt &
	:param theVPolylines:
	:type theVPolylines: Prs3d_NListOfSequenceOfPnt &
	:rtype: void
") AddOnTriangulation;
		static void AddOnTriangulation (const TopoDS_Face & theFace,const Handle_Prs3d_Drawer & theDrawer,Prs3d_NListOfSequenceOfPnt & theUPolylines,Prs3d_NListOfSequenceOfPnt & theVPolylines);
		%feature("compactdefaultargs") AddOnTriangulation;
		%feature("autodoc", "	* Computes isolines on triangulation and adds them to a presentation. @param thePresentation [in] the presentation. @param theTriangulation [in] the triangulation. @param theSurface [in] the definition of triangulated surface. The surface adapter is used to precisely evaluate isoline points using surface law and fit them on triangulation. If NULL is passed, the method will use linear interpolation of triangle node's UV coordinates to evaluate isoline points. @param theLocation [in] the location transformation defined for triangulation (surface). @param theDrawer [in] the display settings. @param theUIsoParams [in] the parameters of u isolines to compute. @param theVIsoParams [in] the parameters of v isolines to compute.

	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theTriangulation:
	:type theTriangulation: Handle_Poly_Triangulation &
	:param theSurface:
	:type theSurface: Handle_Geom_Surface &
	:param theLocation:
	:type theLocation: TopLoc_Location &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:param theUIsoParams:
	:type theUIsoParams: TColStd_SequenceOfReal &
	:param theVIsoParams:
	:type theVIsoParams: TColStd_SequenceOfReal &
	:rtype: void
") AddOnTriangulation;
		static void AddOnTriangulation (const Handle_Prs3d_Presentation & thePresentation,const Handle_Poly_Triangulation & theTriangulation,const Handle_Geom_Surface & theSurface,const TopLoc_Location & theLocation,const Handle_Prs3d_Drawer & theDrawer,const TColStd_SequenceOfReal & theUIsoParams,const TColStd_SequenceOfReal & theVIsoParams);
		%feature("compactdefaultargs") UVIsoParameters;
		%feature("autodoc", "	* Evalute sequence of parameters for drawing uv isolines for a given face. @param theFace [in] the face. @param theNbIsoU [in] the number of u isolines. @param theNbIsoV [in] the number of v isolines. @param theUVLimit [in] the u, v parameter value limit. @param theUIsoParams [out] the sequence of u isoline parameters. @param theVIsoParams [out] the sequence of v isoline parameters.

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theNbIsoU:
	:type theNbIsoU: int
	:param theNbIsoV:
	:type theNbIsoV: int
	:param theUVLimit:
	:type theUVLimit: float
	:param theUIsoParams:
	:type theUIsoParams: TColStd_SequenceOfReal &
	:param theVIsoParams:
	:type theVIsoParams: TColStd_SequenceOfReal &
	:rtype: void
") UVIsoParameters;
		static void UVIsoParameters (const TopoDS_Face & theFace,const Standard_Integer theNbIsoU,const Standard_Integer theNbIsoV,const Standard_Real theUVLimit,TColStd_SequenceOfReal & theUIsoParams,TColStd_SequenceOfReal & theVIsoParams);
};


%extend StdPrs_Isolines {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_Plane : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Defines display of infinite planes. The infinite plane aPlane is added to the display aPresentation, and the attributes of the display are defined by the attribute manager aDrawer.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aPlane:
	:type aPlane: Adaptor3d_Surface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Adaptor3d_Surface & aPlane,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	* returns true if the distance between the point (X,Y,Z) and the plane is less than aDistance.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aPlane:
	:type aPlane: Adaptor3d_Surface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Adaptor3d_Surface & aPlane,const Handle_Prs3d_Drawer & aDrawer);
};


%extend StdPrs_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_PoleCurve : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Defines display of BSpline and Bezier curves. Adds the 3D curve aCurve to the StdPrs_PoleCurve algorithm. This shape is found in the presentation object aPresentation, and its display attributes are set in the attribute manager aDrawer. The curve object from Adaptor3d provides data from a Geom curve. This makes it possible to use the surface in a geometric algorithm.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Adaptor3d_Curve & aCurve,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	* returns true if the distance between the point (X,Y,Z) and the broken line made of the poles is less then aDistance.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Adaptor3d_Curve & aCurve,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") Pick;
		%feature("autodoc", "	* returns the pole the most near of the point (X,Y,Z) and returns its range. The distance between the pole and (X,Y,Z) must be less then aDistance. If no pole corresponds, 0 is returned.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: int
") Pick;
		static Standard_Integer Pick (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Adaptor3d_Curve & aCurve,const Handle_Prs3d_Drawer & aDrawer);
};


%extend StdPrs_PoleCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdPrs_ShadedShape;
class StdPrs_ShadedShape : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Shades <theShape>. @param theVolumeType defines the way how to interpret input shapes - as Closed volumes (to activate back-face culling and capping plane algorithms), as Open volumes (shells or solids with holes) or to perform Autodetection (would split input shape into two groups)

	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:param theVolume: default value is StdPrs_Volume_Autodetection
	:type theVolume: StdPrs_Volume
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & thePresentation,const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer,const StdPrs_Volume theVolume = StdPrs_Volume_Autodetection);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Shades <theShape> with texture coordinates. @param theVolumeType defines the way how to interpret input shapes - as Closed volumes (to activate back-face culling and capping plane algorithms), as Open volumes (shells or solids with holes) or to perform Autodetection (would split input shape into two groups)

	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:param theHasTexels:
	:type theHasTexels: bool
	:param theUVOrigin:
	:type theUVOrigin: gp_Pnt2d
	:param theUVRepeat:
	:type theUVRepeat: gp_Pnt2d
	:param theUVScale:
	:type theUVScale: gp_Pnt2d
	:param theVolume: default value is StdPrs_Volume_Autodetection
	:type theVolume: StdPrs_Volume
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & thePresentation,const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer,const Standard_Boolean theHasTexels,const gp_Pnt2d & theUVOrigin,const gp_Pnt2d & theUVRepeat,const gp_Pnt2d & theUVScale,const StdPrs_Volume theVolume = StdPrs_Volume_Autodetection);
		%feature("compactdefaultargs") AddWireframeForFacesWithoutTriangles;
		%feature("autodoc", "	* Computes special wireframe presentation for faces without triangulation.

	:param thePrs:
	:type thePrs: Handle_Prs3d_Presentation &
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") AddWireframeForFacesWithoutTriangles;
		static void AddWireframeForFacesWithoutTriangles (const Handle_Prs3d_Presentation & thePrs,const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") AddWireframeForFreeElements;
		%feature("autodoc", "	* Computes wireframe presentation for free wires and vertices

	:param thePrs:
	:type thePrs: Handle_Prs3d_Presentation &
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") AddWireframeForFreeElements;
		static void AddWireframeForFreeElements (const Handle_Prs3d_Presentation & thePrs,const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") ExploreSolids;
		%feature("autodoc", "	* Searches closed and unclosed subshapes in shape structure and puts them into two compounds for separate processing of closed and unclosed sub-shapes

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theBuilder:
	:type theBuilder: BRep_Builder &
	:param theClosed:
	:type theClosed: TopoDS_Compound &
	:param theOpened:
	:type theOpened: TopoDS_Compound &
	:param theIgnore1DSubShape:
	:type theIgnore1DSubShape: bool
	:rtype: void
") ExploreSolids;
		static void ExploreSolids (const TopoDS_Shape & theShape,const BRep_Builder & theBuilder,TopoDS_Compound & theClosed,TopoDS_Compound & theOpened,const Standard_Boolean theIgnore1DSubShape);
		%feature("compactdefaultargs") FillFaceBoundaries;
		%feature("autodoc", "	* Define primitive array of boundary segments for specified shape. @param theShape segments array or NULL if specified face does not have computed triangulation

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: Handle_Graphic3d_ArrayOfSegments
") FillFaceBoundaries;
		static Handle_Graphic3d_ArrayOfSegments FillFaceBoundaries (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") FillTriangles;
		%feature("autodoc", "	* Create primitive array with triangles for specified shape. @param theShape [in] the shape with precomputed triangulation

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: Handle_Graphic3d_ArrayOfTriangles
") FillTriangles;
		static Handle_Graphic3d_ArrayOfTriangles FillTriangles (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") FillTriangles;
		%feature("autodoc", "	* Create primitive array of triangles for specified shape. @param theShape the shape with precomputed triangulation @param theHasTexels define UV coordinates in primitive array @param theUVOrigin origin for UV coordinates @param theUVRepeat repeat parameters for UV coordinates @param theUVScale scale coefficients for UV coordinates returns triangles array or NULL if specified face does not have computed triangulation

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theHasTexels:
	:type theHasTexels: bool
	:param theUVOrigin:
	:type theUVOrigin: gp_Pnt2d
	:param theUVRepeat:
	:type theUVRepeat: gp_Pnt2d
	:param theUVScale:
	:type theUVScale: gp_Pnt2d
	:rtype: Handle_Graphic3d_ArrayOfTriangles
") FillTriangles;
		static Handle_Graphic3d_ArrayOfTriangles FillTriangles (const TopoDS_Shape & theShape,const Standard_Boolean theHasTexels,const gp_Pnt2d & theUVOrigin,const gp_Pnt2d & theUVRepeat,const gp_Pnt2d & theUVScale);
};


%extend StdPrs_ShadedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_ShadedSurface : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the surface aSurface to the presentation object aPresentation. The surface's display attributes are set in the attribute manager aDrawer. The surface object from Adaptor3d provides data from a Geom surface in order to use the surface in an algorithm.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aSurface:
	:type aSurface: Adaptor3d_Surface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Adaptor3d_Surface & aSurface,const Handle_Prs3d_Drawer & aDrawer);
};


%extend StdPrs_ShadedSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_ToolPoint {
	public:
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	:param aPoint:
	:type aPoint: Handle_Geom_Point &
	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: void
") Coord;
		static void Coord (const Handle_Geom_Point & aPoint,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend StdPrs_ToolPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdPrs_ToolRFace;
class StdPrs_ToolRFace {
	public:
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") IsOriented;
		%feature("autodoc", "	:rtype: bool
") IsOriented;
		Standard_Boolean IsOriented ();
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next ();
		%feature("compactdefaultargs") Orientation;
		%feature("autodoc", "	:rtype: TopAbs_Orientation
") Orientation;
		TopAbs_Orientation Orientation ();
		%feature("compactdefaultargs") StdPrs_ToolRFace;
		%feature("autodoc", "	:rtype: None
") StdPrs_ToolRFace;
		 StdPrs_ToolRFace ();
		%feature("compactdefaultargs") StdPrs_ToolRFace;
		%feature("autodoc", "	:param aSurface:
	:type aSurface: Handle_BRepAdaptor_HSurface &
	:rtype: None
") StdPrs_ToolRFace;
		 StdPrs_ToolRFace (const Handle_BRepAdaptor_HSurface & aSurface);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Adaptor2d_Curve2dPtr
") Value;
		Adaptor2d_Curve2dPtr Value ();
};


%extend StdPrs_ToolRFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdPrs_ToolTriangulatedShape;
class StdPrs_ToolTriangulatedShape {
	public:
		%feature("compactdefaultargs") ClearOnOwnDeflectionChange;
		%feature("autodoc", "	* If presentation has own deviation coefficient and IsAutoTriangulation() is true, function will compare actual coefficients with previous values and will clear triangulation on their change (regardless actual tessellation quality). Function is placed here for compatibility reasons - new code should avoid using IsAutoTriangulation(). @param theShape [in] the shape @param theDrawer [in] the display settings @param theToResetCoeff [in] updates coefficients in theDrawer to actual state to avoid redundant recomputations

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:param theToResetCoeff:
	:type theToResetCoeff: bool
	:rtype: void
") ClearOnOwnDeflectionChange;
		static void ClearOnOwnDeflectionChange (const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer,const Standard_Boolean theToResetCoeff);
		%feature("compactdefaultargs") ComputeNormals;
		%feature("autodoc", "	* Computes nodal normals for Poly_Triangulation structure using UV coordinates and surface. Does nothing if triangulation already defines normals. @param theFace [in] the face @param theTris [in] the definition of a face triangulation

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theTris:
	:type theTris: Handle_Poly_Triangulation &
	:rtype: void
") ComputeNormals;
		static void ComputeNormals (const TopoDS_Face & theFace,const Handle_Poly_Triangulation & theTris);
		%feature("compactdefaultargs") ComputeNormals;
		%feature("autodoc", "	* Computes nodal normals for Poly_Triangulation structure using UV coordinates and surface. Does nothing if triangulation already defines normals. @param theFace [in] the face @param theTris [in] the definition of a face triangulation @param thePolyConnect [in,out] optional, initialized tool for exploring triangulation

	:param theFace:
	:type theFace: TopoDS_Face &
	:param theTris:
	:type theTris: Handle_Poly_Triangulation &
	:param thePolyConnect:
	:type thePolyConnect: Poly_Connect &
	:rtype: void
") ComputeNormals;
		static void ComputeNormals (const TopoDS_Face & theFace,const Handle_Poly_Triangulation & theTris,Poly_Connect & thePolyConnect);
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	* Checks back faces visibility for specified shape (to activate back-face culling). returns true if shape is closed manifold Solid or compound of such Solids.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: bool
") IsClosed;
		static Standard_Boolean IsClosed (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") IsTessellated;
		%feature("autodoc", "	* Checks whether the shape is properly triangulated for a given display settings. @param theShape [in] the shape. @param theDrawer [in] the display settings.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") IsTessellated;
		static Standard_Boolean IsTessellated (const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") IsTriangulated;
		%feature("autodoc", "	* Similar to BRepTools::Triangulation() but without extra checks. returns true if all faces within shape are triangulated.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: bool
") IsTriangulated;
		static Standard_Boolean IsTriangulated (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "	* Evaluate normals for a triangle of a face. @param theFace [in] the face. @param thePolyConnect [in] the definition of a face triangulation. @param theNormal [out] the array of normals for each triangle.

	:param theFace:
	:type theFace: TopoDS_Face &
	:param thePolyConnect:
	:type thePolyConnect: Poly_Connect &
	:param theNormals:
	:type theNormals: TColgp_Array1OfDir
	:rtype: void
") Normal;
		static void Normal (const TopoDS_Face & theFace,Poly_Connect & thePolyConnect,TColgp_Array1OfDir & theNormals);
		%feature("compactdefaultargs") Tessellate;
		%feature("autodoc", "	* Validates triangulation within the shape and performs tessellation if necessary. @param theShape [in] the shape. @param theDrawer [in] the display settings. returns true if tesselation was recomputed and false otherwise.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") Tessellate;
		static Standard_Boolean Tessellate (const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer);
};


%extend StdPrs_ToolTriangulatedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_ToolVertex {
	public:
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "	:param aPoint:
	:type aPoint: TopoDS_Vertex &
	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: void
") Coord;
		static void Coord (const TopoDS_Vertex & aPoint,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend StdPrs_ToolVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_WFDeflectionRestrictedFace : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Defines a display featuring U and V isoparameters. Adds the surface aFace to the StdPrs_WFRestrictedFace algorithm. This face is found in a shape in the presentation object aPresentation, and its display attributes - in particular, the number of U and V isoparameters - are set in the attribute manager aDrawer. aFace is BRepAdaptor_HSurface surface created from a face in a topological shape. which is passed as an argument through the BRepAdaptor_HSurface surface created from it. This is what allows the topological face to be treated as a geometric surface.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Handle_BRepAdaptor_HSurface & aFace,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Defines a display of a delection-specified face. The display will feature U and V isoparameters. Adds the topology aShape to the StdPrs_WFRestrictedFace algorithm. This shape is found in the presentation object aPresentation, and its display attributes - except the number of U and V isoparameters - are set in the attribute manager aDrawer. The function sets the number of U and V isoparameters, NBUiso and NBViso, in the shape. To do this, the arguments DrawUIso and DrawVIso must be true. aFace is BRepAdaptor_HSurface surface created from a face in a topological shape. which is passed as an argument through the BRepAdaptor_HSurface surface created from it. This is what allows the topological face to be treated as a geometric surface. Curves give a sequence of face curves, it is used if the PrimitiveArray visualization approach is activated (it is activated by default).

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param DrawUIso:
	:type DrawUIso: bool
	:param DrawVIso:
	:type DrawVIso: bool
	:param Deflection:
	:type Deflection: float
	:param NBUiso:
	:type NBUiso: int
	:param NBViso:
	:type NBViso: int
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param Curves:
	:type Curves: Prs3d_NListOfSequenceOfPnt &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Handle_BRepAdaptor_HSurface & aFace,const Standard_Boolean DrawUIso,const Standard_Boolean DrawVIso,const Standard_Real Deflection,const Standard_Integer NBUiso,const Standard_Integer NBViso,const Handle_Prs3d_Drawer & aDrawer,Prs3d_NListOfSequenceOfPnt & Curves);
		%feature("compactdefaultargs") AddUIso;
		%feature("autodoc", "	* Defines a display featuring U isoparameters respectively. Add the surface aFace to the StdPrs_WFRestrictedFace algorithm. This face is found in a shape in the presentation object aPresentation, and its display attributes - in particular, the number of U isoparameters - are set in the attribute manager aDrawer. aFace is BRepAdaptor_HSurface surface created from a face in a topological shape. which is passed to the function as an argument through the BRepAdaptor_HSurface surface created from it. This is what allows the topological face to be treated as a geometric surface.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") AddUIso;
		static void AddUIso (const Handle_Prs3d_Presentation & aPresentation,const Handle_BRepAdaptor_HSurface & aFace,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") AddVIso;
		%feature("autodoc", "	* Defines a display featuring V isoparameters respectively. Add the surface aFace to the StdPrs_WFRestrictedFace algorithm. This face is found in a shape in the presentation object aPresentation, and its display attributes - in particular, the number of V isoparameters - are set in the attribute manager aDrawer. aFace is BRepAdaptor_HSurface surface created from a face in a topological shape. which is passed to the function as an argument through the BRepAdaptor_HSurface surface created from it. This is what allows the topological face to be treated as a geometric surface.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") AddVIso;
		static void AddVIso (const Handle_Prs3d_Presentation & aPresentation,const Handle_BRepAdaptor_HSurface & aFace,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Handle_BRepAdaptor_HSurface & aFace,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:param DrawUIso:
	:type DrawUIso: bool
	:param DrawVIso:
	:type DrawVIso: bool
	:param aDeflection:
	:type aDeflection: float
	:param NBUiso:
	:type NBUiso: int
	:param NBViso:
	:type NBViso: int
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Handle_BRepAdaptor_HSurface & aFace,const Handle_Prs3d_Drawer & aDrawer,const Standard_Boolean DrawUIso,const Standard_Boolean DrawVIso,const Standard_Real aDeflection,const Standard_Integer NBUiso,const Standard_Integer NBViso);
		%feature("compactdefaultargs") MatchUIso;
		%feature("autodoc", "	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") MatchUIso;
		static Standard_Boolean MatchUIso (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Handle_BRepAdaptor_HSurface & aFace,const Handle_Prs3d_Drawer & aDrawer);
		%feature("compactdefaultargs") MatchVIso;
		%feature("autodoc", "	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param aDistance:
	:type aDistance: float
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") MatchVIso;
		static Standard_Boolean MatchVIso (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real aDistance,const Handle_BRepAdaptor_HSurface & aFace,const Handle_Prs3d_Drawer & aDrawer);
};


%extend StdPrs_WFDeflectionRestrictedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_WFDeflectionSurface : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the surface aSurface to the presentation object aPresentation, and defines its boundaries and isoparameters. The shape's display attributes are set in the attribute manager aDrawer. These include whether deflection is absolute or relative to the size of the shape. The surface aSurface is a surface object from Adaptor, and provides data from a Geom surface. This makes it possible to use the surface in a geometric algorithm. Note that this surface object is manipulated by handles.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aSurface:
	:type aSurface: Handle_Adaptor3d_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Handle_Adaptor3d_HSurface & aSurface,const Handle_Prs3d_Drawer & aDrawer);
};


%extend StdPrs_WFDeflectionSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_WFPoleSurface : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds the surface aSurface to the presentation object aPresentation. The shape's display attributes are set in the attribute manager aDrawer. The surface aSurface is a surface object from Adaptor3d, and provides data from a Geom surface. This makes it possible to use the surface in a geometric algorithm.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aSurface:
	:type aSurface: Adaptor3d_Surface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Adaptor3d_Surface & aSurface,const Handle_Prs3d_Drawer & aDrawer);
};


%extend StdPrs_WFPoleSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_WFRestrictedFace : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theFace:
	:type theFace: Handle_BRepAdaptor_HSurface &
	:param theDrawUIso:
	:type theDrawUIso: bool
	:param theDrawVIso:
	:type theDrawVIso: bool
	:param theNbUIso:
	:type theNbUIso: int
	:param theNbVIso:
	:type theNbVIso: int
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:param theCurves:
	:type theCurves: Prs3d_NListOfSequenceOfPnt &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & thePresentation,const Handle_BRepAdaptor_HSurface & theFace,const Standard_Boolean theDrawUIso,const Standard_Boolean theDrawVIso,const Standard_Integer theNbUIso,const Standard_Integer theNbVIso,const Handle_Prs3d_Drawer & theDrawer,Prs3d_NListOfSequenceOfPnt & theCurves);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theFace:
	:type theFace: Handle_BRepAdaptor_HSurface &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & thePresentation,const Handle_BRepAdaptor_HSurface & theFace,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") AddUIso;
		%feature("autodoc", "	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theFace:
	:type theFace: Handle_BRepAdaptor_HSurface &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") AddUIso;
		static void AddUIso (const Handle_Prs3d_Presentation & thePresentation,const Handle_BRepAdaptor_HSurface & theFace,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") AddVIso;
		%feature("autodoc", "	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theFace:
	:type theFace: Handle_BRepAdaptor_HSurface &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") AddVIso;
		static void AddVIso (const Handle_Prs3d_Presentation & thePresentation,const Handle_BRepAdaptor_HSurface & theFace,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theDistance:
	:type theDistance: float
	:param theFace:
	:type theFace: Handle_BRepAdaptor_HSurface &
	:param theDrawUIso:
	:type theDrawUIso: bool
	:param theDrawVIso:
	:type theDrawVIso: bool
	:param theDeflection:
	:type theDeflection: float
	:param theNbUIso:
	:type theNbUIso: int
	:param theNbVIso:
	:type theNbVIso: int
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const Standard_Real theDistance,const Handle_BRepAdaptor_HSurface & theFace,const Standard_Boolean theDrawUIso,const Standard_Boolean theDrawVIso,const Standard_Real theDeflection,const Standard_Integer theNbUIso,const Standard_Integer theNbVIso,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") Match;
		%feature("autodoc", "	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theDistance:
	:type theDistance: float
	:param theFace:
	:type theFace: Handle_BRepAdaptor_HSurface &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") Match;
		static Standard_Boolean Match (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const Standard_Real theDistance,const Handle_BRepAdaptor_HSurface & theFace,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") MatchUIso;
		%feature("autodoc", "	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theDistance:
	:type theDistance: float
	:param theFace:
	:type theFace: Handle_BRepAdaptor_HSurface &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") MatchUIso;
		static Standard_Boolean MatchUIso (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const Standard_Real theDistance,const Handle_BRepAdaptor_HSurface & theFace,const Handle_Prs3d_Drawer & theDrawer);
		%feature("compactdefaultargs") MatchVIso;
		%feature("autodoc", "	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theDistance:
	:type theDistance: float
	:param theFace:
	:type theFace: Handle_BRepAdaptor_HSurface &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:rtype: bool
") MatchVIso;
		static Standard_Boolean MatchVIso (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const Standard_Real theDistance,const Handle_BRepAdaptor_HSurface & theFace,const Handle_Prs3d_Drawer & theDrawer);
};


%extend StdPrs_WFRestrictedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor StdPrs_WFShape;
class StdPrs_WFShape : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Computes wireframe presentation of a shape. @param thePresentation [in] the presentation. @param theShape [in] the shape. @param theDrawer [in] the draw settings. @param theIsParallel [in] perform algorithm using multiple threads

	:param thePresentation:
	:type thePresentation: Handle_Prs3d_Presentation &
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theDrawer:
	:type theDrawer: Handle_Prs3d_Drawer &
	:param theIsParallel: default value is Standard_False
	:type theIsParallel: bool
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & thePresentation,const TopoDS_Shape & theShape,const Handle_Prs3d_Drawer & theDrawer,Standard_Boolean theIsParallel = Standard_False);
		%feature("compactdefaultargs") AddEdgesOnTriangulation;
		%feature("autodoc", "	* Compute free and boundary edges on a triangulation of each face in the given shape. @param theShape  [in] the list of triangulated faces @param theToExcludeGeometric [in] flag indicating that Faces with defined Surface should be skipped

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theToExcludeGeometric: default value is Standard_True
	:type theToExcludeGeometric: bool
	:rtype: Handle_Graphic3d_ArrayOfPrimitives
") AddEdgesOnTriangulation;
		static Handle_Graphic3d_ArrayOfPrimitives AddEdgesOnTriangulation (const TopoDS_Shape & theShape,const Standard_Boolean theToExcludeGeometric = Standard_True);
		%feature("compactdefaultargs") AddEdgesOnTriangulation;
		%feature("autodoc", "	* Compute free and boundary edges on a triangulation of each face in the given shape. @param theSegments  [in] the sequence of points defining segments @param theShape  [in] the list of triangulated faces @param theToExcludeGeometric [in] flag indicating that Faces with defined Surface should be skipped

	:param theSegments:
	:type theSegments: TColgp_SequenceOfPnt
	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theToExcludeGeometric: default value is Standard_True
	:type theToExcludeGeometric: bool
	:rtype: void
") AddEdgesOnTriangulation;
		static void AddEdgesOnTriangulation (TColgp_SequenceOfPnt & theSegments,const TopoDS_Shape & theShape,const Standard_Boolean theToExcludeGeometric = Standard_True);
};


%extend StdPrs_WFShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class StdPrs_WFSurface : public Prs3d_Root {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Draws a surface by drawing the isoparametric curves with respect to a fixed number of points given by the Drawer. The number of isoparametric curves to be drawn and their color are controlled by the furnished Drawer.

	:param aPresentation:
	:type aPresentation: Handle_Prs3d_Presentation &
	:param aSurface:
	:type aSurface: Handle_Adaptor3d_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_Prs3d_Drawer &
	:rtype: void
") Add;
		static void Add (const Handle_Prs3d_Presentation & aPresentation,const Handle_Adaptor3d_HSurface & aSurface,const Handle_Prs3d_Drawer & aDrawer);
};


%extend StdPrs_WFSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */

# Microsoft Developer Studio Generated NMAKE File, Format Version 4.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=EulerProject03 - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to EulerProject03 - Win32\
 Debug.
!ENDIF 

!IF "$(CFG)" != "EulerProject03 - Win32 Release" && "$(CFG)" !=\
 "EulerProject03 - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "EulerProject03.mak" CFG="EulerProject03 - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "EulerProject03 - Win32 Release" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "EulerProject03 - Win32 Debug" (based on\
 "Win32 (x86) Console Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 
################################################################################
# Begin Project
# PROP Target_Last_Scanned "EulerProject03 - Win32 Debug"
F90=fl32.exe
RSC=rc.exe

!IF  "$(CFG)" == "EulerProject03 - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
OUTDIR=.\Release
INTDIR=.\Release

ALL : "$(OUTDIR)\EulerProject03.exe"

CLEAN : 
	-@erase ".\Release\EulerProject03.exe"
	-@erase ".\Release\EulerProject03.obj"
	-@erase ".\Release\Trabajo1JACOBI.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE RSC /l 0xc0a /d "NDEBUG"
# ADD RSC /l 0xc0a /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/EulerProject03.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
LINK32_FLAGS=kernel32.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/EulerProject03.pdb" /machine:I386\
 /out:"$(OUTDIR)/EulerProject03.exe" 
LINK32_OBJS= \
	"$(INTDIR)/EulerProject03.obj" \
	"$(INTDIR)/Trabajo1JACOBI.obj"

"$(OUTDIR)\EulerProject03.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "EulerProject03 - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
OUTDIR=.\Debug
INTDIR=.\Debug

ALL : "$(OUTDIR)\EulerProject03.exe"

CLEAN : 
	-@erase ".\Debug\EulerProject03.exe"
	-@erase ".\Debug\EulerProject03.obj"
	-@erase ".\Debug\Trabajo1JACOBI.obj"
	-@erase ".\Debug\EulerProject03.ilk"
	-@erase ".\Debug\EulerProject03.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/EulerProject03.pdb" 
F90_OBJS=.\Debug/
# ADD BASE RSC /l 0xc0a /d "_DEBUG"
# ADD RSC /l 0xc0a /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/EulerProject03.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=kernel32.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)/EulerProject03.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)/EulerProject03.exe" 
LINK32_OBJS= \
	"$(INTDIR)/EulerProject03.obj" \
	"$(INTDIR)/Trabajo1JACOBI.obj"

"$(OUTDIR)\EulerProject03.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.for{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

.f{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

.f90{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

################################################################################
# Begin Target

# Name "EulerProject03 - Win32 Release"
# Name "EulerProject03 - Win32 Debug"

!IF  "$(CFG)" == "EulerProject03 - Win32 Release"

!ELSEIF  "$(CFG)" == "EulerProject03 - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\EulerProject03.f90

"$(INTDIR)\EulerProject03.obj" : $(SOURCE) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=\
"\Users\Vieri\Documents\GitHub\Metodos-II---FORTRAN\Trabajo1JACOBI\Trabajo1JACOBI.f90"

"$(INTDIR)\Trabajo1JACOBI.obj" : $(SOURCE) "$(INTDIR)"
   $(F90) $(F90_PROJ) $(SOURCE)


# End Source File
# End Target
# End Project
################################################################################

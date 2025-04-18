CLOSE ALL
CLEAR ALL

SET UNIQUE OFF 
SET DATE TO dmy
SET CENTURY on
SET ENGINEBEHAVIOR 70
SET STRICTDATE TO 0
SET DELETED ON

SET TALK OFF
SET ECHO OFF 

PUBLIC stdVia, stdViaPropia, stdViaFolderActualiza


lcArchivoConfiguracion=ADDBS(ALLTRIM(SYS(5)+CURDIR()))+"Parametros.Ini"

stdVia			= ADDBS(ALLTRIM(LeerIni("Parametros","ViaDatosERP",lcArchivoConfiguracion)))
stdViaPropia 	= ADDBS(ALLTRIM(LeerIni("Parametros","ViaDatosPropios",lcArchivoConfiguracion)))
stdViaFolderActualiza = ADDBS(ALLTRIM(LeerIni("Parametros","FolderActualizaacion",lcArchivoConfiguracion)))+ALLTRIM(LeerIni("Parametros","NombreArchivo",lcArchivoConfiguracion))

DO FORM .\Formularios\FormularioVisorTrabajo.scx

CLOSE ALL
CLEAR ALL

CANCEL



FUNCTION LeerIni(cSection, cEntry, cINIFile)

LOCAL cDefault, cRetVal, nRetLen
cDefault = ""
cRetVal = Space(255)
nRetLen = LEN(cRetVal)

DECLARE integer GetPrivateProfileString IN WIN32API ;
	STRING cSection, ;
	String cEntry, ;
	STRING cDefault, ;
	STRING @cRetVal, ;
	INTEGER nRetLen, ;
	STRING cINIFile

nRet = GetPrivateProfileString(cSection, cEntry, cDefault, @cRetVal, nRetLen, cINIFile)
RETURN LEFT(cRetVal, nRetLen)

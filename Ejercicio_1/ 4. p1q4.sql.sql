-- Generado por Blanca
--   en:        2016-02-27 19:54:16 CET
--   sitio:      Oracle Database 12c
--   tipo:      Oracle Database 12c



DROP TABLE trabajadores CASCADE CONSTRAINTS ;

DROP TABLE centros CASCADE CONSTRAINTS ;

CREATE TABLE centros
  (
    id        NUMBER (2)
      GENERATED ALWAYS AS IDENTITY 
                        MINVALUE 1 
                        MAXVALUE 99
                        INCREMENT BY 1 
                        START WITH 1  
                        NOORDER  
                        NOCYCLE  NOT NULL ENABLE
      CONSTRAINT centros_id_pk PRIMARY KEY ,
    nombre    VARCHAR2 (30) NOT NULL ,
    calle     VARCHAR2 (30) ,
    numero    NUMBER (2) ,
    cp        VARCHAR2 (5) ,
    ciudad    VARCHAR2 (15) ,
    provincia VARCHAR2 (40) ,
    telefono  VARCHAR2 (9)
  ) ;

CREATE TABLE trabajadores
  (
    dni         VARCHAR2 (9) CONSTRAINT trab_dni_pk PRIMARY KEY ,
    nombre      VARCHAR2 (20) CONSTRAINT NNC_trab_nombre NOT NULL ,
    apellido1   VARCHAR2 (30) CONSTRAINT NNC_trab_apellido1 NOT NULL,
    apellido2   VARCHAR2 (30) CONSTRAINT NNC_trab_apellido2 NOT NULL,
    calle       VARCHAR2 (20) ,
    portal      NUMBER (2) ,
    piso        NUMBER (2) ,
    mano        VARCHAR2 (4) ,
    telMovil    VARCHAR2 (9) ,
    telPersonal VARCHAR2 (9) ,
    fechaNac    DATE ,
    salario     NUMBER (5) ,
    idCentro       NUMBER (2) CONSTRAINT NNC_trab_centro_id NOT NULL ,
    tipoTrabajador VARCHAR2 (1),
    CONSTRAINT trab_centro_fk FOREIGN KEY ( idCentro ) REFERENCES centros ( id )
  ) ;

SET SERVEROUTPUT ON;
/*Esto es con una a variable*/
DECLARE
a VARCHAR2(20):='Hola Mundo';
BEGIN
DBMS_OUTPUT.PUT_LINE(a);
END; 


/*Esto sin variable*/
BEGIN
DBMS_OUTPUT.PUT_LINE('Hola Mundo');
END; 

/*Esto es un hola mundo con un nombre despues*/
DESC CENTROS;
DESC TRABAJADORES;
DECLARE
v_nom VARCHAR2(20):='PEPE';
BEGIN
DBMS_OUTPUT.PUT_LINE('Hola Mundo' ||' '|| v_nom );
END;

/*Declarar una variable y luego usar esa variable para insertar una select*/

Declare
V_MAX_ID CENTROS.NOMBRE%TYPE;

BEGIN
  SELECT NOMBRE INTO V_MAX_ID
    FROM CENTROS
    WHERE ID = 3;
  IF SQL%FOUND
    THEN
      SYS.DBMS_OUTPUT.PUT_LINE('EL ULTIMO IDENTIFICADOR DE CENTRO'||V_MAX_ID);
  END IF;
EXCEPTION 
  WHEN NO_DATA_FOUND 
  THEN DBMS_OUTPUT.PUT_LINE('NO HAY CENTROS. TABLA VACIA');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('ERROR INESPERADO');
END;
                            
COMMIT;

/*a*/

Declare
V_IDCENTRO CENTROS.ID%TYPE;
V_NOMBRE CENTROS.NOMBRE%TYPE;

BEGIN
  SELECT NOMBRE INTO V_NOMBRE
    FROM CENTROS
    WHERE UPPER(NOMBRE)='ABRERA';
  IF SQL%FOUND
    THEN
      DBMS_OUTPUT.PUT_LINE('YA HAY UN CENTRO LLAMADO ABRERA');     
  END IF;
EXCEPTION 
  WHEN NO_DATA_FOUND 
  THEN INSERT INTO CENTROS(NOMBRE)
      VALUES('ABRERA');
      IF SQL%NOTFOUND
      THEN
        DBMS_OUTPUT.PUT_LINE('NINGUN REGISTRO INSERTADO');
        ELSE
          DBMS_OUTPUT.PUT_LINE('CENTRO INSERTADO');
          COMMIT;
        END IF;
  WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE('HAY MAS DE UN CENTRO CON EL MISMO NOMBRE');
END;

/*5*/
Declare
V_IDCENTRO CENTROS.ID%TYPE;
V_NOMBRE CENTROS.NOMBRE%TYPE;
V_PROV CENTROS.PROVINCIA
BEGIN
  UPDATE SELECT PROVINCIA INTO V_PROV
    FROM CENTROS
    WHERE UPPER(NOMBRE)='ABRERA';
  IF SQL%FOUND
    THEN
      DBMS_OUTPUT.PUT_LINE('YA HAY UN CENTRO LLAMADO ABRERA');     
  END IF;
EXCEPTION 
  WHEN NO_DATA_FOUND 
 
      THEN
        DBMS_OUTPUT.PUT_LINE('NINGUN REGISTRO INSERTADO');
        ELSE
          DBMS_OUTPUT.PUT_LINE('CENTRO INSERTADO');
          COMMIT;
        END IF;
  WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE('HAY MAS DE UN CENTRO CON EL MISMO NOMBRE');
END;





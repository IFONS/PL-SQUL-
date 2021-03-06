
CREATE OR REPLACE PROCEDURE VER_TRABAJADOR IS
CURSOR CUR_TRABAJADOR IS 
SELECT APELLIDO1, FECHANAC
                  FROM TRABAJADORES
                  ORDER BY APELLIDO1; --No puede ir en el begin porque devuelve mas de una fila
                  REG_TRABAJADOR CUR_TRABAJADOR%ROWTYPE;
                          
                          
BEGIN
OPEN CUR_TRABAJADOR;
    LOOP 
      FETCH CUR_TRABAJADOR INTO REG_TRABAJADOR;
      DBMS_OUTPUT.PUT_LINE('APELLIDO DEL TRABAJADOR' ||CUR_TRABAJADOR.APELLDO1);
      DBMS_OUTPUT.PUT_LINE('FECHA DE NACIMIENT' || TO_CHAR(REG_TRABAJADOR.FECHANAC));
      EXIT WHEN CUR_TRABAJADOR%NOTFOUND;
    END LOOP;
  CLOSE CUR_TRABAJADOR;
END;

EXECUTE VER_TRABAJADOR;


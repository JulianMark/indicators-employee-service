--TIPOS DE EMPLEADOS
INSERT INTO EMPLOYEE_TYPES (TYPE_EMPLOYEE)
VALUES ('FACER');

--EMPLEADOS
INSERT INTO EMPLOYEES (NAME, LASTNAME,ID_TYPE_EMPLOYEE, NICKNAME, PASSWORD)
VALUES ('JULIAN', 'MARK', 1 , 'JMARK', '123');
INSERT INTO EMPLOYEES (NAME, LASTNAME,ID_TYPE_EMPLOYEE, NICKNAME, PASSWORD)
VALUES ('DANIELA', 'SANZ', 1 , 'DSANZ', '123');

--ORGANIZACIONES SOCIALES Y CIVILES
INSERT INTO OSC (DESCRIPTION)
VALUES ('AFULIC');
INSERT INTO OSC (DESCRIPTION)
VALUES ('SOLES');

--lOCALIZACION DE LAS CAMPANIAS
INSERT INTO LOCATIONS (DESCRIPTION)
VALUES ('CORDOBA');

--TIPOS DE CAMPANIAS
INSERT INTO CAMPAIGN_TYPES (DESCRIPTION)
VALUES ('ITINERANCIA');
INSERT INTO CAMPAIGN_TYPES (DESCRIPTION)
VALUES ('VIA PUBLICA');
INSERT INTO CAMPAIGN_TYPES (DESCRIPTION)
VALUES ('EVENTOS');

--CAMPANIAS
INSERT INTO CAMPAIGNS (NAME, ID_LOC, ID_OSC, ID_TYPE_CAMPAIGN)
VALUES ('RIO CUARTO',1,1,1);
INSERT INTO CAMPAIGNS (NAME, ID_LOC, ID_OSC, ID_TYPE_CAMPAIGN)
VALUES ('VILLA ALLENDE',1,2,1);

--EQUIPOS
--EMPLEADO JULIAN ID 1 CAMPAÑA 1 OSC AFULIC ID 1
INSERT INTO TEAM_EMPLOYEES (ID_EMPLOYEE, INITIAL_DATE, FINAL_DATE,ID_CAMPAIGN)
VALUES (1, SYSDATE, NULL, 1);
--EMPLEADO DANIELA ID 2 CAMPAÑA 1 OSC AFULIC ID 1
INSERT INTO TEAM_EMPLOYEES (ID_EMPLOYEE, INITIAL_DATE, FINAL_DATE,ID_CAMPAIGN)
VALUES (2, SYSDATE, NULL, 1);

--TIPO DE PAGOS
INSERT INTO PAY_TYPES (DESCRIPTION)
VALUES ('CREDITO');
INSERT INTO PAY_TYPES (DESCRIPTION)
VALUES ('DEBITO');

--DONACIONES EMPLEADO JULIAN ID 1 CAMPAÑA 1 OSC AFULIC ID 1
INSERT INTO DONATIONS (AMOUNT, ID_TYPE_PAY , ID_EMPLOYEE_TEAM, ID_CAMPAIGN, CREATE_DATE)
VALUES (300, 1,(SELECT ID_EMPLOYEE FROM TEAM_EMPLOYEES WHERE ID = 1), (SELECT ID_CAMPAIGN FROM TEAM_EMPLOYEES WHERE ID = 1), SYSDATE);
INSERT INTO DONATIONS (AMOUNT, ID_TYPE_PAY , ID_EMPLOYEE_TEAM, ID_CAMPAIGN, CREATE_DATE)
VALUES (500, 2,(SELECT ID_EMPLOYEE FROM TEAM_EMPLOYEES WHERE ID = 1), (SELECT ID_CAMPAIGN FROM TEAM_EMPLOYEES WHERE ID = 1), SYSDATE);
INSERT INTO DONATIONS (AMOUNT, ID_TYPE_PAY , ID_EMPLOYEE_TEAM, ID_CAMPAIGN, CREATE_DATE)
VALUES (400, 1,(SELECT ID_EMPLOYEE FROM TEAM_EMPLOYEES WHERE ID = 1), (SELECT ID_CAMPAIGN FROM TEAM_EMPLOYEES WHERE ID = 1), SYSDATE);
--FIN DONACIONES EMPLEADO JULIAN ID 1 CAMPAÑA 1 OSC AFULIC ID 1

--DONACIONES EMPLEADO DANIELA ID 2 CAMPAÑA 1 OSC AFULIC ID 1
INSERT INTO DONATIONS (AMOUNT, ID_TYPE_PAY , ID_EMPLOYEE_TEAM, ID_CAMPAIGN, CREATE_DATE)
VALUES (350, 2,(SELECT ID_EMPLOYEE FROM TEAM_EMPLOYEES WHERE ID = 2), (SELECT ID_CAMPAIGN FROM TEAM_EMPLOYEES WHERE ID = 2), SYSDATE);
INSERT INTO DONATIONS (AMOUNT, ID_TYPE_PAY , ID_EMPLOYEE_TEAM, ID_CAMPAIGN, CREATE_DATE)
VALUES (300, 2,(SELECT ID_EMPLOYEE FROM TEAM_EMPLOYEES WHERE ID = 2), (SELECT ID_CAMPAIGN FROM TEAM_EMPLOYEES WHERE ID = 2), SYSDATE);
--FIN DONACIONES EMPLEADO DANIELA ID 2 CAMPAÑA 1 OSC AFULIC ID 1

--REGISTRO DIARIO EMPLEADO JULIAN ID 1 CAMPAÑA 1 OSC AFULIC ID 1
INSERT INTO DAILY_RECORDS (ID_EMPLOYEE_TEAM, ID_CAMPAIGN, PRODUCTIVE_HOURS, NON_PRODUCTIVE_HOURS, CREATE_DATE)
VALUES ((SELECT ID_EMPLOYEE FROM TEAM_EMPLOYEES WHERE ID = 1), 1, 3, 1, TO_DATE('2019/12/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
--FIN REGISTRO DIARIO EMPLEADO JULIAN ID 1 CAMPAÑA 1 OSC AFULIC ID 1

--REGISTRO DIARIO EMPLEADO DANIELA ID 2 CAMPAÑA 1 OSC AFULIC ID 1
INSERT INTO DAILY_RECORDS (ID_EMPLOYEE_TEAM, ID_CAMPAIGN, PRODUCTIVE_HOURS, NON_PRODUCTIVE_HOURS, CREATE_DATE)
VALUES ((SELECT ID_EMPLOYEE FROM TEAM_EMPLOYEES WHERE ID = 2), 1, 5, 3, TO_DATE('2019/12/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
--FIN REGISTRO DIARIO EMPLEADO DANIELA ID 2 CAMPAÑA 1 OSC AFULIC ID 1

--DESVICULACION DE EMPLEADO JULIAN ID 1 DEL EQUIPO DE LA CAMPANIA 1
UPDATE TEAM_EMPLOYEES SET FINAL_DATE = SYSDATE WHERE ID_EMPLOYEE = 1;

--VINCULACION DE EMPLEADO JULIAN ID 1 AL EQUIPO DE LA CAMPANIA 2
INSERT INTO TEAM_EMPLOYEES (ID_EMPLOYEE, INITIAL_DATE, FINAL_DATE,ID_CAMPAIGN)
VALUES (1, SYSDATE, NULL, 2);

--DONACIONES EMPLEADO JULIAN ID 1 CAMPAÑA 2 OSC SOLES ID 2
INSERT INTO DONATIONS (AMOUNT, ID_TYPE_PAY , ID_EMPLOYEE_TEAM, ID_CAMPAIGN, CREATE_DATE)
VALUES (450, 1,(SELECT ID_EMPLOYEE FROM TEAM_EMPLOYEES WHERE ID = 3), (SELECT ID_CAMPAIGN FROM TEAM_EMPLOYEES WHERE ID = 3), SYSDATE);
INSERT INTO DONATIONS (AMOUNT, ID_TYPE_PAY , ID_EMPLOYEE_TEAM, ID_CAMPAIGN, CREATE_DATE)
VALUES (550, 2,(SELECT ID_EMPLOYEE FROM TEAM_EMPLOYEES WHERE ID = 3), (SELECT ID_CAMPAIGN FROM TEAM_EMPLOYEES WHERE ID = 3), SYSDATE);
--FIN DONACIONES EMPLEADO JULIAN ID 1 CAMPAÑA 2 OSC SOLES ID 2


INSERT INTO DAILY_RECORDS (ID_EMPLOYEE_TEAM, ID_CAMPAIGN, PRODUCTIVE_HOURS, NON_PRODUCTIVE_HOURS, CREATE_DATE)
VALUES (1, 2, 3, 1, TO_DATE('2019/12/23 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
INSERT INTO DAILY_RECORDS (ID_EMPLOYEE_TEAM, ID_CAMPAIGN, PRODUCTIVE_HOURS, NON_PRODUCTIVE_HOURS, CREATE_DATE)
VALUES (1, 2, 8, 1, TO_DATE('2019/12/24 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));


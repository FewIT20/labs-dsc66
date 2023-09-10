INSERT INTO LAB_EMP VALUES(1, 'Pastel','Lorenze', 'lpastel', 895);

INSERT INTO  LAB_EMP (ID, LAST_NAME, FIRST_NAME, USERID, SALARY) VALUES (2, 'Dansk','Patty', 'pdansk', 860);

UPDATE `lab_emp` SET `last_name`='Detroid' WHERE `id`=3;

UPDATE `lab_emp` SET `salary`=1000 WHERE `salary` < 900;

DELETE FROM `lab_emp` WHERE `first_name`='Patty' AND `last_name`='Dansk';

INSERT INTO `interesting` VALUES (20014, 10011, '2001-03-16', 'Wonderful Interior');

UPDATE `staff` SET `Salary`=700 WHERE `StaffNo`=400023;

UPDATE `locations` SET `state_province`=NULL;

DELETE FROM `lab_emp`;

DELETE FROM `lab_emp` WHERE `salary` < 1200;
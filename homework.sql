-- 1. �� ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ�. ��, ��� ����� "�а� ��", "�迭"
-- ���� ǥ���ϵ��� �Ѵ�.
SELECT
         DEPARTMENT_NAME  �а���
       , CATEGORY �迭
    FROM TB_DEPARTMENT;
    
-- 2. �а��� �а� ������ ������ ���� ���·� ȭ�鿡 ����Ѵ�.
SELECT
        DEPARTMENT_NAME || '�� ������' || CAPACITY || '�� �Դϴ�.' 
   FROM TB_DEPARTMENT;
   
-- 3. "������а�" �� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û��
-- ���Դ�. �����ΰ�? (�����а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ�
-- ã�� ������ ����)
SELECT
        S.STUDENT_NAME
   FROM TB_DEPARTMENT D
   JOIN TB_STUDENT S ON (S.DEPARTMENT_NO = D.DEPARTMENT_NO)
  WHERE SUBSTR(S.STUDENT_SSN,8,1) IN ('2','4') 
    AND S.ABSENCE_YN = 'Y'
    AND D.DEPARTMENT_NAME = '������а�';

-- 4. ���������� ���� ���� ��� ��ü�� ���� ã�� �̸��� �Խ��ϰ��� ����. �� ����ڵ���
-- �й��� ������ ���� �� ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�.
SELECT
        STUDENT_NAME
   FROM TB_STUDENT
  WHERE STUDENT_NO = 'A513090';
  
-- 5. ���������� 20 �� �̻� 30 �� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.
SELECT
        DEPARTMENT_NAME
      , CATEGORY
   FROM TB_DEPARTMENT
  WHERE CAPACITY BETWEEN 20 AND 30;

-- 6.�� ������б��� ������ �����ϰ� ��� �������� �Ҽ� �а��� ������ �ִ�. �׷� ��
-- ������б� ������ �̸��� �˾Ƴ� �� �ִ� SQL ������ �ۼ��Ͻÿ�.
SELECT
        PROFESSOR_NAME
   FROM TB_PROFESSOR
  WHERE DEPARTMENT_NO IS NULL;
  
-- 7. Ȥ�� ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���ϰ��� ����.
-- ��� SQL ������ ����ϸ� �� ������ �ۼ��Ͻÿ�.
SELECT
        STUDENT_NAME
   FROM TB_STUDENT
  WHERE DEPARTMENT_NO IS NULL;
  
-- 8. ������û�� �Ϸ��� ����. �������� ���θ� Ȯ���ؾ� �ϴµ�, ���������� �����ϴ�
-- ������� � �������� �����ȣ�� ��ȸ�غ��ÿ�.
SELECT
        CLASS_NO
   FROM TB_CLASS
  WHERE PREATTENDING_CLASS_NO IS NOT NULL;
  
-- 9. �� ���п��� � �迭(CATEGORY)���� �ִ��� ��ȸ�غ��ÿ�.
SELECT
        DISTINCT(CATEGORY)
   FROM TB_DEPARTMENT;

-- 10. 02 �й� ���� �����ڵ��� ������ ������� ����. ������ ������� ������ ��������
-- �л����� �й�, �̸�, �ֹι�ȣ�� ����ϴ� ������ �ۼ��Ͻÿ�.
SELECT
        STUDENT_NO
      , STUDENT_NAME
      , STUDENT_SSN
   FROM TB_STUDENT
  WHERE ABSENCE_YN = 'N'
    AND SUBSTR(STUDENT_NO,2,1) = '2'
    AND STUDENT_ADDRESS LIKE '%����%';

-- 1. ������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵�� ���� �⵵�� ����
-- ������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.( ��, ����� "�й�", "�̸�", "���г⵵" ��
-- ǥ�õǵ��� �Ѵ�.)
SELECT
        STUDENT_NO
      , STUDENT_NAME
      , TO_CHAR(TO_DATE(ENTRANCE_DATE,'RR-MM-DD'),'RRRR-MM-DD')
   FROM TB_STUDENT
  WHERE DEPARTMENT_NO = '002'
  ORDER BY ENTRANCE_DATE ASC;
  
-- 2. �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� ����. �� ������
-- �̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL ������ �ۼ��� ����. (* �̶� �ùٸ��� �ۼ��� SQL
-- ������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��)
SELECT
        PROFESSOR_NAME
      , PROFESSOR_SSN
   FROM TB_PROFESSOR
  WHERE PROFESSOR_NAME NOT LIKE '___';

-- 3. �� ������б��� ���� �������� �̸��� ���̸� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��
-- �̶� ���̰� ���� ������� ���� ��� ������ ȭ�鿡 ��µǵ��� ����ÿ�. (��, ���� ��
-- 2000 �� ���� ����ڴ� ������ ��� ����� "�����̸�", "����"�� ����. ���̴� ����������
-- �������.)

-- '��'�� ���� �𸣰ڽ��ϴ�.
SELECT
        PROFESSOR_NAME �����̸�
      , EXTRACT(YEAR FROM SYSDATE) - TO_CHAR(TO_DATE(SUBSTR(PROFESSOR_SSN,1,2),'RR'),'RRRR') ����
   FROM TB_PROFESSOR
  WHERE SUBSTR(PROFESSOR_SSN,8,1) = '1'
   ORDER BY ���� ASC;
  
-- 4. �������� �̸� �� ���� ������ �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��� �����
-- ?�̸�? �� �������� ����. (���� 2 ���� ���� ������ ���ٰ� �����Ͻÿ�)
SELECT
        SUBSTR(PROFESSOR_NAME,2,3)
   FROM TB_PROFESSOR
  WHERE PROFESSOR_NAME NOT LIKE '__';


-- 5. �� ������б��� ����� �����ڸ� ���Ϸ��� ����. ��� ã�Ƴ� ���ΰ�? �̶�,
-- 19 �쿡 �����ϸ� ����� ���� ���� ������ �A������.
SELECT
        STUDENT_NO
      , STUDENT_NAME
   FROM TB_STUDENT
  WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) - 
  EXTRACT(YEAR FROM STUDENT_ADDRESS) > 19;
  
-- 6. 2020 �� ũ���������� ���� �����ΰ�?
SELECT
        TO_CHAR(TO_DATE(20201225,'YYYYMMDD'),'YYYYMMDD DAY')
    FROM DUAL;

-- 7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD') �� ���� �� �� ��
-- �� �� ���� �ǹ�����? �� TO_DATE('99/10/11','RR/MM/DD'),
-- TO_DATE('49/10/11','RR/MM/DD') �� ���� �� �� �� �� �� ���� �ǹ�����?
/* � ���� ���ϴ°��� �𸣰ڴ�.. */
SELECT
        TO_DATE('99/10/11','YY/MM/DD'),TO_DATE('49/10/11','YY/MM/DD')
      , TO_DATE('99/10/11','RR/MM/DD'),TO_DATE('49/10/11','RR/MM/DD')
    FROM DUAL;

-- 8. �� ������б��� 2000 �⵵ ���� �����ڵ��� �й��� A �� �����ϰ� �Ǿ��ִ�. 2000 �⵵
-- �̠� �й��� ���� �л����� �й��� �̸��� �����ִ� SQL ������ �ۼ��Ͻÿ�.
SELECT
        STUDENT_NO
      , STUDENT_NAME
   FROM TB_STUDENT
  WHERE STUDENT_NO NOT LIKE 'A%';
  
-- 9. �й��� A517178 �� ���Ƹ� �л��� ���� �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��,
-- �̶� ��� ȭ���� ����� "����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� ��
-- �ڸ������� ǥ������.
SELECT
        ROUND(AVG(POINT),1) ����
   FROM TB_GRADE
  WHERE STUDENT_NO = 'A517178' ;

-- 10. �а��� �л����� ���Ͽ� "�а���ȣ", "�л���(��)" �� ���·� ����� ����� �������
-- ��µǵ��� �Ͻÿ�.


  
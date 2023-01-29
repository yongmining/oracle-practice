-- �� ������б��� �а� �̸��� �迭�� ǥ���Ͻÿ�. ��, ��� ����� "�а� ��", "�迭"
-- ���� ǥ���ϵ��� �Ѵ�.
SELECT
         DEPARTMENT_NAME  �а���
       , CATEGORY �迭
    FROM TB_DEPARTMENT;
    
-- �а��� �а� ������ ������ ���� ���·� ȭ�鿡 ����Ѵ�.
SELECT
        DEPARTMENT_NAME || '�� ������' || CAPACITY || '�� �Դϴ�.' 
   FROM TB_DEPARTMENT;
   
-- "������а�" �� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƴ޶�� ��û��
-- ���Դ�. �����ΰ�? (�����а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ�
-- ã�� ������ ����)
SELECT
        S.STUDENT_NAME
   FROM TB_DEPARTMENT D
   JOIN TB_STUDENT S ON (S.DEPARTMENT_NO = D.DEPARTMENT_NO)
  WHERE SUBSTR(S.STUDENT_SSN,8,1) IN ('2','4') 
    AND S.ABSENCE_YN = 'Y'
    AND D.DEPARTMENT_NAME = '������а�';

-- ���������� ���� ���� ��� ��ü�� ���� ã�� �̸��� �Խ��ϰ��� ����. �� ����ڵ���
-- �й��� ������ ���� �� ����ڵ��� ã�� ������ SQL ������ �ۼ��Ͻÿ�.
SELECT
        STUDENT_NAME
   FROM TB_STUDENT
  WHERE STUDENT_NO = 'A513090';
  
-- ���������� 20 �� �̻� 30 �� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.
SELECT
        DEPARTMENT_NAME
      , CATEGORY
   FROM TB_DEPARTMENT
  WHERE CAPACITY BETWEEN 20 AND 30;

-- �� ������б��� ������ �����ϰ� ��� �������� �Ҽ� �а��� ������ �ִ�. �׷� ��
-- ������б� ������ �̸��� �˾Ƴ� �� �ִ� SQL ������ �ۼ��Ͻÿ�.
SELECT
        PROFESSOR_NAME
   FROM TB_PROFESSOR
  WHERE DEPARTMENT_NO IS NULL;
  
-- Ȥ�� ������� ������ �а��� �����Ǿ� ���� ���� �л��� �ִ��� Ȯ���ϰ��� ����.
-- ��� SQL ������ ����ϸ� �� ������ �ۼ��Ͻÿ�.
SELECT
        STUDENT_NAME
   FROM TB_STUDENT
  WHERE DEPARTMENT_NO IS NULL;
  
-- ������û�� �Ϸ��� ����. �������� ���θ� Ȯ���ؾ� �ϴµ�, ���������� �����ϴ�
-- ������� � �������� �����ȣ�� ��ȸ�غ��ÿ�.
SELECT
        CLASS_NO
   FROM TB_CLASS
  WHERE PREATTENDING_CLASS_NO IS NOT NULL;
  
-- �� ���п��� � �迭(CATEGORY)���� �ִ��� ��ȸ�غ��ÿ�.




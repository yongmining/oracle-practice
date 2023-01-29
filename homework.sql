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
  WHERE STUDENT_NO = 'A513091';
  
-- ���������� 20 �� �̻� 30 �� ������ �а����� �а� �̸��� �迭�� ����Ͻÿ�.
SELECT
        DEPARTMENT_NAME
      , CATEGORY
   FROM TB_DEPARTMENT




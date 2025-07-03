-- 問題21
-- departments と employees を結合し、各部門名（dept_name）ごとに在籍する従業員の名前一覧をカンマ区切りで集約し、dept_name と従業員リストを取得せよ（Oracle の LISTAGG を使用）。



SELECT 
    D.DEPT_NAME,
    LISTAGG(E.EMP_NAME,',')
        WITHIN GROUP (ORDER BY E.EMP_NAME)
FROM DEPARTMENTS D
    JOIN EMPLOYEES E
        ON D.DEPT_ID=E.DEPT_ID
    GROUP BY D.DEPT_NAME;
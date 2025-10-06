CREATE OR REPLACE PROCEDURE count_emp (IN p_gender VARCHAR(50), OUT count_e INT)
LANGUAGE plpgsql
AS $$
    SELECT COUNT(*) 
    INTO count_e 
    FROM Employe e
    WHERE e.gender = p_gender;

	RAISE NOTICE 'Total Employe with gender % : %', p_gender, count_e;
$$;

CALL count_emp('MALE', NULL);
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE,
    age INT,
    class INT
);

-- EXCEPTION HANDLING


DO $$
BEGIN TRANSACTION 
    -- Start a transaction
    BEGIN 
        -- Insert multiple students
        INSERT INTO students(name, age, class) VALUES ('Anisha',16,8);
        INSERT INTO students(name, age, class) VALUES ('Neha',17,8);
        INSERT INTO students(name, age, class) VALUES ('Mayank',19,9);

        -- If all succeed
        RAISE NOTICE ' Transaction Successfully Done';

    EXCEPTION WHEN OTHERS THEN
            -- If any insert fails
            RAISE NOTICE 'Transaction Failed..! Rolling back changes.';
            RAISE;  -- this will rollback the entire transaction
    END;
END;
$$;


SELECT * FROM students;



--VIOLATED SCENARIO
DO $$
BEGIN TRANSACTION 
    -- Start a transaction
    BEGIN 
        -- Insert multiple students
        INSERT INTO students(name, age, class) VALUES ('Anisha',16,8);
		INSERT INTO students(name, age, class) VALUES ('Mayank',19,9);
        INSERT INTO students(name, age, class) VALUES ('Anisha',17,8); 
        INSERT INTO students(name, age, class) VALUES ('Mayank',19,9);

        -- If all succeed
        RAISE NOTICE ' Transaction Successfully Done';

    EXCEPTION WHEN OTHERS THEN
            -- If any insert fails
            RAISE NOTICE 'Transaction Failed..! Rolling back changes.';
            RAISE;  -- this will rollback the entire transaction
    END;
END;
$$;

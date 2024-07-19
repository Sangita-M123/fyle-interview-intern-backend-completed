-- Write query to get number of graded assignments for each student:

SELECT
    student_id,
    COUNT(*) AS num_graded_assignments
FROM assignments
WHERE state = 'GRADED'  -- Assuming 'GRADED' is the state for graded assignments
GROUP BY student_id;


--Explanation:
--SELECT statement: Selects the student_id and counts the number of rows (COUNT(*)) for each student.

--FROM clause: Specifies the assignments table from which data is retrieved.

--WHERE clause: Filters the assignments where the state is 'GRADED'. Adjust this condition based on your actual schema and data.

--GROUP BY clause: Groups the results by student_id, so the COUNT(*) function aggregates the number of graded assignments for each student.

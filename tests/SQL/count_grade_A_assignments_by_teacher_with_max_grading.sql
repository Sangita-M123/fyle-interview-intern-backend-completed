-- Write query to find the number of grade A's given by the teacher who has graded the most assignments

WITH GradingCounts AS (
    -- Subquery to count number of assignments graded by each teacher
    SELECT
        teacher_id,
        COUNT(*) AS graded_count
    FROM assignments
    WHERE state = 'GRADED'  -- Assuming 'GRADED' is the state for graded assignments
    GROUP BY teacher_id
),
MaxGradedTeacher AS (
    -- Subquery to find the teacher with the maximum graded assignments
    SELECT teacher_id
    FROM GradingCounts
    WHERE graded_count = (
        SELECT MAX(graded_count)
        FROM GradingCounts
    )
    LIMIT 1
)
-- Main query to count grade A assignments given by the teacher with the most graded assignments
SELECT
    COUNT(*) AS num_grade_A_assignments
FROM assignments
WHERE state = 'GRADED'  -- Assuming 'GRADED' is the state for graded assignments
    AND teacher_id = (SELECT teacher_id FROM MaxGradedTeacher)
    AND grade = 'A';  -- Assuming 'A' is the grade for grade A assignments


--Explanation:
--GradingCounts: This common table expression (CTE) counts the number of assignments graded (GRADED state) by each teacher.

--MaxGradedTeacher: Another CTE that selects the teacher_id of the teacher who has graded the maximum number of assignments. It uses a subquery to find the maximum count from GradingCounts.

--Main Query: Counts the number of assignments where:

--state is GRADED.
--teacher_id matches the teacher_id from MaxGradedTeacher.
--grade is 'A', filtering for grade A assignments.

UPDATE "darts"
SET score = CASE
    WHEN x * x + y * y <= 1 * 1 THEN 10
    WHEN x * x + y * y <= 5 * 5 THEN 5
    WHEN x * x + y * y <= 10 * 10 THEN 1
    ELSE 0
END

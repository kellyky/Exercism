UPDATE "darts"
SET score = CASE
    WHEN SQRT (POWER(x, 2) + POWER(y, 2)) <= 1 THEN 10
    WHEN SQRT (POWER(x, 2) + POWER(y, 2)) <= 5 THEN 5
    WHEN SQRT (POWER(x, 2) + POWER(y, 2)) <= 10 THEN 1
    ELSE 0
END

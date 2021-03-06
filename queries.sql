-- name: GetHighscore :one
SELECT * FROM highscores
WHERE username = $1 LIMIT 1;

-- name: ListHighscores :many
SELECT * FROM highscores
ORDER BY score;

-- name: CreateHighscore :one
INSERT INTO highscores(username, score) 
VALUES ($1, $2) RETURNING *;

-- name: UpdateHighscore :one
UPDATE highscores
SET score = $2
WHERE id = $1 RETURNING *;

-- name: DeleteHighscore :exec
DELETE FROM highscores
WHERE username = $1;
postgres:
	docker run --name postgres15 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=rootpass -d postgres:15-alpine
createdb:
	docker exec -it postgres15 createdb --username=root --owner=root golang_bank

dropdb:
	docker exec -it postgres15 dropdb golang_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:rootpass@localhost:5432/golang_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:rootpass@localhost:5432/golang_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc


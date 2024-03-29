run:
	docker-compose up -d --build membershipapi

stop:
	docker-compose down

remove:
	docker-compose down --volumes --remove-orphans

runlocal:
	go mod tidy
	go build -v cmd/api/main.go
	./main

updbtest:
	@echo "setting up database with no permanent data for tests"
	docker-compose up -d databasetest

downdbtest:
	@echo "downing database test"
	docker-compose down --volumes

test:
	go test -v -cover -count=1 ./...

# Allows tests execution out of container. The default hard-coded config will be used.
testlocal:
	go test -v -cover ./...

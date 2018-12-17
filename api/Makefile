start:
	docker-compose up

reset_database:
	@echo "Resetting database..."
	docker-compose exec backend rails db:reset

test:
	docker-compose exec backend rspec spec

down:
	docker-compose down

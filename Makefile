clean:
	rm -rf .aptible
.PHONY: clean

build: clean
	mkdir .aptible
	echo "main: npm start\ncron: PORT=3001 npm start" > .aptible/Procfile
	docker build -t quay.io/aptible/terraform-multiservice-test:latest .
.PHONY: build

push:
	docker push quay.io/aptible/terraform-multiservice-test:latest
.PHONY: push

bp: build push
.PHONY: bp

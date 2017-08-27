PROJECT := backent


clean:
	find . -name "*.pyc" -delete
	find . -name "__pycache__" -delete


setup: update resetdb


update:
	pip install -U pip setuptools
	pip install -r requirements.txt


pylint:
	pylint --rcfile=.pylintrc $(PROJECT)


initdb:
	dropdb --if-exists $(PROJECT)
	createdb $(PROJECT)
	psql -c "CREATE EXTENSION POSTGIS;" $(PROJECT)


resetdb: initdb
	./manage.py migrate

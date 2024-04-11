.PHONY: venv
venv: ## Create and activate virtual environment
	/usr/bin/python3 -m pip install virtualenv
	/usr/bin/python3 -m virtualenv venv
	. venv/bin/activate
FROM python:3.8.16

RUN apt-get update && \
	apt-get install -y --no-install-recommends git xorg-dev \
	libglu1-mesa-dev libglew-dev cmake xauth xvfb gifsicle && \
	rm -rf /var/lib/apt/lists/*

RUN git clone --recurse-submodules \
	https://github.com/EvolutionGym/evogym.git /evogym && \
	cd /evogym && \
	git checkout 533b985

COPY ./submodule/POET-Evogym-LLM/requirements.txt /POET-LLM/requirements.txt

RUN cd /POET-LLM && \
	pip install -r requirements.txt

COPY ./submodule/POET-Evogym-LLM /POET-LLM

RUN cd /evogym && \
	python setup.py install

FROM python:3.8.16

RUN apt-get update && \
	apt-get install -y --no-install-recommends git xorg-dev \
	libglu1-mesa-dev libglew-dev cmake xauth xvfb gifsicle && \
	rm -rf /var/lib/apt/lists/*

RUN git clone \
	https://github.com/Cloeel/POET-Evogym-LLM /POET-LLM && \
	cd /POET-LLM && \
	pip install -r requirements.txt 


RUN git clone --recurse-submodules \
	https://github.com/EvolutionGym/evogym.git /evogym && \
	cd /evogym && \
	python setup.py install
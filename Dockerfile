FROM python:3.11-slim


RUN apt-get update && apt-get install -y curl && \
    curl -LsSf https://astral.sh/uv/install.sh | sh && \
    rm -rf /var/lib/apt/lists/*
    
ENV PATH="/root/.local/bin:${PATH}"

RUN uv pip install jupyter --system

EXPOSE 8888

VOLUME ["/notebooks"]
WORKDIR /notebooks

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]

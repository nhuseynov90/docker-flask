FROM python:latest
RUN mkdir /app
WORKDIR /app
COPY *.py requirements.txt ./
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["main.py"]

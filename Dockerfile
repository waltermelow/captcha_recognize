FROM python:2.7.9

# Anaconda
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda2-4.3.1-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh

# Python
WORKDIR /usr/src/app
COPY requirements.txt ./

# DML
RUN pip install --upgrade pip

# RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir captcha==0.1.1
RUN pip install --no-cache-dir --ignore-installed tensorflow==1.1.0

# COPY . .

# CMD [ "python", "/usr/src/myapp/captcha_gen_default.py" ]

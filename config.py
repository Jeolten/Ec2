import os
import time
pidfile = 'application.pid'
bind = '0.0.0.0:3000'
backlog = 2048
workers = 3
worker_class = 'gthread'
worker_tmp_dir = '/dev/shm'
worker_connections = 30
threads = 3
timeout = 30
loglevel = 'debug'
graceful_timeout = 30
keep_alive = 10
reload_engine = 'auto'

from dotenv import load_dotenv
import os

def load_env_file():
    load_dotenv()

def get_env_variable(variable_name):
    return os.getenv(variable_name)

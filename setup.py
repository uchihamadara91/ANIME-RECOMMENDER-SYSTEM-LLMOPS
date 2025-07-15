from setuptools import setup,find_packages

with open("requirements.txt") as f:
    requirements = f.read().splitlines()

setup(
    name="ANIME-RECOMMENDER",
    version="0.0",
    author="Shankar",
    packages=find_packages(),
    install_requires = requirements,
)
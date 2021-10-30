from setuptools import setup

from pathlib import Path
this_directory = Path(__file__).parent
long_description = (this_directory / "README.md").read_text()
from Cython.Build import cythonize

setup(
    ext_modules=cythonize(["SentiNet/*.pyx", "SentiNet/*.pxd"],
                          compiler_directives={'language_level': "3"}),
    name='NlpToolkit-SentiNet-Cy',
    version='1.0.5',
    packages=['SentiNet'],
    package_data={'SentiNet': ['*.pxd', '*.pyx', '*.c']},
    url='https://github.com/StarlangSoftware/TurkishSentiNet-Cy',
    license='',
    author='olcaytaner',
    author_email='olcay.yildiz@ozyegin.edu.tr',
    description='Turkish SentiNet',
    long_description=long_description,
    long_description_content_type='text/markdown'
)

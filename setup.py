from distutils.core import setup
from Cython.Build import cythonize

setup(
    ext_modules=cythonize(["SentiNet/*.pyx", "SentiNet/*.pxd"],
                          compiler_directives={'language_level': "3"}),
    name='NlpToolkit-SentiNet-Cy',
    version='1.0.0',
    packages=['SentiNet'],
    url='https://github.com/olcaytaner/TurkishSentiNet-Cy',
    license='',
    author='olcaytaner',
    author_email='olcaytaner@isikun.edu.tr',
    description='Turkish SentiNet'
)

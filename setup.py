from distutils.core import setup
from Cython.Build import cythonize

setup(
    ext_modules=cythonize(["SentiNet/*.pyx", "SentiNet/*.pxd"],
                          compiler_directives={'language_level': "3"}),
    name='NlpToolkit-SentiNet-Cy',
    version='1.0.4',
    packages=['SentiNet'],
    package_data={'SentiNet': ['*.pxd', '*.pyx', '*.c']},
    url='https://github.com/StarlangSoftware/TurkishSentiNet-Cy',
    license='',
    author='olcaytaner',
    author_email='olcay.yildiz@ozyegin.edu.tr',
    description='Turkish SentiNet'
)

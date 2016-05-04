outlawg
=======================

Description
-----------

Not your grandmother's logging tool.
Simple logging, designed for non-application output.
No timestamping, no component listing with focus on header customization.

[![Build Status](https://travis-ci.org/rpappalax/outlawg.svg?branch=dev)](https://travis-ci.org/rpappalax/outlawg)  [![Build Status](https://badge.fury.io/py/outlawg.svg)](https://badge.fury.io/py/outlawg)


Install
-------

```bash
$ pip install outlawg 
```

or

```bash
$ git clone https://github.com/rpappalax/outlawg.git
$ cd outlawg
$ python setup.py develop
```

Example
-----

[https://github.com/rpappalax/outlawg/blob/master/Examples/output.txt](Example output)

example code: 

```python
from outlawg import Outlawg

out = Outlawg()
out.header('YOUR HEADER')
print('some stuff here')
out.subheader('MY_SUB_HEADER')
print('some stuff here')
out.header('YOUR HEADER', 'XL')
print('some stuff here')
out.header('YOUR HEADER', 'L')
print('some stuff here')
out.header('YOUR HEADER', 'M')
print('some stuff here')
out.header('YOUR HEADER', 'S')
print('some stuff here')
out.header('YOUR HEADER', 'XL', '~')
print('some stuff here')

out.header('YOUR HEADER')
out.subheader('YOUR SUB-HEADER')
print('some stuff here\n\n\n')
out.banner('YOUR BANNER')
print('some stuff here\n\n\n')
```

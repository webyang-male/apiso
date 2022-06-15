---
title: Numpy
category: Python
layout: 2017/sheet
tags: [Featured]
prism_languages: [markdown]
updated: 2021-06-29
intro: | 
        The NumPy library is the core library for scientific computing in Python. 
        It provides a high-performance multidimensional array object, and tools for working with these arrays.
---


### NumPy Arrays

![Arrays](https://img-1253324855.cos.ap-chengdu.myqcloud.com/picgo/numpy.png)

### Creating Arrays

```python
a = np.array([1,2,3])
b = np.array([(1.5,2,3), (4,5,6)], dtype = float)
c = np.array([[(1.5,2,3), (4,5,6)], [(3,2,1), (4,5,6)]], dtype = float)
```

#### Initial Placeholders

```python
np.zeros((3,4)) #Create an array of zeros
np.zeros_like(a) #Create an array of zeros which have the same shape as a
np.ones((2,3,4),dtype=np.int16) # Create an array of ones
d = np.arange(10,25,5) # Create an array of evenly spaced values (step value)
np.linspace(0,2,9) # Create an array of evenly spaced values (number of samples)
e = np.full((2,2),7) # Create a constant array
f = np.eye(2) # Create a 2X2 identity matrix  
np.random.random((2,2)) # Create an array with random values
np.empty((3,2)) # Create an empty array
```

### I/O

#### Saving & Loading On Disk

```py
 np.save('my_array', a)
 np.savez('array.npz', a, b)
 np.load('my_array.npy')
```

#### Saving & Loading Text Files

```py
 np.loadtxt("myfile.txt")
 np.genfromtxt("my_file.csv", delimiter=',')
 np.savetxt("myarray.txt", a, delimiter=" ")
```

## Data Type

```python
np.int64 # Signed 64-bit integer types
np.float32 # Standard double-precision floating point
np.complex # Complex numbers represented by 128 floats
np.bool # Boolean type storing TRUE and FALSE values
np.object # Python object type
np.string_ # Fixed-length string type
np.unicode_ # Fixed-length unicode type
```

### Inspecting Your Array

```python
 a.shape # Array dimensions
 len(a) # Length of array
 b.ndim # Number of array dimensions 
 e.size # Number of array elements
 b.dtype # Data type of array elements
 b.dtype.name # Name of data type
 b.astype(int) # Convert an array to a different type
```

### Asking For Help

```python
np.info(np.ndarray.dtype)
```

## Array Mathematics

### Arithmetic Operations

```py
>>> g = a - b 
    array([[-0.5, 0. , 0. ],[-3. , -3. , -3. ]]) 
>>> np.subtract(a,b)
>>> b + a
    array([[ 2.5, 4. , 6. ],[ 5. , 7. , 9. ]]) 
>>> np.add(b,a)
>>> a / b
    array([[ 0.66666667, 1., 1. ], [0.25 , 0.4 , 0.5 ]])
>>> a * b
    array([[ 1.5, 4. , 9. ],[ 4. , 10. , 18. ]]) 
>>> np.multiply(a,b)
>>> np.divide(a,b)
>>> np.exp(b)
>>> np.sqrt(b)
>>> np.sin(a)
>>> np.cos(b)
>>> np.log(a) # Element-wise natural logarithm
>>> e.dot(f) # Dot product
    array([[ 7., 7.], [ 7., 7.]])
```

### Comparison

```python
>>> a == b # Element-wise comparison
    array([[False, True, True],
            [False, False, False]], dtype=bool) 
>>> a < 2 # lement-wise comparison
    array([True, False, False], dtype=bool) 
>>> np.array_equal(a, b) # Array-wise comparison
```

### Aggregate Functions

```py
a.sum() # Array-wise sum
a.min() # Array-wise minimum value
b.max(axis=0) # Maximum value of an array row
b.cumsum(axis=1) # Cumulative sum of the elements
a.mean() # Mean
b.median() # Median
a.corrcoef() # Correlation coefficient
np.std(b) # Standard deviation
```

## Subsetting, Slicing, Indexing

### Subsetting

```py
a[2] 
b[1,2]
```

### Slicing

```py
>>> a[0:2] 
    array([1, 2])
>>> b[0:2,1] 
    array([ 2., 5.])
>>> b[:1] 
    array([[1.5, 2., 3.]])
>>> c[1,...] 
    array([[[3., 2., 1.],
            [4., 5., 6.]]])
>>> a[ : :-1] 
    array([3, 2, 1])
```

### Boolean Indexing

```py
>>> a[a<2] 
    array([1])
```

### Fancy Indexing

```py
>>> b[[1, 0, 1, 0],[0, 1, 2, 0]] 
    array([4.,2.,6.,1.5])
>>> b[[1, 0, 1, 0]][:,[0,1,2,0]]
    array([[4.,5.,6.,4.], 
            [1.5,2.,3.,1.5], 
            [4.,5.,6.,4.],
            [1.5,2.,3.,1.5]])
```

## Array Manipulation
 
### Copying Arrays

```py
>>> h = a.view() # Create a view of the array with the same data
>>> np.copy(a) # Create a copy of the array
>>> h = a.copy() # Create a deep copy of the array
```

### Sorting Arrays

```py
>>> a.sort() # Sort an array
>>> c.sort(axis=0) # Sort the elements of an array's axis
```

### Transposing Array

```py
>>> i = np.transpose(b)
>>> i.T
```

### Changing Array Shape

```py
>>> b.ravel() Flatten the array
>>> g.reshape(3,-2)
```

### Adding/Removing Elements

```py
>>> h.resize((2,6))
>>> np.append(h,g)
>>> np.insert(a, 1, 5)
>>> np.delete(a,[1])
```

### Combining Arrays

```py
>>> np.concatenate((a,d),axis=0) 
    array([ 1, 2, 3, 10, 15, 20])
>>> np.vstack((a,b)) 
    array([[ 1. , 2. , 3. ], 
            [ 1.5, 2. , 3. ],
            [4. , 5. , 6. ]])
>>> np.r_[e,f]
>>> np.hstack((e,f)) 
    array([[ 7., 7., 1., 0.],
        [ 7., 7., 0., 1.]]) 
>>> np.column_stack((a,d))
    array([[ 1, 10], 
        [ 2, 15],
        [ 3, 20]])
>>> np.c_[a,d]
```

### Splitting Arrays

```py
>>> np.hsplit(a,3) 
    [array([1]),array([2]),array([3])]
>>> h = a.view()
>>> np.copy(a)
>>> h = a.copy()
>>> np.vsplit(c,2) 
    [array([[[ 1.5, 2. , 1. ],
            [ 4. , 5. , 6. ]]]), 
    array([[[ 3., 2., 3.],
            [ 4., 5., 6.]]])]
```

## Refercence

{: .-two-column}

 * [DataCamp NumPy](https://s3.amazonaws.com/assets.datacamp.com/blog_assets/Numpy_Python_Cheat_Sheet.pdf)
 * [A Little Bit of Everything](https://blog.finxter.com/wp-content/uploads/2019/10/grafik-2-768x592.png)
 * [numpy.org](https://numpy.org/install/)
{: .-also-see}

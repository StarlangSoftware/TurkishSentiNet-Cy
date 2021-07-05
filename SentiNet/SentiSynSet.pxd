cdef class SentiSynSet(object):

    cdef str __id
    cdef float __positiveScore, __negativeScore

    cpdef float getPositiveScore(self)
    cpdef float getNegativeScore(self)
    cpdef str getId(self)
    cpdef object getPolarity(self)
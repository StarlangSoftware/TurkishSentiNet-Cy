cdef class SentiLiteral(object):

    cdef str __name
    cdef float __positiveScore, __negativeScore

    cpdef float getPositiveScore(self)
    cpdef float getNegativeScore(self)
    cpdef str getName(self)
    cpdef object getPolarity(self)
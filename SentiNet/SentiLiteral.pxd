cdef class SentiLiteral(object):

    cdef str __name
    cdef float __positive_score, __negative_score

    cpdef float getPositiveScore(self)
    cpdef float getNegativeScore(self)
    cpdef str getName(self)
    cpdef object getPolarity(self)
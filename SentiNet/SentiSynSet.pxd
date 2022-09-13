cdef class SentiSynSet(object):

    cdef str __id
    cdef float __positive_score, __negative_score

    cpdef float getPositiveScore(self)
    cpdef float getNegativeScore(self)
    cpdef str getId(self)
    cpdef object getPolarity(self)
from SentiNet.SentiLiteral cimport SentiLiteral

cdef class SentiLiteralNet(object):

    cdef dict __sentiLiteralList

    cpdef SentiLiteral getSentiLiteral(self, str _name)
    cpdef list getPolarity(self, object polarityType)
    cpdef list getPositives(self)
    cpdef list getNegatives(self)
    cpdef list getNeutrals(self)

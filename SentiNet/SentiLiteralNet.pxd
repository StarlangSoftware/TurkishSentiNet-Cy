from SentiNet.SentiLiteral cimport SentiLiteral

cdef class SentiLiteralNet(object):

    cdef dict __senti_literal_list

    cpdef SentiLiteral getSentiLiteral(self, str _name)
    cpdef list getPolarity(self, object polarityType)
    cpdef list getPositives(self)
    cpdef list getNegatives(self)
    cpdef list getNeutrals(self)

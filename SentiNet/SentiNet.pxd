from SentiNet.SentiSynSet cimport SentiSynSet

cdef class SentiNet(object):

    cdef dict __senti_synset_list

    cpdef SentiSynSet getSentiSynSet(self, str _id)
    cpdef addSentiSynSet(self, SentiSynSet sentiSynSet)
    cpdef removeSentiSynSet(self, SentiSynSet sentiSynSet)
    cpdef list getPolarity(self, object polarityType)
    cpdef list getPositives(self)
    cpdef list getNegatives(self)
    cpdef list getNeutrals(self)
    cpdef saveAsXml(self, str fileName)

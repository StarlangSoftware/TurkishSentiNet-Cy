import pkg_resources
from SentiNet.SentiLiteral cimport SentiLiteral
from SentiNet.PolarityType import PolarityType
import xml.etree.ElementTree


cdef class SentiLiteralNet(object):

    cdef dict __sentiLiteralList

    def __init__(self, fileName=None):
        """
        Constructor of Turkish SentiNet. Reads the turkish_sentinet.xml file from the resources directory. For each
        sentiSynSet read, it adds it to the sentiSynSetList.
        """
        cdef float positiveScore, negativeScore
        cdef str _name
        self.__sentiLiteralList = {}
        if fileName is None:
            fileName = pkg_resources.resource_filename(__name__, 'data/turkish_sentiliteralnet.xml')
        root = xml.etree.ElementTree.parse(fileName).getroot()
        for sentiLiteral in root:
            _name = ""
            positiveScore = 0.0
            negativeScore = 0.0
            for part in sentiLiteral:
                if part.tag == "NAME":
                    _name = part.text
                else:
                    if part.tag == "PSCORE":
                        positiveScore = float(part.text)
                    else:
                        negativeScore = float(part.text)
            if _name != "":
                self.__sentiLiteralList[_name] = SentiLiteral(_name, positiveScore, negativeScore)

    cpdef SentiLiteral getSentiLiteral(self, str _name):
        """
        Accessor for a single SentiLiteral.

        PARAMETERS
        ----------
        _name : str
            Id of the searched SentiLiteral.

        RETURNS
        -------
        SentiLiteral
            SentiLiteral with the given name.
        """
        return self.__sentiLiteralList[_name]

    cpdef list getPolarity(self, object polarityType):
        """
        Constructs and returns a list of ids, which are the ids of the SentiSynSets having polarity
        polarityType.

        PARAMETERS
        ----------
        polarityType : PolarityType.pxd
            PolarityTypes of the searched SentiSynSets

        RETURNS
        -------
        list
            A list of id having polarityType polarityType.
        """
        cdef list result
        cdef SentiLiteral sentiLiteral
        result = []
        for sentiLiteral in self.__sentiLiteralList.values():
            if sentiLiteral.getPolarity() == polarityType:
                result.append(sentiLiteral.getName())
        return result

    cpdef list getPositives(self):
        """
        Returns the ids of all positive SentiSynSets.

        RETURNS
        -------
        list
            A list of ids of all positive SentiSynSets.
        """
        return self.getPolarity(PolarityType.POSITIVE)

    cpdef list getNegatives(self):
        """
        Returns the ids of all negative SentiSynSets.

        RETURNS
        -------
        list
            A list of ids of all negative SentiSynSets.
        """
        return self.getPolarity(PolarityType.NEGATIVE)

    cpdef list getNeutrals(self):
        """
        Returns the ids of all neutral SentiSynSets.

        RETURNS
        -------
        list
            A list of ids of all neutral SentiSynSets.
        """
        return self.getPolarity(PolarityType.NEUTRAL)


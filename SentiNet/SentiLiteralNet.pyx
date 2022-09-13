import pkg_resources
from SentiNet.PolarityType import PolarityType
import xml.etree.ElementTree


cdef class SentiLiteralNet(object):

    def __init__(self, file_name=None):
        """
        Constructor of Turkish SentiNet. Reads the turkish_sentinet.xml file from the resources directory. For each
        sentiSynSet read, it adds it to the sentiSynSetList.
        """
        cdef float positive_score, negative_score
        cdef str _name
        self.__senti_literal_list = {}
        if file_name is None:
            file_name = pkg_resources.resource_filename(__name__, 'data/turkish_sentiliteralnet.xml')
        root = xml.etree.ElementTree.parse(file_name).getroot()
        for senti_literal in root:
            _name = ""
            positive_score = 0.0
            negative_score = 0.0
            for part in senti_literal:
                if part.tag == "NAME":
                    _name = part.text
                else:
                    if part.tag == "PSCORE":
                        positive_score = float(part.text)
                    else:
                        negative_score = float(part.text)
            if _name != "":
                self.__senti_literal_list[_name] = SentiLiteral(_name,
                                                                positive_score,
                                                                negative_score)

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
        return self.__senti_literal_list[_name]

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
        cdef SentiLiteral senti_literal
        result = []
        for senti_literal in self.__senti_literal_list.values():
            if senti_literal.getPolarity() == polarityType:
                result.append(senti_literal.getName())
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

    def __repr__(self):
        return f"{self.__senti_literal_list}"

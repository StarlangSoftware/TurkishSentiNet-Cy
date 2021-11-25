import pkg_resources
from SentiNet.SentiSynSet cimport SentiSynSet
from SentiNet.PolarityType import PolarityType
import xml.etree.ElementTree


cdef class SentiNet(object):

    cdef dict __sentiSynSetList

    def __init__(self, fileName=None):
        """
        Constructor of Turkish SentiNet. Reads the turkish_sentinet.xml file from the resources directory. For each
        sentiSynSet read, it adds it to the sentiSynSetList.
        """
        cdef float positiveScore, negativeScore
        cdef str _id
        self.__sentiSynSetList = {}
        if fileName is None:
            fileName = pkg_resources.resource_filename(__name__, 'data/turkish_sentinet.xml')
        root = xml.etree.ElementTree.parse(fileName).getroot()
        for sentiSynSet in root:
            _id = ""
            positiveScore = 0.0
            negativeScore = 0.0
            for part in sentiSynSet:
                if part.tag == "ID":
                    _id = part.text
                else:
                    if part.tag == "PSCORE":
                        positiveScore = float(part.text)
                    else:
                        negativeScore = float(part.text)
            if _id != "":
                self.__sentiSynSetList[_id] = SentiSynSet(_id, positiveScore, negativeScore)

    cpdef SentiSynSet getSentiSynSet(self, str _id):
        """
        Accessor for a single SentiSynSet.

        PARAMETERS
        ----------
        _id : str
            Id of the searched SentiSynSet.

        RETURNS
        -------
        SentiSynSet
            SentiSynSet with the given id.
        """
        return self.__sentiSynSetList[_id]

    cpdef addSentiSynSet(self, SentiSynSet sentiSynSet):
        """
        Adds specified SentiSynSet to the SentiSynSet list.

        PARAMETERS
        ----------
        sentiSynSet : SentiSynSet
            SentiSynSet to be added
        """
        self.__sentiSynSetList[sentiSynSet.getId()] = sentiSynSet

    cpdef removeSentiSynSet(self, SentiSynSet sentiSynSet):
        """
        Removes specified SentiSynSet from the SentiSynSet list.

        PARAMETERS
        ----------
        sentiSynSet : SentiSynSet
            SentiSynSet to be removed
        """
        del self.__sentiSynSetList[sentiSynSet.getId()]

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
        cdef SentiSynSet sentiSynSet
        result = []
        for sentiSynSet in self.__sentiSynSetList.values():
            if sentiSynSet.getPolarity() == polarityType:
                result.append(sentiSynSet.getId())
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

    cpdef saveAsXml(self, str fileName):
        """
        Method to write SynSets to the specified file in the XML format.

        PARAMETERS
        ----------
        fileName : str
            file name to write XML files
        """
        cdef SentiSynSet synSet
        outfile = open(fileName, 'w', encoding='utf8')
        outfile.write("<SYNSETS>\n")
        for synSet in self.__sentiSynSetList.values():
            synSet.saveAsXml(outfile)
        outfile.write("</SYNSETS>\n")
        outfile.close()

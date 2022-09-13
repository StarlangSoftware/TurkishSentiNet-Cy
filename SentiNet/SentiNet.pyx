import pkg_resources
from SentiNet.PolarityType import PolarityType
import xml.etree.ElementTree


cdef class SentiNet(object):

    def __init__(self, file_name=None):
        """
        Constructor of Turkish SentiNet. Reads the turkish_sentinet.xml file from the resources directory. For each
        sentiSynSet read, it adds it to the sentiSynSetList.
        """
        cdef float positive_score, negative_score
        cdef str _id
        self.__senti_synset_list = {}
        if file_name is None:
            file_name = pkg_resources.resource_filename(__name__, 'data/turkish_sentinet.xml')
        root = xml.etree.ElementTree.parse(file_name).getroot()
        for senti_synset in root:
            _id = ""
            positive_score = 0.0
            negative_score = 0.0
            for part in senti_synset:
                if part.tag == "ID":
                    _id = part.text
                else:
                    if part.tag == "PSCORE":
                        positive_score = float(part.text)
                    else:
                        negative_score = float(part.text)
            if _id != "":
                self.__senti_synset_list[_id] = SentiSynSet(_id, positive_score, negative_score)

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
        return self.__senti_synset_list[_id]

    cpdef addSentiSynSet(self, SentiSynSet senti_synset):
        """
        Adds specified SentiSynSet to the SentiSynSet list.

        PARAMETERS
        ----------
        senti_synset : SentiSynSet
            SentiSynSet to be added
        """
        self.__senti_synset_list[senti_synset.getId()] = senti_synset

    cpdef removeSentiSynSet(self, SentiSynSet senti_synset):
        """
        Removes specified SentiSynSet from the SentiSynSet list.

        PARAMETERS
        ----------
        senti_synset : SentiSynSet
            SentiSynSet to be removed
        """
        del self.__senti_synset_list[senti_synset.getId()]

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
        cdef SentiSynSet senti_synset
        result = []
        for senti_synset in self.__senti_synset_list.values():
            if senti_synset.getPolarity() == polarityType:
                result.append(senti_synset.getId())
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

    cpdef saveAsXml(self, str file_name):
        """
        Method to write SynSets to the specified file in the XML format.

        PARAMETERS
        ----------
        file_name : str
            file name to write XML files
        """
        cdef SentiSynSet synSet
        outfile = open(file_name, 'w', encoding='utf8')
        outfile.write("<SYNSETS>\n")
        for synSet in self.__senti_synset_list.values():
            synSet.saveAsXml(outfile)
        outfile.write("</SYNSETS>\n")
        outfile.close()

    def __repr__(self):
        return f"{self.__senti_synset_list}"

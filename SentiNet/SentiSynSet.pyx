from SentiNet.PolarityType import PolarityType


cdef class SentiSynSet(object):

    def __init__(self, _id: str, positiveScore: float, negativeScore: float):
        """
        Constructor of SentiSynSet. Gets input id, positiveScore, negativeScore and sets all corresponding attributes.

        PARAMETERS
        ----------
        _id : str
            Id of the SentiSynSet.
        positiveScore : float
            Positive score of the SentiSynSet.
        negativeScore : float
            Negative score of the SentiSynSet.
        """
        self.__id = _id
        self.__positiveScore = positiveScore
        self.__negativeScore = negativeScore

    cpdef float getPositiveScore(self):
        """
        Accessor for the positiveScore attribute.

        RETURNS
        -------
        float
            PositiveScore of the SentiSynSet.
        """
        return self.__positiveScore

    cpdef float getNegativeScore(self):
        """
        Accessor for the negativeScore attribute.

        RETURNS
        -------
        float
            NegativeScore of the SentiSynSet.
        """
        return self.__negativeScore

    cpdef str getId(self):
        """
        Accessor for the id attribute.

        RETURNS
        -------
        str
            Id of the SentiSynSet.
        """
        return self.__id

    cpdef object getPolarity(self):
        """
        Returns the polarityType of the sentiSynSet. If the positive score is larger than the negative score, the
        polarity is positive; if the negative score is larger than the positive score, the polarity is negative; if
        both positive score and negative score are equal, the polarity is neutral.

        RETURNS
        -------
        PolarityType.pxd
            PolarityType of the sentiSynSet.
        """
        if self.__positiveScore > self.__negativeScore:
            return PolarityType.POSITIVE
        else:
            if self.__positiveScore < self.__negativeScore:
                return PolarityType.NEGATIVE
            else:
                return PolarityType.NEUTRAL

    def saveAsXml(self, outfile):
        """
        Method to write SynSets to the specified file in the XML format.

        PARAMETERS
        ----------
        outfile : file
            File to write XML files
        """
        outfile.write("<SYNSET>")
        outfile.write("<ID>" + self.__id + "</ID>")
        outfile.write("<PSCORE>" + self.__positiveScore.__str__() + "</PSCORE>")
        outfile.write("<NSCORE>" + self.__negativeScore.__str__() + "</NSCORE>")
        outfile.write("</SYNSET>\n")

from SentiNet.PolarityType import PolarityType


cdef class SentiLiteral(object):

    def __init__(self, _name: str, positiveScore: float, negativeScore: float):
        """
        Constructor of SentiSynSet. Gets input id, positiveScore, negativeScore and sets all corresponding attributes.

        PARAMETERS
        ----------
        _name : str
            Id of the SentiLiteral.
        positiveScore : float
            Positive score of the SentiLiteral.
        negativeScore : float
            Negative score of the SentiLiteral.
        """
        self.__name = _name
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

    cpdef str getName(self):
        """
        Accessor for the id attribute.

        RETURNS
        -------
        str
            Id of the SentiSynSet.
        """
        return self.__name

    cpdef object getPolarity(self):
        """
        Returns the polarityType of the sentiLiteral. If the positive score is larger than the negative score, the
        polarity is positive; if the negative score is larger than the positive score, the polarity is negative; if
        both positive score and negative score are equal, the polarity is neutral.

        RETURNS
        -------
        PolarityType.pxd
            PolarityType of the sentiLiteral.
        """
        if self.__positiveScore > self.__negativeScore:
            return PolarityType.POSITIVE
        else:
            if self.__positiveScore < self.__negativeScore:
                return PolarityType.NEGATIVE
            else:
                return PolarityType.NEUTRAL


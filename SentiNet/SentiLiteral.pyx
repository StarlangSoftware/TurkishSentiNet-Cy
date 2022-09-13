from SentiNet.PolarityType import PolarityType


cdef class SentiLiteral(object):

    def __init__(self, _name: str,
                 positive_score: float,
                 negative_score: float):
        """
        Constructor of SentiSynSet. Gets input id, positiveScore, negativeScore and sets all corresponding attributes.

        PARAMETERS
        ----------
        _name : str
            Id of the SentiLiteral.
        positive_score : float
            Positive score of the SentiLiteral.
        negative_score : float
            Negative score of the SentiLiteral.
        """
        self.__name = _name
        self.__positive_score = positive_score
        self.__negative_score = negative_score

    cpdef float getPositiveScore(self):
        """
        Accessor for the positiveScore attribute.

        RETURNS
        -------
        float
            PositiveScore of the SentiSynSet.
        """
        return self.__positive_score

    cpdef float getNegativeScore(self):
        """
        Accessor for the negativeScore attribute.

        RETURNS
        -------
        float
            NegativeScore of the SentiSynSet.
        """
        return self.__negative_score

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
        if self.__positive_score > self.__negative_score:
            return PolarityType.POSITIVE
        else:
            if self.__positive_score < self.__negative_score:
                return PolarityType.NEGATIVE
            else:
                return PolarityType.NEUTRAL

    def __repr__(self):
        return f"{self.__name} {self.__positive_score} {self.__negative_score}"

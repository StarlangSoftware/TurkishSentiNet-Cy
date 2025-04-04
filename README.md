Turkish Sentiment Lexicon (HisNet)
============

# Polarity Lexicons

Exploiting a dictionary-based method necessitates the construction of a specific polarity dictionary in the same language as the data-to-be-analyzed. The reason behind this necessity stems from the improbability of creating a universal polarity dictionary due to both grammatical and cultural asymmetries between languages. For instance, a certain historical event can have positive connotations in one culture and negative connotations in another culture. Thus, it is an essential step to create a language specific polarity dictionary.

The first examples of polarity dictionary work could be found in English. SentiWordNet 1.0, the very first study on English polarity dictionaries, was presented by Esuli and Sebastiani (2006). Considerable research has been conducted to improve these resources with the aim of making them more precise. For example, the polarities of the objective words in SentiWordNet have been reassessed by Hung and Lini (2010). SenticNet (Cambria et al., 2014), another well-known dictionary in English, is created by rescoring words based on five different criteria, which are happiness, attention, sensitivity, ability and general polarity. Thus, it is evident that SenticNet is a polarity dictionary that provides a more extensive emotional evaluation than SentiWordNet.

There are polar dictionaries created in major languages other than English. However, these dictionaries were found to be insufficient in terms of the number of words. Brooke et al. (2009) aimed to translate English polarity sources to Spanish. At first, the methods established independent from the target language were found adequate, yet in the long term it was noticed that these methods were costly and inaccurate. Employing language-dependent resources to improve this system was deemed more feasible. Remus et al. (2010) have created a German sensitivity dictionary named SentiWortschatz for the German language. For the purpose of creating a feeling dictionary, over 3500 German words were assigned positive and nega- tive values in the range of [-1, 1], using PosTags. Abdaoui et al. (2017) have created the FEEL: a French Expanded Emotion Lexicon polarity dictionary for French. Moreno-Sandoval et al. (2017) have created the Combined Spanish Lexicon polarity dictionary for Spanish.

# Turkish Polarity Lexicon HisNet

In this study, we present a polarity dictionary to provide an extensive polarity dictionary for Turkish that dictionary-based sentiment analysis studies have been longing for. Our primary objective is to provide a more refined and extensive polarity dictionary than the previous SentiTurkNet. In doing so, we have resorted to a different network from the referenced study. We have identified approximately 76,825 synsets from Kenet, which then were manually labeled as positive, negative or neutral by three native speakers of Turkish. The first labelling process resulted in 3,100 positive, 10,191 negative and 63,534 neutral data, during which decisions were based on the meaning and connotation of each word. 

Subsequently, a second labeling was further made on positive and negative words as strong or weak based on their degree of positivity or negativity. For instance, the word mükemmel (excellent) in Turkish has been marked three times. Thus, three different views were obtained for the value of this word. While selecting the appropriate label, the compatibility of the labels selected by the three labelers was also evaluated. To put it differently, if a positive word receives strong label from all three annotators, it is regarded as strong positive. If it receives two strong and one weak label, it is considered as very positive. If it is la- belled as strong once and as weak twice, it means it is just positive. Finally, if it receives weak label from all three annotators, it is considered as weak positive. The same is also true for the words labelled as negative.

|Polarity Level|# of Synsets|
|---|---|
|Strongly positive|1,038|
|Very positive|451|
|Positive|456|
|Weakly positive|1,234|
|Objective|63,534|
|Strongly negative|4,430|
|Very negative|1,465|
|Negative|1,238|
|Weakly negative|3,360|

Video Lectures
============

[<img src="https://github.com/StarlangSoftware/TurkishSentiNet/blob/master/video1.jpg" width="50%">](https://youtu.be/CdHSwgq2lTE)[<img src="https://github.com/StarlangSoftware/TurkishSentiNet/blob/master/video2.jpg" width="50%">](https://youtu.be/_tbrvPlG87Y)[<img src="https://github.com/StarlangSoftware/TurkishSentiNet/blob/master/video3.jpg" width="50%">](https://youtu.be/CUbNz34Ac5c)

For Developers
============

You can also see [Python](https://github.com/starlangsoftware/TurkishSentiNet-Py), [Java](https://github.com/starlangsoftware/TurkishSentiNet), [C](https://github.com/starlangsoftware/TurkishSentiNet-C), [C++](https://github.com/starlangsoftware/TurkishSentiNet-CPP), [Swift](https://github.com/starlangsoftware/TurkishSentiNet-Swift), [Js](https://github.com/starlangsoftware/TurkishSentiNet-Js), [Php](https://github.com/starlangsoftware/TurkishSentiNet-Php), or [C#](https://github.com/starlangsoftware/TurkishSentiNet-CS) repository.

## Requirements

* [Python 3.7 or higher](#python)
* [Git](#git)

### Python 

To check if you have a compatible version of Python installed, use the following command:

    python -V
    
You can find the latest version of Python [here](https://www.python.org/downloads/).

### Git

Install the [latest version of Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

## Pip Install

	pip3 install NlpToolkit-SentiNet-Cy
	
## Download Code

In order to work on code, create a fork from GitHub page. 
Use Git for cloning the code to your local or below line for Ubuntu:

	git clone <your-fork-git-link>

A directory called SentiNet will be created. Or you can use below link for exploring the code:

	git clone https://github.com/starlangsoftware/TurkishSentiNet-Cy.git

## Open project with Pycharm IDE

Steps for opening the cloned project:

* Start IDE
* Select **File | Open** from main menu
* Choose `TurkishSentiNet-CY` file
* Select open as project option
* Couple of seconds, dependencies will be downloaded. 

Detailed Description
============

+ [SentiNet](#sentinet)
+ [SentiSynSet](#sentisynset)

## SentiNet

Duygu sözlüğünü yüklemek için

	a = SentiNet()

Belirli bir alana ait duygu sözlüğünü yüklemek için

	SentiNet(fileName: str)
	a = SentiNet("dosya.txt")

Belirli bir synsete ait duygu synsetini elde etmek için

	getSentiSynSet(self, _id: str) -> SentiSynSet

## SentiSynSet

Bir SentiSynset elimizdeyken onun pozitif skorunu

	getPositiveScore(self) -> float

negatif skorunu

	getNegativeScore(self) -> float

polaritysini

	getPolarity(self) -> PolarityType

# Cite

	@inproceedings{ozcelik21,
 	title={{H}is{N}et: {A} {P}olarity {L}exicon based on {W}ord{N}et for {E}motion {A}nalysis},
 	year={2021},
 	author={M. Ozcelik and B. N. Arican and O. Bakay and E. Sarmis and N. B. Bayazit and O. Ergelen and O. T. Y{\i}ld{\i}z},
 	booktitle={Proceedings of GWC 2021}
 	}

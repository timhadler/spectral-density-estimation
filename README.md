A common application of non-parametric spectral density estimation is electroencephalogram (EEG) processing. The spectrum of an EEG signal carries a significant amount of information about 
the brain activity of a patient. Some of this can be found from the power of the frequency components in the signal. The frequency range of an EEG signal is often 
split into frequency bands or wave patterns. For instance high power in the gamma frequency band is thought to be linked to epileptic patients. 
By applying a spectral density estimation technique, information about a patient’s 
brain activity can be analyzed by looking at the power of the frequency components in each wave pattern. This information can then be used to get an idea of how the 
patient’s brain is behaving, and whether to diagnose them with epilepsy. 

This project investigates how non-parametric spectral density estimates can be used to diagnose patients with epilepsy. 

Once the spectral density of an EEG signal has been found, it can be classified using an algorithm such as a k-nearest neighbours algorithm (KNN). 
KNN is a type of neural network that can be trained to extract relevant features from a dataset to classify it. The technique used is called supervised training, where 
the model is first trained by passing sets of data that the correct category is known and adjusting weights within the model to minimize the prediction error. Once the model 
has been trained, it can be tested on more datasets to assess its ability to correctly classify datasets it has not ‘seen’ before. The accuracy of the KNN classification will depend on the estimator's ability to extract 
useful information from the raw EEG data. 

![PSD Estimates](https://user-images.githubusercontent.com/41405980/141661889-2a8effdd-9123-4acb-ae22-d7911efba746.PNG)
![Welchs method](https://user-images.githubusercontent.com/41405980/141661890-73e66bb1-c9f6-4667-a024-0e98eff0bbe4.PNG)
![acc table](https://user-images.githubusercontent.com/41405980/141661893-94df67bc-5866-4fb0-8dd5-94f9931d0078.PNG)

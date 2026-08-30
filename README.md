# Interpretable Singing Emotion Recognition 

## Overview

We propose an interpretable Singing Emotion Recognition (SER) framework combining domain-specific descriptors spanning prosodic, spectral, phonetic, and learned vocal technique features. Using a nested Leave-One-Speaker-Out (LOSO) feature selection strategy paired with SHAP and Grad-CAM analyses, we demonstrate that incorporating explicit singing descriptors (such as vibrato) improves cross-speaker stability and provides acoustically coherent explanations for emotional expression in singing performances.

## Repository Contents
```
├── notebooks_&scripts/
│   ├── Feature_Extraction.ipynb     # Pipeline for preprocessing and feature extraction
│   ├── run_mfa.bash                 # Automated script for Montreal Forced Aligner (MFA)
│   └── Results_and_Visuals.ipynb    # Nested LOSO feature selection, SHAP and Grad-CAM explainability, and performance evaluation
├── models/
│   └── model_pitch_leaky (1).h5     # Pre-trained Dual-Input CNN for vocal technique extraction
├── supplementary/
│   ├── cmudict.dict                 # CMU Pronouncing Dictionary for phonetic processing
│   └── proposed_framework.png       # Framework architecture overview
└── README.md
```

### Notebooks & Scripts

#### 1. `Feature_Extraction.ipynb`
Comprehensive feature extraction pipeline for singing audio:

**Acoustic Features Extracted:**
- **Pitch Analysis**: F0 contours, pitch statistics, variability
- **Spectral Features**: Spectral centroid, spectral flatness, HNR, Formant frequencies, Alpha ratio etc.
- **Loudness & Energy**: energy dynamics, loudness variations, loudness peaks/sec
- **Singing Features**: Vocal Technique Detection, Vocal Register Detection
- **Phonetic Features**: CMU Dictionary-based phoneme analysis, articulation rates, phoneme and pause ratios.

#### 2. `Results_and_Visuals.ipynb`
Comprehensive analysis, evaluation, and interpretation of results:

**Content:**
- Leave-One-Speaker-Out (LOSO) evaluation methodology
- Feature group definitions (prosodic, spectral, phonemic, techniques)
- Model training and cross-validation
- Feature Selection pipeline (Nested LOSO)
- SHAP explainability analysis to understand feature importance
- Confusion matrices and classification reports
- Visualization of emotion distributions and feature patterns
- Cross-corpus performance comparison
- Grad-cam analysis to validate learned vocal technique features

#### 3. `run_mfa.bash`
- Montreal Forced Aligner (MFA) automation script
- Provides phonetic timing information
- Enables detailed phonetic feature extraction

### Access to Data & Models

To reproduce the feature extraction and experiments, download the datasets directly from their official sources:

- **RAVDESS (Singing Subset):** Download from [Zenodo (RAVDESS)]().
- **GTSinger:** Access via
- **VocalSet:**: Download from []()

- **`model_pitch_leaky (1).h5`** - Pre-trained CNN model
  - Architecture: Dual-input architecture with late fusion
  - Purpose: Output presence of vocal techniques 
  - Input: Mel-spectrograms and pitch contours

- **`cmudict.dict`** - CMU Pronouncing Dictionary
  - Contains phonetic transcriptions for 130K+ English words
  - Used for phoneme-alignment
 
### **Tools & Libraries:**
- CREPE for accurate pitch tracking
- OpenSMILE v2.6 (eGeMAPSv02) for acoustic feature extraction
- Librosa for audio processing and extracting features.
- TensorFlow (for the CNN)
- scikit-learn, SHAP, etc.

### **Summary of key findings & Figures**

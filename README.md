# Interpretable Singing Emotion Recognition 

## Overview

This repository contains the research and implementation code for a **singing emotion recognition (SER) study** with a focus on **interpretability and explainability**. The project combines deep learning for mid-level feature extraction, handcrafted acoustic descriptors (eGeMAPS etc.) with interpretable machine learning classifiers to understand what acoustic and performative characteristics distinguish different emotions in singing.

## Project Goals

1. **Extract interpretable mid-level features** from singing audio using CNNs (vocal techniques, expressive patterns)
2. **Develop robust feature selection** through nested Leave-One-Speaker-Out (LOSO) cross-validation
3. **Identify emotion-specific characteristics** using interpretable classifiers (Random Forest + SHAP)
4. **Test generalization** by testing optimized feature sets across multiple singing datasets

## Key Innovation: Nested LOSO Feature Selection

Traditional feature selection can lead to overfitting on a single dataset. This project proposes a **nested Leave-One-Speaker-Out (LOSO)** approach:

- **Outer LOSO loop**: Ensures speaker-independent generalization (speaker as test group)
- **Inner LOSO loop**: Performs feature selection within training data only
- This process is repeated for all speakers and the most frequent features across all folds are retained.
- From more complex datasets such as GTSinger the mean_importance of these features is examined along the frequency.
- **Cross-corpus validation**: Optimal feature sets are tested across all available singing datasets 
- **Result**: Robust, generalizable feature sets that work across different singers and domains

## Repository Contents

### Notebooks

#### 1. `Feature_Extraction.ipynb`
Comprehensive feature extraction pipeline for singing audio:

**Acoustic Features Extracted:**
- **Pitch Analysis**: F0 contours, pitch statistics, variability
- **Spectral Features**: Spectral centroids, spectral flatness, HNR, Alpha ratio etc.
- **Loudness & Energy**: RMS energy, energy dynamics, loudness variations
- **Singing Features**: Vibrato patterns, Glissando detection, Vocal Register Detection etc.
- **Phonetic Features**: CMU Dictionary-based phoneme analysis, articulation rates, phoneme and pause ratios.

**Pitch-Specific Features:**
- Modulation Frequency Domain Ratios (MFDR) - captures vibrato and micro-modulations in different frequency bands (0.5-3Hz, 4-8Hz, 8-20Hz)
- Delta pitch statistics
- Proxy for DETT (Deviation from target tone) using nearest semitone value.

**Tools & Libraries:**
- CREPE for accurate pitch tracking
- OpenSMILE v2.6 (eGeMAPSv02) for acoustic feature extraction
- Librosa for audio processing and extracting extra low-level features.
- TensorFlow/Keras (for the h5 model)
- scikit-learn, SHAP, etc. 

#### 2. `Results_and_Visuals.ipynb`
Comprehensive analysis, evaluation, and interpretation of results:

**Content:**
- Leave-One-Speaker-Out (LOSO) evaluation methodology
- Feature group definitions (prosodic, spectral, phonemic, techniques)
- Model training and cross-validation
- Feature Selection pipeline
- SHAP explainability analysis to understand feature importance
- Confusion matrices and classification reports
- Visualization of emotion distributions and feature patterns
- Cross-corpus generalization results

**Key Analysis:**
- Per-speaker metrics
- Feature rankings via SHAP 
- Emotion-feature relationship visualization

### Data & Models

- **`model_pitch_leaky (1).h5`** - Pre-trained CNN model
  - Architecture: Dual-input architecture with late fusion
  - Purpose: Output presence of vocal techniques - expressivity patterns
  - Input: Mel-spectrograms and pitch contours

- **`cmudict.dict`** - CMU Pronouncing Dictionary
  - Contains phonetic transcriptions for 130K+ English words
  - Used for phoneme-alignment

- **`run_mfa.bash`** - Montreal Forced Aligner (MFA) automation script
  - Performs automatic audio-to-phoneme alignment
  - Provides precise phonetic timing information
  - Enables detailed phonetic feature extraction

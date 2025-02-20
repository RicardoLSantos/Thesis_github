# Improving Healthcare Quality with a LHS: HL7 FHIR® Implementation Guide

## Authors
- Ricardo L. SANTOS¹
- Ricardo CRUZ-CORREIA²

¹PhD student Health Data Science, Faculdade de Medicina da Universidade do Porto  
²Associate Professor, Faculdade de Medicina da Universidade do Porto

**ORCiD ID:**  
Ricardo L. Santos: [0000-0001-6017-8255](https://orcid.org/0000-0001-6017-8255)  
Ricardo Cruz-Correia: [0000-0002-3764-5158](https://orcid.org/0000-0002-3764-5158)

## Abstract
This article describes the development of an Implementation Guide (IG) using HL7 FHIR® Shorthand (FSH) and SUSHI to enhance interoperability and data quality in a Learning Health System (LHS) focused on Lifestyle Medicine (LM) and based on Patient-Generated Health Data (PGHD). The IG standardizes data from wearables and health applications across nine key health domains: vital signs, physical activity, sleep, mindfulness, body measurements, nutrition, environmental factors, reproductive health, and social interactions.

**Keywords:** Interoperability, HL7 FHIR®, Shorthand, SUSHI, Lifestyle Medicine, Learning Health System, Patient-Generated Health Data.

## 1. Introduction and objectives
The growing availability of PGHD from wearable devices and mobile applications offers unprecedented opportunities to improve healthcare quality, particularly in LM interventions. While these data could inform evidence-based lifestyle modifications, their integration into clinical systems, like LHS, faces significant interoperability challenges due to format diversity and lack of standardization [1] [2]. This work presents an IG using open-sourced tools HL7 FHIR® Shorthand (FSH) and SUSHI to standardize PGHD integration into a LHS, with specific focus on LM applications. The IG provides detailed specifications for nine health domains essential for LM interventions [3] [4].

## 2. Methodology
### Health Domains and Data Requirements
We identified nine key health domains for LM:
- Vital Signs: Basic and advanced physiological measurements
- Physical Activity: Movement patterns and exercise data
- Sleep: Duration, quality, and physiological measurements
- Mindfulness & Mental Health: Practice sessions and mood tracking
- Body Measurements: Anthropometric and composition data
- Nutrition: Dietary intake and hydration
- Environmental Factors: Exposure to environmental elements
- Reproductive Health: Cycle tracking and symptoms
- Social & Behavioral: Interaction patterns and support networks

### Technical Implementation
For each domain, we developed custom FHIR profiles using FSH, which includes base observations with extended components for comprehensive data capture. We created specific questionnaires to gather patient-reported data effectively. The IG incorporates device profiles for wearables and sensors to ensure accurate data collection. We developed extensions for contextual information to provide additional relevant data. Profiles uses value sets for standardized terminology to maintain consistency across implementations.

## 3. Results
### IG structure
The IG, available at [https://github.com/RicardoLSantos/shorthand](https://github.com/RicardoLSantos/shorthand), provides detailed documentation of core profiles, extensions, and implementation examples. The developed profiles include specialized structures for each health domain. For vital signs, we created the AdvancedVitalSigns profile extending the base Observation resource. This profile includes mandatory status and category fields, along with specialized components for heart rate variability spectral analysis and entropy measurements.

The IG includes domain-specific extensions to capture additional contextual information:
- MindfulnessContext extension enables recording of practice environment and conditions
- StressTriggers extensions track factors contributing to stress levels
- EnvironmentalExposure extensions monitor various environmental factors affecting health

## 4. Discussion
The IG enables standardized collection of LM data across various health domains. The framework supports evidence-based LM interventions through structured data collection and analysis. Practitioners can continuously monitor behavioral changes through standardized metrics. The integration with clinical decision support systems (LHS environment) enhances treatment planning and monitoring. Complexity of profile definitions was addressed through modular design principles.

## 5. Conclusion
This IG provides a comprehensive framework for integrating PGHD into LM practice. Future work includes expanding to additional health domains and enhancing decision support capabilities. Future steps include expanding the profiles to cover new clinical areas, enhancing the Extract, Transform, Load (ETL) processes, and integrating artificial intelligence techniques and natural language models for advanced decision support.

## References
[1] Santos RL, Cruz-Correia RJ. Improving Healthcare Quality with a LHS: From PGHD to Evidence-Based Recommendations, 2024, DOI 10.3233/SHTI240387.

[2] Institute of Medicine. 2007. The LHS: Workshop Summary. DOI 10.17226/11903.

[3] Clayton JS, Bonnet J. Foundations of LM Board review, 4th edition, 2023, ISBN: 979-8-218-17015-8

[4] HL7 International. FHIR Specification. Available at: https://www.hl7.org/fhir/. Accessed March 2024.
# Improving Healthcare Quality with a LHS: From Patient-Generated Health Data to Evidence-Based Recommendations

**Authors:** Ricardo L. SANTOS¹ and Ricardo CRUZ-CORREIA²

¹PhD student Health Data Science, Faculdade de Medicina da Universidade do Porto, Portugal  
²Associate Professor, Faculdade de Medicina da Universidade do Porto, Portugal

**DOI:** [10.3233/SHTI240387](https://doi.org/10.3233/SHTI240387)

**ORCiD ID:**  
Ricardo L. Santos: [0000-0001-6017-8255](https://orcid.org/0000-0001-6017-8255)  
Ricardo Cruz-Correia: [0000-0002-3764-5158](https://orcid.org/0000-0002-3764-5158)

## Abstract

One approach to enriching the Learning Health System (LHS) is leveraging vital signs and data from wearable technologies. Blood oxygen, heart rate, respiration rates, and other data collected by wearables (like sleep and exercise patterns) can be used to monitor and predict health conditions. This data is already being collected and could be used to improve healthcare in several ways. Our approach will be health data interoperability with HL7 FHIR (for data exchange between different systems), openEHR (to store researchable data separated from software but connected to ontologies, external terminologies and code sets) and maintain the semantics of data. OpenEHR is a standard that has an important role in modelling processes and clinical decisions. The six pillars of Lifestyle Medicine can be a first attempt to change how patients see their daily decisions, affecting the mid to long-term evolution of their health. Our objective is to develop the first stage of the LHS based on a co-produced personal health recording (CoPHR) built on top of a local LLM that interoperates health data through HL7 FHIR, openEHR, OHDSI and terminologies that can ingest external evidence and produces clinical and personal decision support and, when combined with many other patients, can produce or confirm evidence.

**Keywords:** Health data interoperability, personal health recording, openEHR, Learning Health System, clinical decision, HL7 FHIR, patient-generated health data.

## 1. Introduction and Objectives

This preview outlines a thesis for the Health Data Science PhD Program at the University of Porto, detailing progress in establishing a Learning Health System (LHS) to enhance healthcare quality. A Learning Health System (LHS) is an innovative model aimed at continuous healthcare improvement by melding data, scientific evidence, and patient experiences. Its core principles include ongoing learning from data, making evidence-based decisions, fostering patient involvement, and maintaining a commitment to innovation.

## 2. Methodology

### 2.1. LHS, PGHD and Interoperability

LHS architecture integrates improvement cycles focused on specific health issues, governance for consistency and accountability, and a socio-technical infrastructure that underpins these improvement efforts. This infrastructure encompasses digital technologies and involves human roles, policies, and processes.

### 2.2. GDPR and Evidence-Based Clinical Practice Guidelines (CPGs)

Implementing a low-code Electronic Health Record (EHR) system with open-source elements within the openEHR framework is practical despite the lack of open-source tools for frontend development like form generation. OpenEHR aligns with many General Data Protection Regulation (GDPR) mandates on data integrity, confidentiality, and access, supporting data protection by design.

### 2.3. Lifestyle Medicine and the 2019 Nobel Prize

The six pillars of LM (food, sleep, exercises, social engagement, stress management and avoiding risk substances) can be a first attempt to change how patients see their daily decisions affecting their health improvement's mid to long-term evolution. This can be an extremely powerful tool to be combined with PGHD in a CoPHR to give specific and tailored evidence of the importance of health and habit-related choices.

## 3. Conclusions

Our objective is to develop the first stage of the LHS based on a CoPHR built on top of a local LLM that interoperates health data through HL7 FHIR, openEHR, OHDSI and terminologies that can ingest external evidence and produces clinical and personal decision support and when combined with many other patients, can produce or confirm evidence. Information will be presented to the patient and the healthcare professional in a dashboard to help present data in a friendly user interface (UI).

**Corresponding Author:** Ricardo L. Santos; E-mail: ricardolourencosantos@gmail.com

## References

[1] Santos RL, Cruz-Correia RJ. Improving Healthcare Quality with an LHS. In: Studies in Health Technology and Informatics, Volume 302: Caring is Sharing - Exploiting the Value in Data for Health and Innovation, Pages: 145 - 146, 2023, DOI 10.3233/SHTI230088.

[2] Institute of Medicine. 2007. The Learning Healthcare System: Workshop Summary. Washington, DC: The National Academies Press. https://doi.org/10.17226/11903.

[3] Foley T, Vale L. A framework for understanding, designing, developing and evaluating learning health systems. Learn Health Sys. 2023; 7(1):e10315. doi:10.1002/lrh2.10315

[4] Friedman CP, et al. Socio-technical infrastructure for a learning health system. Learn Health Sys. 2024; 8(1):e10405. doi:10.1002/lrh2.10405

[5] Vaidyam A, et al. Enabling Research and Clinical Use of Patient-Generated Health Data (the mindLAMP Platform): Digital Phenotyping Study JMIR Mhealth Uhealth 2022;10(1):e30557

[6] The Book of OHDSI, Observational Health Data Sciences and Informatics. Accessed March, 2024.

[7] Frade S, et al. OpenEHR Implementation Guide: Towards Standard Low-Code Healthcare Systems, In: Studies in Health Technology and Informatics, 290, 52-55, IOS Press, 2021.

[8] Sousa M, et al. OpenEHR Based Systems and the General Data Protection Regulation (GDPR). In: Studies in Health Technology and Informatics, Volume 247: Building Continents of Knowledge in Oceans of Data: The Future of Co-Created eHealth, 91 - 95, DOI: 10.3233/978-1-61499-852-5-91.

[9] Silva B, et al. OpenEHR logic module: a tool for creating decision rules, Procedia Computer Science, Volume 231, 2024, Pages 427-432, ISSN 1877-0509, https://doi.org/10.1016/j.procs.2023.12.229.

[10] Beale T. Decision Language specification. 2021. url: https://specifications.openehr.org/releases/PROC/Release-1.6.0/decision-language.html.

[11] Lichtner G., et al. Representation of evidence-based clinical practice guideline recommendations on FHIR. Journal of Biomedical Informatics 139 (2023) https://doi.org/10.1016/j.jbi.2023.104305

[12] Apperta Foundation -A Blueprint for a Co-produced Personal Health Record (co-PHR) Ecosystem. https://apperta.org/coPHR/, Accessed 2024, March.

[13] Miao J, et al. Chain of Thought Utilization in Large Language Models and Application in Nephrology. Medicina 2024, 60, 148. https://doi.org/10.3390/medicina60010148

[14] Balch JA, et al. Machine Learning–Enabled Clinical Information Systems Using Fast Healthcare Interoperability Resources Data Standards: Scoping Review. JMIR Med Inform 2023;11:e48297

[15] Clayton JS, Bonnet J. Foundations of lifestyle medicine Board review manual, 4th edition, 2023, Published by the American College of Lifestyle Medicine, ISBN: 979-8-218-17015-8

[16] The Nobel Prize in Physiology or Medicine 2019, https://www.nobelprize.org/prizes/medicine/2019/advanced-information/, accessed 2023-05-28
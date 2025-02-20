# Improving Healthcare Quality with an LHS: From PGHD to Evidence

**Event:** XX Congresso Brasileiro de Informática em Saúde (CBIS'24)  
**Date:** 08/10 to 11/10 2024  
**Location:** Belo Horizonte/MG - Brasil  
**Version:** Updated on 05.02.2024  
**ISSN:** XXXX-XXXX

## Authors
Ricardo L. Santos¹, Ricardo J. Cruz-Correia¹

¹ Faculdade de Medicina da Universidade do Porto, Porto, Portugal.  
Contact: ricardolourencosantos@gmail.com

## Abstract
A key method to enhance the Learning Health System (LHS) involves utilising vital signs and data from wearable technologies such as blood oxygen, heart rate, and sleep patterns. These metrics are instrumental in monitoring and forecasting health conditions. Our strategy emphasises health data interoperability through HL7 FHIR, which facilitates data exchange, and openEHR, which stores researchable data linked to ontologies and external terminologies while maintaining data semantics. Notably, openEHR plays a crucial role in modelling processes and clinical decision-making. The six pillars of Lifestyle Medicine aim to shift patients' perceptions of how daily choices impact long-term health. The objective is to develop an initial phase of the LHS using a Co-produced Personal Health Recording (coPHR) integrated with a local LLM that leverages HL7 FHIR, openEHR, and OHDSI to assimilate external evidence and support clinical and personal decisions, potentially confirming evidence when aggregated with data from numerous patients.

**Keywords:** Learning Health System; health data interoperability; patient-generated health data.

## 1. CONTEXT AND MOTIVATION
This expanded abstract details a thesis for advancing a Learning Health System (LHS) aimed at enhancing healthcare quality, undertaken by a PhD student in the research field of Health Data Science at a major university. The work begins with integrating Patient-Generated Health Data (PGHD) and Evidence-Based Clinical Practice Guidelines, evaluating these guidelines against real-world observational evidence to accelerate the adoption of translational knowledge in healthcare.

The core strategy to enrich the LHS involves utilising vital signs and data from wearable technologies to increase patient engagement, support self-management, and tailor healthcare to meet individual needs. Wearables provide real-time feedback on health metrics, fostering active patient involvement in condition management, enhancing engagement through health data insights, and enabling personalised healthcare through a detailed understanding of individual health patterns and risks.

## 2. SOLUTION DESCRIPTION

### LHS, PGHD and Interoperability
A LHS is a dynamic model designed to enhance healthcare by integrating data, scientific evidence, and patient experiences. Its foundational principles are continuous learning from data, evidence-based decision-making, promoting patient engagement, and a commitment to innovation.

### Evidence-Based Clinical Practice Guidelines (CPGs)
Implementing a low-code Electronic Health Record (EHR) system within the openEHR framework is feasible, even with a shortage of open-source tools for front-end development, such as form generation. OpenEHR adheres to many GDPR mandates concerning data integrity, confidentiality, and access, thereby supporting data protection by design.

### CoPHR and Local LLM
CoPHR offers a collaborative approach to health data science, stressing shared responsibility between patients and healthcare providers, empowering patients by allowing them to control and contribute their data from various sources like wearables and apps. This model seeks to boost patient engagement through more active involvement in health management.

### Lifestyle Medicine, the 2019 Nobel Prize and the Mitochondrial Metabolic Theory
The six pillars of Lifestyle Medicine—food, sleep, exercise, social engagement, stress management, and avoiding risky substances—serve to transform how patients perceive their daily decisions and their impact on health over the medium to long term.

## 3. INNOVATION HIGHLIGHTS
We aim to establish the initial LHS phase utilising a coPHR integrated with a local LLM. This system will interoperate health data through HL7 FHIR, openEHR, OHDSI, and various terminologies to ingest external evidence and provide clinical and personal decision support.

## 4. FINAL CONSIDERATIONS
Implementing this integrated LHS represents a significant advancement in personalised healthcare. It exemplifies how technology can transform patient data into valuable health insights that drive better clinical outcomes. Future work will focus on expanding the capabilities of the LHS to include more predictive analytics features and exploring the impact of these integrations on various health outcomes.

## Acknowledgements
Project financed by FCT - https://doi.org/10.54499/UI/BD/151502/2021

## References

1. Santos RL, Cruz-Correia RJ. Improving Healthcare Quality with an LHS. 2023, DOI 10.3233/SHTI230088.

2. Institute of Medicine. 2007. The Learning Healthcare System: Workshop Summary. Washington, DC: The National Academies Press. https://doi.org/10.17226/11903.

3. Foley T, Vale L. A framework for understanding, designing, developing, and evaluating learning health systems. Learn Health Sys. 2023; 7(1):e10315. doi:10.1002/lrh2.10315.

4. Friedman CP, et al. Socio-technical infrastructure for a learning health system. Learn Health Sys. 2024; 8(1):e10405. doi:10.1002/lrh2.10405

5. Vaidyam A, et al. Enabling Research and Clinical Use of Patient-Generated Health Data (the mindLAMP Platform): Digital Phenotyping Study JMIR Mhealth Uhealth 2022;10(1):e30557. doi: 10.2196/30557.

6. The Book of OHDSI, Observational Health Data Sciences and Informatics. Accessed March, 2024.

7. Frade S, et al. OpenEHR Implementation Guide: Towards Standard Low-Code Healthcare Systems. IOS Press, 2021.
8. Sousa M, et al. OpenEHR Based Systems and the General Data Protection Regulation. DOI: 10.3233/978-1-61499-852-5-91.
9. Silva B, et al. OpenEHR logic module: a tool for creating decision rules, Procedia
Computer Science, Volume 231, 2024, Pages 427-432, ISSN 1877-0509,
https://doi.org/10.1016/j.procs.2023.12.229.
10. Thomas Beale. Decision Language specification. 2021. https://specifications.openehr.org/releases/PROC/Release-1.6.0/decision-language.html openehr.org/releases/ PROC/Release-1.6.0/decision-language.html.
11. Lichtner G., et al. Representation of evidence-based clinical practice guideline
recommendations on FHIR. Journal of Biomedical Informatics 139 (2023) 104305
https://doi.org/10.1016/j.jbi.2023.104305
12. Apperta Foundation - A Blueprint for a Co-produced Personal Health Record (co-PHR) Ecosystem. https://apperta.org/coPHR/, Accessed 2024, March.
13. Miao J, et al. Chain of Thought Utilization in Large Language Models and Application in Nephrology. Medicina 2024,60,148. https://doi.org/10.3390/medicina60010148
14. Balch JA, et al. Machine Learning–Enabled Clinical Information Systems
Using Fast Healthcare Interoperability Resources Data Standards: Scoping
Review. JMIR Med Inform 2023;11:e48297. doi: 10.2196/48297
15. Clayton JS, et al, Foundations of Lifestyle Medicine Board review manual, 4th edition, 2023, American College of Lifestyle Medicine, ISBN: 979-8-218-17015-8
16. The Nobel Prize in Physiology or Medicine 2019, https://www.nobelprize.
org/prizes/medicine/2019/advanced-information/, accessed 2023-05-28.
17. Bosco et al. Targeting hypoxia in tumor: a new promising therapeutic strategy.
https://doi.org/10.1186/s13046-019-1517-0.
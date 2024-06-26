<div markdown="1" class="note-to-balloters">
  
This ballot is designated as US Realm specific. Impetus comes from the US Department of Health and Human Services’ strategy to provide a Whole Person Care approach.  It encompasses providing services and measuring their outcomes across the domains of clinical, behavioral, and social services (see https://cdo.hhs.gov/s/hhs-data-strategy). It is HHS’s judgment that the HL7 FHIR Standard is the best for delivering Whole Person Care solutions.  

The ballot material begins from the perspective of subject matter experts and their requirements for providing and delivering Social Services.  Social Services represent concepts and pathways different from clinical services. For example, Social Services are generally delivered to a group of individuals such as a family or a household, not “patients.” Also, services are delivered at the local level by government authorities having their own rules for eligibility and enrollment. Concepts such as tribal membership and immigrant status may also be required. 

Given our understanding of social service requirements, the ballot attempts to provide an approach using FHIR to enable Whole Person Care. The authors are cognizant of the backward compliance requirement for existing FHIR solutions. 

The Health and Human Services Working Group has designated this version of the ballot as an Informative Ballot for Comment. Constructive feedback has been received from the HL7 community about various approaches. We welcome even more feedback during the ballot review process. 

Our objective has been the enhancement of FHIR to serve the delivery of Whole Person Care. This is our initial recommendation for an approach and it may change with further input. An Informative Ballot for Comment allows us to receive input while providing flexibility to adjust the present path. 

</div>


### Introduction
The Enhancing FHIR to Address Social Services and Social Determinants Project seeks to extend the use of FHIR to support Social Services more effectively and efficiently. The HL7 Gravity Accelerator Program has done significant work in the context of social domains. This guide leverages their work and is a Companion Guide to the Gravity Project’s SDOH Clinical Care 2.1 Implementation Guide.
This project's objective is to reduce some of the barriers faced to effectively and efficiently delivering FHIR-based systems that will incorporate social services and social determinants to improve outcomes.
This Companion Guide is developed under the sponsorship of the HHS Working Group whose mission is “to provide a space for human services sector stakeholders and HL7 experts that focus on non-clinically oriented social risks and needs to define requirements, design, and validate HL7 Implementation Guides for interoperable human services data exchange”. The project and this Companion Guide are focused on the U.S. environment, the basic constructs and interaction patterns may well be applicable outside the U.S. realm.
Enhancing FHIR for Social Services Companion Guide is not meant to be an exhaustive closed loop referral standard between a Community Based Organization (or similar Social Services actor) and a Program (such as ACF’s TANF program, HUDs housing programs) or process standard. There is lots of work already being done and to be done to provide such a complete standard, but it is beyond the scope of this IG. This IG will offer a an enhanced FHIR framework in which such work for this work in the future.

### How to Read This Guide
It is expected that the ballot will be reviewed by subject matter experts in the Social Services domain, FHIR architects and implementers, and those providing Whole Person Care solutions. Terms used in the different domains may not be familiar to all and for that, a glossary is provided. It is recommended that all readers familiarize themselves with the terms before reading the document. Finally, the table below shows what content is directed to Subject Matter Experts and what is directed to the more technical community.

|Section|Description|Audience|
|---|---|---|
Glossary |List of terms used in this guide and a definition of the term. The terms may have meanings specific to Social Services domains or their use in this Guide. |General
Background |The approach we developed to evaluate the material in this guide as well as what is considered in scope and out-of-scope.|General
Use Cases |The work product developed is driven by Use Cases. Two representative Use Cases are provided to provide context for the technical material.|General
Guidance – Design and Evaluation |To meet the objective of providing recommendations for Enhancing FHIR, this section introduces the various designs for potential enhancements that were evaluated. |General
Guidance - Implementer |Based on requirements, this presents a Social Services Domain Analysis Model (SS DAM).|Technical 
FHIR Analysis Model |The FHIR compliant model represents a FHIR implementation of of SS DAM.|Technical
FHIR Realization Model |The recommendation of the FHIR Resources, Profiles, and Extensions for the a version of FHIR R5.|Technical
Artifacts |Specifications for FHIR Resources, Profiles, and Extensions contained in the FHIR Realization Model.|Technical
Artifacts – Downloads |Examples of persona data for Use cases for FHIR Realization Model.|Technical|

### Companion Guide Scope
The diagram below presents the Gravity Conceptual Model. It illustrates the scope of the Companion Guide and how it augments the most recent Gravity Conceptual Model in the SDOH Clinical Care Implementation Guide. To separate the concerns, the  Program System, on the left of the diagram, is responsible for enrollment in the social service(s).  This assumes that the Program System may or may not be a FHIR-based system. To support this position, over $400 billion of Social Services were delivered by just 3 separate Federal U. S. agencies in 2022 using non-FHIR Systems addressing housing insecurity, food insecurity, and temporary financial security.

![Scope](workflow_integration.png)

The system depicted on the right is a FHIR System that provides Whole Person Care. It represents the SDOH Clinical Care Implementation Guide.

The Program System depicted on the left may or may not be FHIR-based. The assumption has been made that it is not an FHIR-based system. To support this assumption, in the United States, just three federal agencies delivered over $400 billion of Social Services in 2022 using non-FHIR systems to address housing and food insecurity and temporary financial security.

### Out of Scope ##
To deliver a solution for providing WPC in an operational environment is a complex endeavor. This Guide does not address other necessary functional requirements.  

**Implementation of Workflow:** This Guide does not attempt to define an implementation approach for exchanging data between the FHIR-based system and the Agency System. Several patterns are available and analysis and recommendations will be deferred to a later publication.   

**Eligibility for a Social Services Program:** Some FHIR systems can identify the appropriate specific program to address the specific social need or risk. This specific version of the Companion Guide assumes that the Program System will determine the appropriate social service based on its eligibility rules. Future versions may include the scope where computable eligibility requirements may be available to the FHIR system and recommendations for specific social services may be recommended.

A FHIR system capable of determining eligibility for Social Services would be beneficial. This would increase the efficiency for all parties. However, this will be considered in future versions.

**Privacy Policies:** It is assumed that data can flow freely and unencumbered between the FHIR System and the Program System as the implementation of Privacy Policies is out of scope. However, consideration of Privacy Policies will need to be considered in the future.

In the social care space, the word “Patient” has a very specific meaning. It has been identified by the project, as well as others, that not only is the use of this term inaccurate and polarizing in the domains with which we are trying to collaborate, but it may have potential legal concerns as well. This project will continue to collect supporting information for this issue, but it is out of the scope of this work to address it here. 

### Dependencies on Other IGs

|Guidance Document |Version |Dependency|
|---|---|---|
|Gravity SDOH Clinical Care Implementation Guide |2.1|
|FHIR |Release 4.0.1||
|HL7 Domain Analysis Model: Patient Centered Care Team,|Release 1.0|
|Others TBD||


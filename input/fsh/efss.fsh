Alias:   LNC = http://loinc.org
Alias:   FamilyMemberValue = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.1.11.19579
Alias:   MaritalOrSpousalStatus = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1222.1310
Alias:   PersonalAndLegalRelationshipRoleType = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.11.20.12.1
Alias:   VeteranStatusGoals = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1247.214
Alias:   Problem = http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.88.12.3221.7.4
Alias:   EFSS = http://hl7.org/fhir/StructureDefinition/structuredefinition-efss


ValueSet: LifeSetAssociationVS
Id: life-set-association-vs
Title: "Life Set Association VS"
Description: "General social association types, such as Bilogical Daughter or Dependent"
* ^experimental = true
* include codes from valueset FamilyMemberValue and MaritalOrSpousalStatus and PersonalAndLegalRelationshipRoleType

ValueSet: LifeSetAssociationVerificationCodeVS
Id: life-set-association-verification-role-vs
Title: "Life Set Association Verification Code VS"
Description: "Type of verification noted on the association, self reported, documentation, specific documentation "
* ^experimental = true        

ValueSet: LifeSetAssociationStatusCodeVS
Id: life-set-association-status-role-vs
Title: "LifeSet Association Status Code VS"
Description: "General purpose status code for workflow processing"
* ^experimental = true

ValueSet: MembershipTypeCodeVS
Id: membership-type-code-vs
Title: "Membership Type Code VS"
Description: "Specific type of membership into the group, for instance beneficiary"
* ^experimental = true 


ValueSet: MembershipRoleCodeVS
Id: membership-type-role-vs
Title: "Membership Role Code VS"
Description: "Role person is playing as part of the group, such as Head of Household, or Guarantor"
* ^experimental = true
* include codes from valueset PersonalAndLegalRelationshipRoleType

ValueSet: MembershipVerificationCodeVS
Id: membership-verification-role-vs
Title: "Membership Verification Code VS"
Description: "Type of verification noted on the membership, self reported, documentation, specific documentation "
* ^experimental = true

ValueSet: MembershipStatusCodeVS
Id: membership-status-role-vs
Title: "Membership Status Code VS"
Description: "General purpose status code for workflow processing"
* ^experimental = true

ValueSet: AssociationQualificationTypeCodeVS
Id: association-qualification-type-code-vs
Title: "Association Qualification Type Code VS"
Description: "Type of qualification for the association, for instance  Certificate of Degree of Indian Blood,CDIB."
* ^experimental = true

Logical: FAMIndividual
Id: Sdohindividual
Title: "Individual"
Description: "A single human being as distinct from a group, class, or family."
Characteristics: #can-be-target
* identifier 0..* SU Identifier "identifier" "Identifier"
* active 1..1 SU boolean "active" "active"
* name 0..* SU HumanName "name" "name"
* telecom 0..* SU ContactPoint "telecom" "Telecom"
* gender 0..1 SU code "gender" "Gender"
* birthDate 0..1 SU date "birthDate" "birthDate"
* address 0..* SU Address "address" "Address"
* maritalStatus 0..1 SU CodeableConcept "maritalStatus" "Marital Status"
* maritalStatus  from MaritalOrSpousalStatus
// * relatedIndividual  0..* SU RelatedIndividual "relatedIndividual" "Related Individual"
* veteranStatus 0..1 SU CodeableConcept "veteranStatus" "Veteran Status"
* veteranStatus  from VeteranStatusGoals
* healthStatus 0..* SU CodeableConcept "healthStatus" "Health Status"
* healthStatus  from Problem  


// Logical: FAMQualification
// Id: EFSS-FAM-Qualification
// Title: "Qualification"
// Description: "Qualification"
// * type 1..1 SU CodeableConcept "Type of qualification"
// * type from AssociationQualificationTypeCodeVS (example)
// * value 1..1 SU Quantity "Verification status of association" "Verification"


// Logical: FAMAssociation
// Id: EFSS-FAM-Association
// Title: "Association"
// Description: "Association"
// * association 1..1 SU Reference(FAMIndividual or Organization or FAMLegalJurisdiction) "individual" "Individual"
// * type 1..1 SU CodeableConcept "Type of relationship, for instance biological daugher or co-habitant" "Relationship"
// * type from LifeSetAssociationVS (example)
// * effectiveTime 0..1 SU Period "When the association is/was active" "Effective Time"
// * effectiveTiming 0..1 SU Timing "When the association is in effect during the effect time; For instance co-habition 6 weeks out of the year due to divorece settlement" "Effective Time"
// * status 0..* SU CodeableConcept "status" "Status"
// * type from LifeSetAssociationStatusCodeVS (example)
// * verification 0..* SU CodeableConcept "Verification status of association" "Verification"
// * type from LifeSetAssociationVerificationCodeVS (example)
// * qualification 0..* CodeableConcept "Qualification" "Qualification"

Logical: FAMLifeSet
Id: Sdohlifeset
Title: "Life Set"
Description: "Life Set is an amalgamation of the persons/groups who constitute the interactions and relationships from the perspectice of an individual.  The associations from the individual to the person/group are explicit in nature as to avoid confusion and structured to properly elaborate all aspects of the particular association"
* subject 1..1 SU FAMIndividual "Individual whose associations these are" "Individual"
* identifier 0..* SU Identifier "identifier" "Identifier"
* association 0..* SU BackboneElement  "Association" "Association"
* association.entity 1..1 SU Reference(FAMIndividual or Organization or SDOHLegalJurisdiction) "individual" "Individual"
* association.type 1..1 SU CodeableConcept "Type of relationship, for instance biological daugher or co-habitant" "Relationship"
* association.type from LifeSetAssociationVS (example)
* association.effectiveTime 0..1 SU Period "When the association is/was active" "Effective Time"
* association.effectiveTiming 0..1 SU Timing "When the association is in effect during the effect time; For instance co-habition 6 weeks out of the year due to divorece settlement" "Effective Time"
* association.status 0..* SU CodeableConcept "status" "Status"
* association.status from LifeSetAssociationStatusCodeVS (example)
* association.verification 0..* SU CodeableConcept "Verification status of association" "Verification"
* association.verification from LifeSetAssociationVerificationCodeVS (example)
* association.qualification 0..* BackboneElement "Qualification" "Qualification"
* association.qualification.code 1..1 SU CodeableConcept "Qualification" "Qualification"
* association.qualification.value 1..1 SU  Quantity "Qualification" "Qualification"



Logical: FAMScreeningSet
Id: Sdohscreeningset
Title: "Screening Set"
Description: "Screening Set is a composition of individuals in need of service(s). The focus of the Screening Set is provide an effecient construct for identifying and illustraing the individuals in the composition.  The Screen Set itself is meant to be transaction and temporal in nature.  The Screen Set would be active while the steps taken to acquire the services have been completed. Screenig Set should be viewed as the trigger for acquisition process for the required services but not utilized for the acquisition workflow operations "
* identifier 0..* SU Identifier "identifier" "Identifier"
* serviceCategory 0..* SU CodeableConcept "general classificaiton of the services" "serviceCategory"
* service 0..* SU CodeableConcept "one or more specific services needed" "serviceProgramb"
* status 1..1 SU code "status" "status"
* membership 0..* BackboneElement  "Membership" "Membership"
* membership.individual 1..1 SU Reference(FAMIndividual) "Individual who requires service(s)" "Individual"
* membership.type 0..1 SU CodeableConcept "Type of membership, HUD household for instance" "Membership"
* membership.type from MembershipTypeCodeVS (example)
* membership.effectiveTime 1..1 SU Period "When the membership was active" "Effective Time"
* membership.status 0..* SU CodeableConcept "status" "Status"
* membership.status from MembershipStatusCodeVS (example)
* membership.role 0..* SU CodeableConcept "Possible role person is as part as it pertains to the type of membershihp, Head of Household for HUD Household" "Status"
* membership.role from MembershipRoleCodeVS (example)
* membership.verification 0..* SU CodeableConcept "Verification status of the membership/eligbility of this individual in set" "Verification"
* membership.verification from MembershipVerificationCodeVS (example)

Logical: SDOHLegalJurisdiction
Id: Sdohlegaljurisdiction
Title: "LegalJurisdiction"
Description: "A legal jurisdiction refers to a source of law or a body that has the power to make and enforce laws within a particular jurisdiction."
Characteristics: #can-be-target
* identifier 0..* SU Identifier "Identifier" "Identifier"
* active 1..1 SU boolean "active" "active"
* name 0..* SU string "name" "name"
* alias 0..* SU string "name" "name"
* telecom 0..* SU ContactPoint "telecom" "Telecom"
* partOf 0..* SU Reference(SDOHLegalJurisdiction) "legalJurisdiction" "LegalJurisdiction"



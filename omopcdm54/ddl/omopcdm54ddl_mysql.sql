CREATE TABLE `PERSON` (
  `person_id` integer PRIMARY KEY NOT NULL,
  `gender_concept_id` integer NOT NULL,
  `year_of_birth` integer NOT NULL,
  `month_of_birth` integer,
  `day_of_birth` integer,
  `birth_datetime` TIMESTAMP,
  `race_concept_id` integer NOT NULL,
  `ethnicity_concept_id` integer NOT NULL,
  `location_id` integer,
  `provider_id` integer,
  `care_site_id` integer,
  `person_source_value` varchar(50),
  `gender_source_value` varchar(50),
  `gender_source_concept_id` integer,
  `race_source_value` varchar(50),
  `race_source_concept_id` integer,
  `ethnicity_source_value` varchar(50),
  `ethnicity_source_concept_id` integer
);

CREATE TABLE `OBSERVATION_PERIOD` (
  `observation_period_id` integer PRIMARY KEY NOT NULL,
  `person_id` integer NOT NULL,
  `observation_period_start_date` date NOT NULL,
  `observation_period_end_date` date NOT NULL,
  `period_type_concept_id` integer NOT NULL
);

CREATE TABLE `VISIT_OCCURRENCE` (
  `visit_occurrence_id` integer PRIMARY KEY NOT NULL,
  `person_id` integer NOT NULL,
  `visit_concept_id` integer NOT NULL,
  `visit_start_date` date NOT NULL,
  `visit_start_datetime` TIMESTAMP,
  `visit_end_date` date NOT NULL,
  `visit_end_datetime` TIMESTAMP,
  `visit_type_concept_id` Integer NOT NULL,
  `provider_id` integer,
  `care_site_id` integer,
  `visit_source_value` varchar(50),
  `visit_source_concept_id` integer,
  `admitted_from_concept_id` integer,
  `admitted_from_source_value` varchar(50),
  `discharged_to_concept_id` integer,
  `discharged_to_source_value` varchar(50),
  `preceding_visit_occurrence_id` integer
);

CREATE TABLE `VISIT_DETAIL` (
  `visit_detail_id` integer PRIMARY KEY NOT NULL,
  `person_id` integer NOT NULL,
  `visit_detail_concept_id` integer NOT NULL,
  `visit_detail_start_date` date NOT NULL,
  `visit_detail_start_datetime` TIMESTAMP,
  `visit_detail_end_date` date NOT NULL,
  `visit_detail_end_datetime` TIMESTAMP,
  `visit_detail_type_concept_id` integer NOT NULL,
  `provider_id` integer,
  `care_site_id` integer,
  `visit_detail_source_value` varchar(50),
  `visit_detail_source_concept_id` Integer,
  `admitted_from_concept_id` Integer,
  `admitted_from_source_value` varchar(50),
  `discharged_to_source_value` varchar(50),
  `discharged_to_concept_id` integer,
  `preceding_visit_detail_id` integer,
  `parent_visit_detail_id` integer,
  `visit_occurrence_id` integer NOT NULL
);

CREATE TABLE `CONDITION_OCCURRENCE` (
  `condition_occurrence_id` integer PRIMARY KEY NOT NULL,
  `person_id` integer NOT NULL,
  `condition_concept_id` integer NOT NULL,
  `condition_start_date` date NOT NULL,
  `condition_start_datetime` TIMESTAMP,
  `condition_end_date` date,
  `condition_end_datetime` TIMESTAMP,
  `condition_type_concept_id` integer NOT NULL,
  `condition_status_concept_id` integer,
  `stop_reason` varchar(20),
  `provider_id` integer,
  `visit_occurrence_id` integer,
  `visit_detail_id` integer,
  `condition_source_value` varchar(50),
  `condition_source_concept_id` integer,
  `condition_status_source_value` varchar(50)
);

CREATE TABLE `DRUG_EXPOSURE` (
  `drug_exposure_id` integer PRIMARY KEY NOT NULL,
  `person_id` integer NOT NULL,
  `drug_concept_id` integer NOT NULL,
  `drug_exposure_start_date` date NOT NULL,
  `drug_exposure_start_datetime` TIMESTAMP,
  `drug_exposure_end_date` date NOT NULL,
  `drug_exposure_end_datetime` TIMESTAMP,
  `verbatim_end_date` date,
  `drug_type_concept_id` integer NOT NULL,
  `stop_reason` varchar(20),
  `refills` integer,
  `quantity` NUMERIC,
  `days_supply` integer,
  `sig` TEXT,
  `route_concept_id` integer,
  `lot_number` varchar(50),
  `provider_id` integer,
  `visit_occurrence_id` integer,
  `visit_detail_id` integer,
  `drug_source_value` varchar(50),
  `drug_source_concept_id` integer,
  `route_source_value` varchar(50),
  `dose_unit_source_value` varchar(50)
);

CREATE TABLE `PROCEDURE_OCCURRENCE` (
  `procedure_occurrence_id` integer PRIMARY KEY NOT NULL,
  `person_id` integer NOT NULL,
  `procedure_concept_id` integer NOT NULL,
  `procedure_date` date NOT NULL,
  `procedure_datetime` TIMESTAMP,
  `procedure_end_date` date,
  `procedure_end_datetime` TIMESTAMP,
  `procedure_type_concept_id` integer NOT NULL,
  `modifier_concept_id` integer,
  `quantity` integer,
  `provider_id` integer,
  `visit_occurrence_id` integer,
  `visit_detail_id` integer,
  `procedure_source_value` varchar(50),
  `procedure_source_concept_id` integer,
  `modifier_source_value` varchar(50)
);

CREATE TABLE `DEVICE_EXPOSURE` (
  `device_exposure_id` integer PRIMARY KEY NOT NULL,
  `person_id` integer NOT NULL,
  `device_concept_id` integer NOT NULL,
  `device_exposure_start_date` date NOT NULL,
  `device_exposure_start_datetime` TIMESTAMP,
  `device_exposure_end_date` date,
  `device_exposure_end_datetime` TIMESTAMP,
  `device_type_concept_id` integer NOT NULL,
  `unique_device_id` varchar(255),
  `production_id` varchar(255),
  `quantity` integer,
  `provider_id` integer,
  `visit_occurrence_id` integer,
  `visit_detail_id` integer,
  `device_source_value` varchar(50),
  `device_source_concept_id` integer,
  `unit_concept_id` integer,
  `unit_source_value` varchar(50),
  `unit_source_concept_id` integer
);

CREATE TABLE `MEASUREMENT` (
  `measurement_id` integer PRIMARY KEY NOT NULL,
  `person_id` integer NOT NULL,
  `measurement_concept_id` integer NOT NULL,
  `measurement_date` date NOT NULL,
  `measurement_datetime` TIMESTAMP,
  `measurement_time` varchar(10),
  `measurement_type_concept_id` integer NOT NULL,
  `operator_concept_id` integer,
  `value_as_number` NUMERIC,
  `value_as_concept_id` integer,
  `unit_concept_id` integer,
  `range_low` NUMERIC,
  `range_high` NUMERIC,
  `provider_id` integer,
  `visit_occurrence_id` integer,
  `visit_detail_id` integer,
  `measurement_source_value` varchar(50),
  `measurement_source_concept_id` integer,
  `unit_source_value` varchar(50),
  `unit_source_concept_id` integer,
  `value_source_value` varchar(50),
  `measurement_event_id` bigint,
  `meas_event_field_concept_id` integer
);

CREATE TABLE `OBSERVATION` (
  `observation_id` integer PRIMARY KEY NOT NULL,
  `person_id` integer NOT NULL,
  `observation_concept_id` integer NOT NULL,
  `observation_date` date NOT NULL,
  `observation_datetime` TIMESTAMP,
  `observation_type_concept_id` integer NOT NULL,
  `value_as_number` NUMERIC,
  `value_as_string` varchar(60),
  `value_as_concept_id` Integer,
  `qualifier_concept_id` integer,
  `unit_concept_id` integer,
  `provider_id` integer,
  `visit_occurrence_id` integer,
  `visit_detail_id` integer,
  `observation_source_value` varchar(50),
  `observation_source_concept_id` integer,
  `unit_source_value` varchar(50),
  `qualifier_source_value` varchar(50),
  `value_source_value` varchar(50),
  `observation_event_id` bigint,
  `obs_event_field_concept_id` integer
);

CREATE TABLE `DEATH` (
  `person_id` integer NOT NULL,
  `death_date` date NOT NULL,
  `death_datetime` TIMESTAMP,
  `death_type_concept_id` integer,
  `cause_concept_id` integer,
  `cause_source_value` varchar(50),
  `cause_source_concept_id` integer
);

CREATE TABLE `NOTE` (
  `note_id` integer PRIMARY KEY NOT NULL,
  `person_id` integer NOT NULL,
  `note_date` date NOT NULL,
  `note_datetime` TIMESTAMP,
  `note_type_concept_id` integer NOT NULL,
  `note_class_concept_id` integer NOT NULL,
  `note_title` varchar(250),
  `note_text` TEXT NOT NULL,
  `encoding_concept_id` integer NOT NULL,
  `language_concept_id` integer NOT NULL,
  `provider_id` integer,
  `visit_occurrence_id` integer,
  `visit_detail_id` integer,
  `note_source_value` varchar(50),
  `note_event_id` bigint,
  `note_event_field_concept_id` integer
);

CREATE TABLE `NOTE_NLP` (
  `note_nlp_id` integer PRIMARY KEY NOT NULL,
  `note_id` integer NOT NULL,
  `section_concept_id` integer,
  `snippet` varchar(250),
  `offset` varchar(50),
  `lexical_variant` varchar(250) NOT NULL,
  `note_nlp_concept_id` integer,
  `note_nlp_source_concept_id` integer,
  `nlp_system` varchar(250),
  `nlp_date` date NOT NULL,
  `nlp_datetime` TIMESTAMP,
  `term_exists` varchar(1),
  `term_temporal` varchar(50),
  `term_modifiers` varchar(2000)
);

CREATE TABLE `SPECIMEN` (
  `specimen_id` integer PRIMARY KEY NOT NULL,
  `person_id` integer NOT NULL,
  `specimen_concept_id` integer NOT NULL,
  `specimen_type_concept_id` integer NOT NULL,
  `specimen_date` date NOT NULL,
  `specimen_datetime` TIMESTAMP,
  `quantity` NUMERIC,
  `unit_concept_id` integer,
  `anatomic_site_concept_id` integer,
  `disease_status_concept_id` integer,
  `specimen_source_id` varchar(50),
  `specimen_source_value` varchar(50),
  `unit_source_value` varchar(50),
  `anatomic_site_source_value` varchar(50),
  `disease_status_source_value` varchar(50)
);

CREATE TABLE `FACT_RELATIONSHIP` (
  `domain_concept_id_1` integer NOT NULL,
  `fact_id_1` integer NOT NULL,
  `domain_concept_id_2` integer NOT NULL,
  `fact_id_2` integer NOT NULL,
  `relationship_concept_id` integer NOT NULL
);

CREATE TABLE `LOCATION` (
  `location_id` integer PRIMARY KEY NOT NULL,
  `address_1` varchar(50),
  `address_2` varchar(50),
  `city` varchar(50),
  `state` varchar(2),
  `zip` varchar(9),
  `county` varchar(20),
  `location_source_value` varchar(50),
  `country_concept_id` integer,
  `country_source_value` varchar(80),
  `latitude` NUMERIC,
  `longitude` NUMERIC
);

CREATE TABLE `CARE_SITE` (
  `care_site_id` integer PRIMARY KEY NOT NULL,
  `care_site_name` varchar(255),
  `place_of_service_concept_id` integer,
  `location_id` integer,
  `care_site_source_value` varchar(50),
  `place_of_service_source_value` varchar(50)
);

CREATE TABLE `PROVIDER` (
  `provider_id` integer PRIMARY KEY NOT NULL,
  `provider_name` varchar(255),
  `npi` varchar(20),
  `dea` varchar(20),
  `specialty_concept_id` integer,
  `care_site_id` integer,
  `year_of_birth` integer,
  `gender_concept_id` integer,
  `provider_source_value` varchar(50),
  `specialty_source_value` varchar(50),
  `specialty_source_concept_id` integer,
  `gender_source_value` varchar(50),
  `gender_source_concept_id` integer
);

CREATE TABLE `PAYER_PLAN_PERIOD` (
  `payer_plan_period_id` integer PRIMARY KEY NOT NULL,
  `person_id` integer NOT NULL,
  `payer_plan_period_start_date` date NOT NULL,
  `payer_plan_period_end_date` date NOT NULL,
  `payer_concept_id` integer,
  `payer_source_value` varchar(50),
  `payer_source_concept_id` integer,
  `plan_concept_id` integer,
  `plan_source_value` varchar(50),
  `plan_source_concept_id` integer,
  `sponsor_concept_id` integer,
  `sponsor_source_value` varchar(50),
  `sponsor_source_concept_id` integer,
  `family_source_value` varchar(50),
  `stop_reason_concept_id` integer,
  `stop_reason_source_value` varchar(50),
  `stop_reason_source_concept_id` integer
);

CREATE TABLE `COST` (
  `cost_id` integer PRIMARY KEY NOT NULL,
  `cost_event_id` integer NOT NULL,
  `cost_domain_id` varchar(20) NOT NULL,
  `cost_type_concept_id` integer NOT NULL,
  `currency_concept_id` integer,
  `total_charge` NUMERIC,
  `total_cost` NUMERIC,
  `total_paid` NUMERIC,
  `paid_by_payer` NUMERIC,
  `paid_by_patient` NUMERIC,
  `paid_patient_copay` NUMERIC,
  `paid_patient_coinsurance` NUMERIC,
  `paid_patient_deductible` NUMERIC,
  `paid_by_primary` NUMERIC,
  `paid_ingredient_cost` NUMERIC,
  `paid_dispensing_fee` NUMERIC,
  `payer_plan_period_id` integer,
  `amount_allowed` NUMERIC,
  `revenue_code_concept_id` integer,
  `revenue_code_source_value` varchar(50),
  `drg_concept_id` integer,
  `drg_source_value` varchar(3)
);

CREATE TABLE `DRUG_ERA` (
  `drug_era_id` integer PRIMARY KEY NOT NULL,
  `person_id` integer NOT NULL,
  `drug_concept_id` integer NOT NULL,
  `drug_era_start_date` TIMESTAMP NOT NULL,
  `drug_era_end_date` TIMESTAMP NOT NULL,
  `drug_exposure_count` integer,
  `gap_days` integer
);

CREATE TABLE `DOSE_ERA` (
  `dose_era_id` integer PRIMARY KEY NOT NULL,
  `person_id` integer NOT NULL,
  `drug_concept_id` integer NOT NULL,
  `unit_concept_id` integer NOT NULL,
  `dose_value` NUMERIC NOT NULL,
  `dose_era_start_date` TIMESTAMP NOT NULL,
  `dose_era_end_date` TIMESTAMP NOT NULL
);

CREATE TABLE `CONDITION_ERA` (
  `condition_era_id` integer PRIMARY KEY NOT NULL,
  `person_id` integer NOT NULL,
  `condition_concept_id` integer NOT NULL,
  `condition_era_start_date` TIMESTAMP NOT NULL,
  `condition_era_end_date` TIMESTAMP NOT NULL,
  `condition_occurrence_count` integer
);

CREATE TABLE `EPISODE` (
  `episode_id` bigint PRIMARY KEY NOT NULL,
  `person_id` bigint NOT NULL,
  `episode_concept_id` integer NOT NULL,
  `episode_start_date` date NOT NULL,
  `episode_start_datetime` TIMESTAMP,
  `episode_end_date` date,
  `episode_end_datetime` TIMESTAMP,
  `episode_parent_id` bigint,
  `episode_number` integer,
  `episode_object_concept_id` integer NOT NULL,
  `episode_type_concept_id` integer NOT NULL,
  `episode_source_value` varchar(50),
  `episode_source_concept_id` integer
);

CREATE TABLE `EPISODE_EVENT` (
  `episode_id` bigint NOT NULL,
  `event_id` bigint NOT NULL,
  `episode_event_field_concept_id` integer NOT NULL
);

CREATE TABLE `METADATA` (
  `metadata_id` integer PRIMARY KEY NOT NULL,
  `metadata_concept_id` integer NOT NULL,
  `metadata_type_concept_id` integer NOT NULL,
  `name` varchar(250) NOT NULL,
  `value_as_string` varchar(250),
  `value_as_concept_id` integer,
  `value_as_number` NUMERIC,
  `metadata_date` date,
  `metadata_datetime` TIMESTAMP
);

CREATE TABLE `CDM_SOURCE` (
  `cdm_source_name` varchar(255) NOT NULL,
  `cdm_source_abbreviation` varchar(25) NOT NULL,
  `cdm_holder` varchar(255) NOT NULL,
  `source_description` TEXT,
  `source_documentation_reference` varchar(255),
  `cdm_etl_reference` varchar(255),
  `source_release_date` date NOT NULL,
  `cdm_release_date` date NOT NULL,
  `cdm_version` varchar(10),
  `cdm_version_concept_id` integer NOT NULL,
  `vocabulary_version` varchar(20) NOT NULL
);

CREATE TABLE `CONCEPT` (
  `concept_id` integer PRIMARY KEY NOT NULL,
  `concept_name` varchar(255) NOT NULL,
  `domain_id` varchar(20) NOT NULL,
  `vocabulary_id` varchar(20) NOT NULL,
  `concept_class_id` varchar(20) NOT NULL,
  `standard_concept` varchar(1),
  `concept_code` varchar(50) NOT NULL,
  `valid_start_date` date NOT NULL,
  `valid_end_date` date NOT NULL,
  `invalid_reason` varchar(1)
);

CREATE TABLE `VOCABULARY` (
  `vocabulary_id` varchar(20) PRIMARY KEY NOT NULL,
  `vocabulary_name` varchar(255) NOT NULL,
  `vocabulary_reference` varchar(255),
  `vocabulary_version` varchar(255),
  `vocabulary_concept_id` integer NOT NULL
);

CREATE TABLE `DOMAIN` (
  `domain_id` varchar(20) PRIMARY KEY NOT NULL,
  `domain_name` varchar(255) NOT NULL,
  `domain_concept_id` integer NOT NULL
);

CREATE TABLE `CONCEPT_CLASS` (
  `concept_class_id` varchar(20) PRIMARY KEY NOT NULL,
  `concept_class_name` varchar(255) NOT NULL,
  `concept_class_concept_id` integer NOT NULL
);

CREATE TABLE `CONCEPT_RELATIONSHIP` (
  `concept_id_1` integer NOT NULL,
  `concept_id_2` integer NOT NULL,
  `relationship_id` varchar(20) NOT NULL,
  `valid_start_date` date NOT NULL,
  `valid_end_date` date NOT NULL,
  `invalid_reason` varchar(1)
);

CREATE TABLE `RELATIONSHIP` (
  `relationship_id` varchar(20) PRIMARY KEY NOT NULL,
  `relationship_name` varchar(255) NOT NULL,
  `is_hierarchical` varchar(1) NOT NULL,
  `defines_ancestry` varchar(1) NOT NULL,
  `reverse_relationship_id` varchar(20) NOT NULL,
  `relationship_concept_id` integer NOT NULL
);

CREATE TABLE `CONCEPT_SYNONYM` (
  `concept_id` integer NOT NULL,
  `concept_synonym_name` varchar(1000) NOT NULL,
  `language_concept_id` integer NOT NULL
);

CREATE TABLE `CONCEPT_ANCESTOR` (
  `ancestor_concept_id` integer NOT NULL,
  `descendant_concept_id` integer NOT NULL,
  `min_levels_of_separation` integer NOT NULL,
  `max_levels_of_separation` integer NOT NULL
);

CREATE TABLE `SOURCE_TO_CONCEPT_MAP` (
  `source_code` varchar(50) NOT NULL,
  `source_concept_id` integer NOT NULL,
  `source_vocabulary_id` varchar(20) NOT NULL,
  `source_code_description` varchar(255),
  `target_concept_id` integer NOT NULL,
  `target_vocabulary_id` varchar(20) NOT NULL,
  `valid_start_date` date NOT NULL,
  `valid_end_date` date NOT NULL,
  `invalid_reason` varchar(1)
);

CREATE TABLE `DRUG_STRENGTH` (
  `drug_concept_id` integer NOT NULL,
  `ingredient_concept_id` integer NOT NULL,
  `amount_value` NUMERIC,
  `amount_unit_concept_id` integer,
  `numerator_value` NUMERIC,
  `numerator_unit_concept_id` integer,
  `denominator_value` NUMERIC,
  `denominator_unit_concept_id` integer,
  `box_size` integer,
  `valid_start_date` date NOT NULL,
  `valid_end_date` date NOT NULL,
  `invalid_reason` varchar(1)
);

CREATE TABLE `COHORT` (
  `cohort_definition_id` integer NOT NULL,
  `subject_id` integer NOT NULL,
  `cohort_start_date` date NOT NULL,
  `cohort_end_date` date NOT NULL
);

CREATE TABLE `COHORT_DEFINITION` (
  `cohort_definition_id` integer NOT NULL,
  `cohort_definition_name` varchar(255) NOT NULL,
  `cohort_definition_description` TEXT,
  `definition_type_concept_id` integer NOT NULL,
  `cohort_definition_syntax` TEXT,
  `subject_concept_id` integer NOT NULL,
  `cohort_initiation_date` date
);

ALTER TABLE `PERSON` ADD CONSTRAINT `fpk_PERSON_gender_concept_id` FOREIGN KEY (`gender_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PERSON` ADD CONSTRAINT `fpk_PERSON_race_concept_id` FOREIGN KEY (`race_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PERSON` ADD CONSTRAINT `fpk_PERSON_ethnicity_concept_id` FOREIGN KEY (`ethnicity_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PERSON` ADD CONSTRAINT `fpk_PERSON_location_id` FOREIGN KEY (`location_id`) REFERENCES `LOCATION` (`location_id`);

ALTER TABLE `PERSON` ADD CONSTRAINT `fpk_PERSON_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `PROVIDER` (`provider_id`);

ALTER TABLE `PERSON` ADD CONSTRAINT `fpk_PERSON_care_site_id` FOREIGN KEY (`care_site_id`) REFERENCES `CARE_SITE` (`care_site_id`);

ALTER TABLE `PERSON` ADD CONSTRAINT `fpk_PERSON_gender_source_concept_id` FOREIGN KEY (`gender_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PERSON` ADD CONSTRAINT `fpk_PERSON_race_source_concept_id` FOREIGN KEY (`race_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PERSON` ADD CONSTRAINT `fpk_PERSON_ethnicity_source_concept_id` FOREIGN KEY (`ethnicity_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `OBSERVATION_PERIOD` ADD CONSTRAINT `fpk_OBSERVATION_PERIOD_person_id` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `OBSERVATION_PERIOD` ADD CONSTRAINT `fpk_OBSERVATION_PERIOD_period_type_concept_id` FOREIGN KEY (`period_type_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `VISIT_OCCURRENCE` ADD CONSTRAINT `fpk_VISIT_OCCURRENCE_person_id` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `VISIT_OCCURRENCE` ADD CONSTRAINT `fpk_VISIT_OCCURRENCE_visit_concept_id` FOREIGN KEY (`visit_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `VISIT_OCCURRENCE` ADD CONSTRAINT `fpk_VISIT_OCCURRENCE_visit_type_concept_id` FOREIGN KEY (`visit_type_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `VISIT_OCCURRENCE` ADD CONSTRAINT `fpk_VISIT_OCCURRENCE_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `PROVIDER` (`provider_id`);

ALTER TABLE `VISIT_OCCURRENCE` ADD CONSTRAINT `fpk_VISIT_OCCURRENCE_care_site_id` FOREIGN KEY (`care_site_id`) REFERENCES `CARE_SITE` (`care_site_id`);

ALTER TABLE `VISIT_OCCURRENCE` ADD CONSTRAINT `fpk_VISIT_OCCURRENCE_visit_source_concept_id` FOREIGN KEY (`visit_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `VISIT_OCCURRENCE` ADD CONSTRAINT `fpk_VISIT_OCCURRENCE_admitted_from_concept_id` FOREIGN KEY (`admitted_from_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `VISIT_OCCURRENCE` ADD CONSTRAINT `fpk_VISIT_OCCURRENCE_discharged_to_concept_id` FOREIGN KEY (`discharged_to_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `VISIT_OCCURRENCE` ADD CONSTRAINT `fpk_VISIT_OCCURRENCE_preceding_visit_occurrence_id` FOREIGN KEY (`preceding_visit_occurrence_id`) REFERENCES `VISIT_OCCURRENCE` (`visit_occurrence_id`);

ALTER TABLE `VISIT_DETAIL` ADD CONSTRAINT `fpk_VISIT_DETAIL_person_id` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `VISIT_DETAIL` ADD CONSTRAINT `fpk_VISIT_DETAIL_visit_detail_concept_id` FOREIGN KEY (`visit_detail_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `VISIT_DETAIL` ADD CONSTRAINT `fpk_VISIT_DETAIL_visit_detail_type_concept_id` FOREIGN KEY (`visit_detail_type_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `VISIT_DETAIL` ADD CONSTRAINT `fpk_VISIT_DETAIL_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `PROVIDER` (`provider_id`);

ALTER TABLE `VISIT_DETAIL` ADD CONSTRAINT `fpk_VISIT_DETAIL_care_site_id` FOREIGN KEY (`care_site_id`) REFERENCES `CARE_SITE` (`care_site_id`);

ALTER TABLE `VISIT_DETAIL` ADD CONSTRAINT `fpk_VISIT_DETAIL_visit_detail_source_concept_id` FOREIGN KEY (`visit_detail_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `VISIT_DETAIL` ADD CONSTRAINT `fpk_VISIT_DETAIL_admitted_from_concept_id` FOREIGN KEY (`admitted_from_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `VISIT_DETAIL` ADD CONSTRAINT `fpk_VISIT_DETAIL_discharged_to_concept_id` FOREIGN KEY (`discharged_to_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `VISIT_DETAIL` ADD CONSTRAINT `fpk_VISIT_DETAIL_preceding_visit_detail_id` FOREIGN KEY (`preceding_visit_detail_id`) REFERENCES `VISIT_DETAIL` (`visit_detail_id`);

ALTER TABLE `VISIT_DETAIL` ADD CONSTRAINT `fpk_VISIT_DETAIL_parent_visit_detail_id` FOREIGN KEY (`parent_visit_detail_id`) REFERENCES `VISIT_DETAIL` (`visit_detail_id`);

ALTER TABLE `VISIT_DETAIL` ADD CONSTRAINT `fpk_VISIT_DETAIL_visit_occurrence_id` FOREIGN KEY (`visit_occurrence_id`) REFERENCES `VISIT_OCCURRENCE` (`visit_occurrence_id`);

ALTER TABLE `CONDITION_OCCURRENCE` ADD CONSTRAINT `fpk_CONDITION_OCCURRENCE_person_id` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `CONDITION_OCCURRENCE` ADD CONSTRAINT `fpk_CONDITION_OCCURRENCE_condition_concept_id` FOREIGN KEY (`condition_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `CONDITION_OCCURRENCE` ADD CONSTRAINT `fpk_CONDITION_OCCURRENCE_condition_type_concept_id` FOREIGN KEY (`condition_type_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `CONDITION_OCCURRENCE` ADD CONSTRAINT `fpk_CONDITION_OCCURRENCE_condition_status_concept_id` FOREIGN KEY (`condition_status_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `CONDITION_OCCURRENCE` ADD CONSTRAINT `fpk_CONDITION_OCCURRENCE_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `PROVIDER` (`provider_id`);

ALTER TABLE `CONDITION_OCCURRENCE` ADD CONSTRAINT `fpk_CONDITION_OCCURRENCE_visit_occurrence_id` FOREIGN KEY (`visit_occurrence_id`) REFERENCES `VISIT_OCCURRENCE` (`visit_occurrence_id`);

ALTER TABLE `CONDITION_OCCURRENCE` ADD CONSTRAINT `fpk_CONDITION_OCCURRENCE_visit_detail_id` FOREIGN KEY (`visit_detail_id`) REFERENCES `VISIT_DETAIL` (`visit_detail_id`);

ALTER TABLE `CONDITION_OCCURRENCE` ADD CONSTRAINT `fpk_CONDITION_OCCURRENCE_condition_source_concept_id` FOREIGN KEY (`condition_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DRUG_EXPOSURE` ADD CONSTRAINT `fpk_DRUG_EXPOSURE_person_id` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `DRUG_EXPOSURE` ADD CONSTRAINT `fpk_DRUG_EXPOSURE_drug_concept_id` FOREIGN KEY (`drug_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DRUG_EXPOSURE` ADD CONSTRAINT `fpk_DRUG_EXPOSURE_drug_type_concept_id` FOREIGN KEY (`drug_type_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DRUG_EXPOSURE` ADD CONSTRAINT `fpk_DRUG_EXPOSURE_route_concept_id` FOREIGN KEY (`route_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DRUG_EXPOSURE` ADD CONSTRAINT `fpk_DRUG_EXPOSURE_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `PROVIDER` (`provider_id`);

ALTER TABLE `DRUG_EXPOSURE` ADD CONSTRAINT `fpk_DRUG_EXPOSURE_visit_occurrence_id` FOREIGN KEY (`visit_occurrence_id`) REFERENCES `VISIT_OCCURRENCE` (`visit_occurrence_id`);

ALTER TABLE `DRUG_EXPOSURE` ADD CONSTRAINT `fpk_DRUG_EXPOSURE_visit_detail_id` FOREIGN KEY (`visit_detail_id`) REFERENCES `VISIT_DETAIL` (`visit_detail_id`);

ALTER TABLE `DRUG_EXPOSURE` ADD CONSTRAINT `fpk_DRUG_EXPOSURE_drug_source_concept_id` FOREIGN KEY (`drug_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PROCEDURE_OCCURRENCE` ADD CONSTRAINT `fpk_PROCEDURE_OCCURRENCE_person_id` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `PROCEDURE_OCCURRENCE` ADD CONSTRAINT `fpk_PROCEDURE_OCCURRENCE_procedure_concept_id` FOREIGN KEY (`procedure_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PROCEDURE_OCCURRENCE` ADD CONSTRAINT `fpk_PROCEDURE_OCCURRENCE_procedure_type_concept_id` FOREIGN KEY (`procedure_type_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PROCEDURE_OCCURRENCE` ADD CONSTRAINT `fpk_PROCEDURE_OCCURRENCE_modifier_concept_id` FOREIGN KEY (`modifier_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PROCEDURE_OCCURRENCE` ADD CONSTRAINT `fpk_PROCEDURE_OCCURRENCE_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `PROVIDER` (`provider_id`);

ALTER TABLE `PROCEDURE_OCCURRENCE` ADD CONSTRAINT `fpk_PROCEDURE_OCCURRENCE_visit_occurrence_id` FOREIGN KEY (`visit_occurrence_id`) REFERENCES `VISIT_OCCURRENCE` (`visit_occurrence_id`);

ALTER TABLE `PROCEDURE_OCCURRENCE` ADD CONSTRAINT `fpk_PROCEDURE_OCCURRENCE_visit_detail_id` FOREIGN KEY (`visit_detail_id`) REFERENCES `VISIT_DETAIL` (`visit_detail_id`);

ALTER TABLE `PROCEDURE_OCCURRENCE` ADD CONSTRAINT `fpk_PROCEDURE_OCCURRENCE_procedure_source_concept_id` FOREIGN KEY (`procedure_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DEVICE_EXPOSURE` ADD CONSTRAINT `fpk_DEVICE_EXPOSURE_person_id` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `DEVICE_EXPOSURE` ADD CONSTRAINT `fpk_DEVICE_EXPOSURE_device_concept_id` FOREIGN KEY (`device_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DEVICE_EXPOSURE` ADD CONSTRAINT `fpk_DEVICE_EXPOSURE_device_type_concept_id` FOREIGN KEY (`device_type_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DEVICE_EXPOSURE` ADD CONSTRAINT `fpk_DEVICE_EXPOSURE_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `PROVIDER` (`provider_id`);

ALTER TABLE `DEVICE_EXPOSURE` ADD CONSTRAINT `fpk_DEVICE_EXPOSURE_visit_occurrence_id` FOREIGN KEY (`visit_occurrence_id`) REFERENCES `VISIT_OCCURRENCE` (`visit_occurrence_id`);

ALTER TABLE `DEVICE_EXPOSURE` ADD CONSTRAINT `fpk_DEVICE_EXPOSURE_visit_detail_id` FOREIGN KEY (`visit_detail_id`) REFERENCES `VISIT_DETAIL` (`visit_detail_id`);

ALTER TABLE `DEVICE_EXPOSURE` ADD CONSTRAINT `fpk_DEVICE_EXPOSURE_device_source_concept_id` FOREIGN KEY (`device_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DEVICE_EXPOSURE` ADD CONSTRAINT `fpk_DEVICE_EXPOSURE_unit_concept_id` FOREIGN KEY (`unit_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DEVICE_EXPOSURE` ADD CONSTRAINT `fpk_DEVICE_EXPOSURE_unit_source_concept_id` FOREIGN KEY (`unit_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `MEASUREMENT` ADD CONSTRAINT `fpk_MEASUREMENT_person_id` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `MEASUREMENT` ADD CONSTRAINT `fpk_MEASUREMENT_measurement_concept_id` FOREIGN KEY (`measurement_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `MEASUREMENT` ADD CONSTRAINT `fpk_MEASUREMENT_measurement_type_concept_id` FOREIGN KEY (`measurement_type_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `MEASUREMENT` ADD CONSTRAINT `fpk_MEASUREMENT_operator_concept_id` FOREIGN KEY (`operator_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `MEASUREMENT` ADD CONSTRAINT `fpk_MEASUREMENT_value_as_concept_id` FOREIGN KEY (`value_as_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `MEASUREMENT` ADD CONSTRAINT `fpk_MEASUREMENT_unit_concept_id` FOREIGN KEY (`unit_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `MEASUREMENT` ADD CONSTRAINT `fpk_MEASUREMENT_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `PROVIDER` (`provider_id`);

ALTER TABLE `MEASUREMENT` ADD CONSTRAINT `fpk_MEASUREMENT_visit_occurrence_id` FOREIGN KEY (`visit_occurrence_id`) REFERENCES `VISIT_OCCURRENCE` (`visit_occurrence_id`);

ALTER TABLE `MEASUREMENT` ADD CONSTRAINT `fpk_MEASUREMENT_visit_detail_id` FOREIGN KEY (`visit_detail_id`) REFERENCES `VISIT_DETAIL` (`visit_detail_id`);

ALTER TABLE `MEASUREMENT` ADD CONSTRAINT `fpk_MEASUREMENT_measurement_source_concept_id` FOREIGN KEY (`measurement_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `MEASUREMENT` ADD CONSTRAINT `fpk_MEASUREMENT_unit_source_concept_id` FOREIGN KEY (`unit_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `MEASUREMENT` ADD CONSTRAINT `fpk_MEASUREMENT_meas_event_field_concept_id` FOREIGN KEY (`meas_event_field_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `OBSERVATION` ADD CONSTRAINT `fpk_OBSERVATION_person_id` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `OBSERVATION` ADD CONSTRAINT `fpk_OBSERVATION_observation_concept_id` FOREIGN KEY (`observation_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `OBSERVATION` ADD CONSTRAINT `fpk_OBSERVATION_observation_type_concept_id` FOREIGN KEY (`observation_type_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `OBSERVATION` ADD CONSTRAINT `fpk_OBSERVATION_value_as_concept_id` FOREIGN KEY (`value_as_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `OBSERVATION` ADD CONSTRAINT `fpk_OBSERVATION_qualifier_concept_id` FOREIGN KEY (`qualifier_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `OBSERVATION` ADD CONSTRAINT `fpk_OBSERVATION_unit_concept_id` FOREIGN KEY (`unit_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `OBSERVATION` ADD CONSTRAINT `fpk_OBSERVATION_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `PROVIDER` (`provider_id`);

ALTER TABLE `OBSERVATION` ADD CONSTRAINT `fpk_OBSERVATION_visit_occurrence_id` FOREIGN KEY (`visit_occurrence_id`) REFERENCES `VISIT_OCCURRENCE` (`visit_occurrence_id`);

ALTER TABLE `OBSERVATION` ADD CONSTRAINT `fpk_OBSERVATION_visit_detail_id` FOREIGN KEY (`visit_detail_id`) REFERENCES `VISIT_DETAIL` (`visit_detail_id`);

ALTER TABLE `OBSERVATION` ADD CONSTRAINT `fpk_OBSERVATION_observation_source_concept_id` FOREIGN KEY (`observation_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `OBSERVATION` ADD CONSTRAINT `fpk_OBSERVATION_obs_event_field_concept_id` FOREIGN KEY (`obs_event_field_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DEATH` ADD CONSTRAINT `fpk_DEATH_person_id` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `DEATH` ADD CONSTRAINT `fpk_DEATH_death_type_concept_id` FOREIGN KEY (`death_type_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DEATH` ADD CONSTRAINT `fpk_DEATH_cause_concept_id` FOREIGN KEY (`cause_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DEATH` ADD CONSTRAINT `fpk_DEATH_cause_source_concept_id` FOREIGN KEY (`cause_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `NOTE` ADD CONSTRAINT `fpk_NOTE_person_id` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `NOTE` ADD CONSTRAINT `fpk_NOTE_note_type_concept_id` FOREIGN KEY (`note_type_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `NOTE` ADD CONSTRAINT `fpk_NOTE_note_class_concept_id` FOREIGN KEY (`note_class_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `NOTE` ADD CONSTRAINT `fpk_NOTE_encoding_concept_id` FOREIGN KEY (`encoding_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `NOTE` ADD CONSTRAINT `fpk_NOTE_language_concept_id` FOREIGN KEY (`language_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `NOTE` ADD CONSTRAINT `fpk_NOTE_provider_id` FOREIGN KEY (`provider_id`) REFERENCES `PROVIDER` (`provider_id`);

ALTER TABLE `NOTE` ADD CONSTRAINT `fpk_NOTE_visit_occurrence_id` FOREIGN KEY (`visit_occurrence_id`) REFERENCES `VISIT_OCCURRENCE` (`visit_occurrence_id`);

ALTER TABLE `NOTE` ADD CONSTRAINT `fpk_NOTE_visit_detail_id` FOREIGN KEY (`visit_detail_id`) REFERENCES `VISIT_DETAIL` (`visit_detail_id`);

ALTER TABLE `NOTE` ADD CONSTRAINT `fpk_NOTE_note_event_field_concept_id` FOREIGN KEY (`note_event_field_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `NOTE_NLP` ADD CONSTRAINT `fpk_NOTE_NLP_section_concept_id` FOREIGN KEY (`section_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `NOTE_NLP` ADD CONSTRAINT `fpk_NOTE_NLP_note_nlp_concept_id` FOREIGN KEY (`note_nlp_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `NOTE_NLP` ADD CONSTRAINT `fpk_NOTE_NLP_note_nlp_source_concept_id` FOREIGN KEY (`note_nlp_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `SPECIMEN` ADD CONSTRAINT `fpk_SPECIMEN_person_id` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `SPECIMEN` ADD CONSTRAINT `fpk_SPECIMEN_specimen_concept_id` FOREIGN KEY (`specimen_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `SPECIMEN` ADD CONSTRAINT `fpk_SPECIMEN_specimen_type_concept_id` FOREIGN KEY (`specimen_type_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `SPECIMEN` ADD CONSTRAINT `fpk_SPECIMEN_unit_concept_id` FOREIGN KEY (`unit_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `SPECIMEN` ADD CONSTRAINT `fpk_SPECIMEN_anatomic_site_concept_id` FOREIGN KEY (`anatomic_site_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `SPECIMEN` ADD CONSTRAINT `fpk_SPECIMEN_disease_status_concept_id` FOREIGN KEY (`disease_status_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `FACT_RELATIONSHIP` ADD CONSTRAINT `fpk_FACT_RELATIONSHIP_domain_concept_id_1` FOREIGN KEY (`domain_concept_id_1`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `FACT_RELATIONSHIP` ADD CONSTRAINT `fpk_FACT_RELATIONSHIP_domain_concept_id_2` FOREIGN KEY (`domain_concept_id_2`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `FACT_RELATIONSHIP` ADD CONSTRAINT `fpk_FACT_RELATIONSHIP_relationship_concept_id` FOREIGN KEY (`relationship_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `LOCATION` ADD CONSTRAINT `fpk_LOCATION_country_concept_id` FOREIGN KEY (`country_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `CARE_SITE` ADD CONSTRAINT `fpk_CARE_SITE_place_of_service_concept_id` FOREIGN KEY (`place_of_service_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `CARE_SITE` ADD CONSTRAINT `fpk_CARE_SITE_location_id` FOREIGN KEY (`location_id`) REFERENCES `LOCATION` (`location_id`);

ALTER TABLE `PROVIDER` ADD CONSTRAINT `fpk_PROVIDER_specialty_concept_id` FOREIGN KEY (`specialty_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PROVIDER` ADD CONSTRAINT `fpk_PROVIDER_care_site_id` FOREIGN KEY (`care_site_id`) REFERENCES `CARE_SITE` (`care_site_id`);

ALTER TABLE `PROVIDER` ADD CONSTRAINT `fpk_PROVIDER_gender_concept_id` FOREIGN KEY (`gender_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PROVIDER` ADD CONSTRAINT `fpk_PROVIDER_specialty_source_concept_id` FOREIGN KEY (`specialty_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PROVIDER` ADD CONSTRAINT `fpk_PROVIDER_gender_source_concept_id` FOREIGN KEY (`gender_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PAYER_PLAN_PERIOD` ADD CONSTRAINT `fpk_PAYER_PLAN_PERIOD_payer_plan_period_id` FOREIGN KEY (`payer_plan_period_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `PAYER_PLAN_PERIOD` ADD CONSTRAINT `fpk_PAYER_PLAN_PERIOD_person_id` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `PAYER_PLAN_PERIOD` ADD CONSTRAINT `fpk_PAYER_PLAN_PERIOD_payer_concept_id` FOREIGN KEY (`payer_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PAYER_PLAN_PERIOD` ADD CONSTRAINT `fpk_PAYER_PLAN_PERIOD_payer_source_concept_id` FOREIGN KEY (`payer_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PAYER_PLAN_PERIOD` ADD CONSTRAINT `fpk_PAYER_PLAN_PERIOD_plan_concept_id` FOREIGN KEY (`plan_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PAYER_PLAN_PERIOD` ADD CONSTRAINT `fpk_PAYER_PLAN_PERIOD_plan_source_concept_id` FOREIGN KEY (`plan_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PAYER_PLAN_PERIOD` ADD CONSTRAINT `fpk_PAYER_PLAN_PERIOD_sponsor_concept_id` FOREIGN KEY (`sponsor_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PAYER_PLAN_PERIOD` ADD CONSTRAINT `fpk_PAYER_PLAN_PERIOD_sponsor_source_concept_id` FOREIGN KEY (`sponsor_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PAYER_PLAN_PERIOD` ADD CONSTRAINT `fpk_PAYER_PLAN_PERIOD_stop_reason_concept_id` FOREIGN KEY (`stop_reason_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `PAYER_PLAN_PERIOD` ADD CONSTRAINT `fpk_PAYER_PLAN_PERIOD_stop_reason_source_concept_id` FOREIGN KEY (`stop_reason_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `COST` ADD CONSTRAINT `fpk_COST_cost_domain_id` FOREIGN KEY (`cost_domain_id`) REFERENCES `DOMAIN` (`domain_id`);

ALTER TABLE `COST` ADD CONSTRAINT `fpk_COST_cost_type_concept_id` FOREIGN KEY (`cost_type_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `COST` ADD CONSTRAINT `fpk_COST_currency_concept_id` FOREIGN KEY (`currency_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `COST` ADD CONSTRAINT `fpk_COST_revenue_code_concept_id` FOREIGN KEY (`revenue_code_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `COST` ADD CONSTRAINT `fpk_COST_drg_concept_id` FOREIGN KEY (`drg_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DRUG_ERA` ADD CONSTRAINT `fpk_DRUG_ERA_person_id` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `DRUG_ERA` ADD CONSTRAINT `fpk_DRUG_ERA_drug_concept_id` FOREIGN KEY (`drug_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DOSE_ERA` ADD CONSTRAINT `fpk_DOSE_ERA_person_id` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `DOSE_ERA` ADD CONSTRAINT `fpk_DOSE_ERA_drug_concept_id` FOREIGN KEY (`drug_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DOSE_ERA` ADD CONSTRAINT `fpk_DOSE_ERA_unit_concept_id` FOREIGN KEY (`unit_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `CONDITION_ERA` ADD CONSTRAINT `fpk_CONDITION_ERA_person_id` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `CONDITION_ERA` ADD CONSTRAINT `fpk_CONDITION_ERA_condition_concept_id` FOREIGN KEY (`condition_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `EPISODE` ADD CONSTRAINT `fpk_EPISODE_person_id` FOREIGN KEY (`person_id`) REFERENCES `PERSON` (`person_id`);

ALTER TABLE `EPISODE` ADD CONSTRAINT `fpk_EPISODE_episode_concept_id` FOREIGN KEY (`episode_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `EPISODE` ADD CONSTRAINT `fpk_EPISODE_episode_object_concept_id` FOREIGN KEY (`episode_object_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `EPISODE` ADD CONSTRAINT `fpk_EPISODE_episode_type_concept_id` FOREIGN KEY (`episode_type_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `EPISODE` ADD CONSTRAINT `fpk_EPISODE_episode_source_concept_id` FOREIGN KEY (`episode_source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `EPISODE_EVENT` ADD CONSTRAINT `fpk_EPISODE_EVENT_episode_id` FOREIGN KEY (`episode_id`) REFERENCES `EPISODE` (`episode_id`);

ALTER TABLE `EPISODE_EVENT` ADD CONSTRAINT `fpk_EPISODE_EVENT_episode_event_field_concept_id` FOREIGN KEY (`episode_event_field_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `METADATA` ADD CONSTRAINT `fpk_METADATA_metadata_concept_id` FOREIGN KEY (`metadata_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `METADATA` ADD CONSTRAINT `fpk_METADATA_metadata_type_concept_id` FOREIGN KEY (`metadata_type_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `METADATA` ADD CONSTRAINT `fpk_METADATA_value_as_concept_id` FOREIGN KEY (`value_as_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `CDM_SOURCE` ADD CONSTRAINT `fpk_CDM_SOURCE_cdm_version_concept_id` FOREIGN KEY (`cdm_version_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `CONCEPT` ADD CONSTRAINT `fpk_CONCEPT_domain_id` FOREIGN KEY (`domain_id`) REFERENCES `DOMAIN` (`domain_id`);

ALTER TABLE `CONCEPT` ADD CONSTRAINT `fpk_CONCEPT_vocabulary_id` FOREIGN KEY (`vocabulary_id`) REFERENCES `VOCABULARY` (`vocabulary_id`);

ALTER TABLE `CONCEPT` ADD CONSTRAINT `fpk_CONCEPT_concept_class_id` FOREIGN KEY (`concept_class_id`) REFERENCES `CONCEPT_CLASS` (`concept_class_id`);

ALTER TABLE `VOCABULARY` ADD CONSTRAINT `fpk_VOCABULARY_vocabulary_concept_id` FOREIGN KEY (`vocabulary_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DOMAIN` ADD CONSTRAINT `fpk_DOMAIN_domain_concept_id` FOREIGN KEY (`domain_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `CONCEPT_CLASS` ADD CONSTRAINT `fpk_CONCEPT_CLASS_concept_class_concept_id` FOREIGN KEY (`concept_class_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `CONCEPT_RELATIONSHIP` ADD CONSTRAINT `fpk_CONCEPT_RELATIONSHIP_concept_id_1` FOREIGN KEY (`concept_id_1`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `CONCEPT_RELATIONSHIP` ADD CONSTRAINT `fpk_CONCEPT_RELATIONSHIP_concept_id_2` FOREIGN KEY (`concept_id_2`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `CONCEPT_RELATIONSHIP` ADD CONSTRAINT `fpk_CONCEPT_RELATIONSHIP_relationship_id` FOREIGN KEY (`relationship_id`) REFERENCES `RELATIONSHIP` (`relationship_id`);

ALTER TABLE `RELATIONSHIP` ADD CONSTRAINT `fpk_RELATIONSHIP_relationship_concept_id` FOREIGN KEY (`relationship_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `CONCEPT_SYNONYM` ADD CONSTRAINT `fpk_CONCEPT_SYNONYM_concept_id` FOREIGN KEY (`concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `CONCEPT_SYNONYM` ADD CONSTRAINT `fpk_CONCEPT_SYNONYM_language_concept_id` FOREIGN KEY (`language_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `CONCEPT_ANCESTOR` ADD CONSTRAINT `fpk_CONCEPT_ANCESTOR_ancestor_concept_id` FOREIGN KEY (`ancestor_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `CONCEPT_ANCESTOR` ADD CONSTRAINT `fpk_CONCEPT_ANCESTOR_descendant_concept_id` FOREIGN KEY (`descendant_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `SOURCE_TO_CONCEPT_MAP` ADD CONSTRAINT `fpk_SOURCE_TO_CONCEPT_MAP_source_concept_id` FOREIGN KEY (`source_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `SOURCE_TO_CONCEPT_MAP` ADD CONSTRAINT `fpk_SOURCE_TO_CONCEPT_MAP_target_concept_id` FOREIGN KEY (`target_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `SOURCE_TO_CONCEPT_MAP` ADD CONSTRAINT `fpk_SOURCE_TO_CONCEPT_MAP_target_vocabulary_id` FOREIGN KEY (`target_vocabulary_id`) REFERENCES `VOCABULARY` (`vocabulary_id`);

ALTER TABLE `DRUG_STRENGTH` ADD CONSTRAINT `fpk_DRUG_STRENGTH_drug_concept_id` FOREIGN KEY (`drug_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DRUG_STRENGTH` ADD CONSTRAINT `fpk_DRUG_STRENGTH_ingredient_concept_id` FOREIGN KEY (`ingredient_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DRUG_STRENGTH` ADD CONSTRAINT `fpk_DRUG_STRENGTH_amount_unit_concept_id` FOREIGN KEY (`amount_unit_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DRUG_STRENGTH` ADD CONSTRAINT `fpk_DRUG_STRENGTH_numerator_unit_concept_id` FOREIGN KEY (`numerator_unit_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `DRUG_STRENGTH` ADD CONSTRAINT `fpk_DRUG_STRENGTH_denominator_unit_concept_id` FOREIGN KEY (`denominator_unit_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `COHORT_DEFINITION` ADD CONSTRAINT `fpk_COHORT_DEFINITION_cohort_definition_id` FOREIGN KEY (`cohort_definition_id`) REFERENCES `COHORT` (`cohort_definition_id`);

ALTER TABLE `COHORT_DEFINITION` ADD CONSTRAINT `fpk_COHORT_DEFINITION_definition_type_concept_id` FOREIGN KEY (`definition_type_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

ALTER TABLE `COHORT_DEFINITION` ADD CONSTRAINT `fpk_COHORT_DEFINITION_subject_concept_id` FOREIGN KEY (`subject_concept_id`) REFERENCES `CONCEPT` (`concept_id`);

CREATE DATABASE bms;

\c bms;

CREATE TABLE dummy (
    STUDYSUBJECTID TEXT PRIMARY KEY,
    PROTOCOLID TEXT,
    INTERVIEWDATE TEXT,
    CRFVERSIONSTATUS TEXT,
    VERSIONNAME TEXT,
    GENDER TEXT,
    HISTOLOGY TEXT,
    HISTOLOGY_SPEC TEXT,
    AUTO_IMMUNE TEXT,
    SMOKING TEXT,
    PACKYEARS_SMOKER TEXT,
    PACKYEARS_EX_SMOKER TEXT,
    PREV_TRT TEXT,
    PREV_TRT_INTENT TEXT,
    DATE_CHESTRT_END TEXT,
    DOSE_CHESTRT TEXT,
    DATE_INIT_ANTI_PDL1 TEXT,
    AGE INTEGER,
    WHOPFS TEXT,
    KARNOFSKI TEXT,
    COPD TEXT,
    COPD_CLASS TEXT,
    DIABETES TEXT,
    HYPERTENSION TEXT,
    CARDIOVASCULAR TEXT,
    CARDIOVASCULAR_SPEC TEXT,
    OTHER_COMORB TEXT,
    BMI TEXT,
    ANTI_PDL1_MED TEXT,
    ANTI_PDL1_DOSE TEXT,
    ANTI_PDL1_SCHEDULE TEXT,
    DYSPNEA_DATE TEXT,
    DYSPNEA_GRADE TEXT,
    SYST_TRT_PNEUMONITIS TEXT,
    DOSE_SYST_TRT_CORT TEXT,
    DURATION_SYST_TRT_CORT TEXT,
    DOSE_SYST_TRT_AB TEXT,
    DURATION_SYST_TRT_AB TEXT,
    OTHER_SYST_TRT_PNEUMONITIS TEXT,
    CLIN_CAUSE_PNEUMONITIS TEXT,
    CLIN_OTHER_CAUSE_PNEUMONITIS TEXT,
    RAD_CAUSE_PNEUMONITIS TEXT,
    RAD_OTHER_CAUSE_PNEUMONITIS TEXT,
    COURSE_PNEUMONITIS TEXT,
    ULT_CAUSE_PNEUMONITIS TEXT,
    ULT_OTHER_CAUSE_PNEUMONITIS TEXT
);

CREATE TABLE dummy_subset (
    MY_ID TEXT PRIMARY KEY,
    STUDYSUBJECTID TEXT,
    TMPVAR TEXT,
    FOREIGN KEY (STUDYSUBJECTID) REFERENCES dummy(STUDYSUBJECTID)
);

INSERT INTO dummy (STUDYSUBJECTID, PROTOCOLID, INTERVIEWDATE, CRFVERSIONSTATUS, VERSIONNAME, GENDER, HISTOLOGY, HISTOLOGY_SPEC, AUTO_IMMUNE, SMOKING, PACKYEARS_SMOKER, PACKYEARS_EX_SMOKER, PREV_TRT, PREV_TRT_INTENT, DATE_CHESTRT_END, DOSE_CHESTRT, DATE_INIT_ANTI_PDL1, AGE, WHOPFS, KARNOFSKI, COPD, COPD_CLASS, DIABETES, HYPERTENSION, CARDIOVASCULAR, CARDIOVASCULAR_SPEC, OTHER_COMORB, BMI, ANTI_PDL1_MED, ANTI_PDL1_DOSE, ANTI_PDL1_SCHEDULE, DYSPNEA_DATE, DYSPNEA_GRADE, SYST_TRT_PNEUMONITIS, DOSE_SYST_TRT_CORT, DURATION_SYST_TRT_CORT, DOSE_SYST_TRT_AB, DURATION_SYST_TRT_AB, OTHER_SYST_TRT_PNEUMONITIS, CLIN_CAUSE_PNEUMONITIS, CLIN_OTHER_CAUSE_PNEUMONITIS, RAD_CAUSE_PNEUMONITIS, RAD_OTHER_CAUSE_PNEUMONITIS, COURSE_PNEUMONITIS, ULT_CAUSE_PNEUMONITIS, ULT_OTHER_CAUSE_PNEUMONITIS) VALUES ('99', 'NCT03305380', '01/02/1977', 'data entry complete', '1.0', '1', '0', 'some tekst', '0', '0', '10', ' ', '1,3', '1', '01/01/2000', '50', '01/01/2000', '50', '1', '100', '0', ' ', '1', '0', '1', 'Acute myocardinfarct', '0', '22', '0', '258', '2', '01/01/2000', '5', '0,1', '50', '8', '400', ' ', 'Special 1', ' ', ' ', ' ', ' ', '1', '1', ' ');
INSERT INTO dummy (STUDYSUBJECTID, PROTOCOLID, INTERVIEWDATE, CRFVERSIONSTATUS, VERSIONNAME, GENDER, HISTOLOGY, HISTOLOGY_SPEC, AUTO_IMMUNE, SMOKING, PACKYEARS_SMOKER, PACKYEARS_EX_SMOKER, PREV_TRT, PREV_TRT_INTENT, DATE_CHESTRT_END, DOSE_CHESTRT, DATE_INIT_ANTI_PDL1, AGE, WHOPFS, KARNOFSKI, COPD, COPD_CLASS, DIABETES, HYPERTENSION, CARDIOVASCULAR, CARDIOVASCULAR_SPEC, OTHER_COMORB, BMI, ANTI_PDL1_MED, ANTI_PDL1_DOSE, ANTI_PDL1_SCHEDULE, DYSPNEA_DATE, DYSPNEA_GRADE, SYST_TRT_PNEUMONITIS, DOSE_SYST_TRT_CORT, DURATION_SYST_TRT_CORT, DOSE_SYST_TRT_AB, DURATION_SYST_TRT_AB, OTHER_SYST_TRT_PNEUMONITIS, CLIN_CAUSE_PNEUMONITIS, CLIN_OTHER_CAUSE_PNEUMONITIS, RAD_CAUSE_PNEUMONITIS, RAD_OTHER_CAUSE_PNEUMONITIS, COURSE_PNEUMONITIS, ULT_CAUSE_PNEUMONITIS, ULT_OTHER_CAUSE_PNEUMONITIS) VALUES ('88', 'NCT03305380 - NCT03305380_MUMC', '01/02/1977', 'initial data entry', '1.0', '1', '1', '0', '1', '1', ' ', '15', '0,1,3', '0', '01/01/2000', '50', '01/01/2000', '80', '3', '50', '1', '99', '0', '0', '0', ' ', '0', '27', '1', '255', '1', '01/01/2000', '3', '0,1', '30', '7', ' ', '10', ' ', '0', ' ', '0', ' ', '3', '2', ' ');
INSERT INTO dummy (STUDYSUBJECTID, PROTOCOLID, INTERVIEWDATE, CRFVERSIONSTATUS, VERSIONNAME, GENDER, HISTOLOGY, HISTOLOGY_SPEC, AUTO_IMMUNE, SMOKING, PACKYEARS_SMOKER, PACKYEARS_EX_SMOKER, PREV_TRT, PREV_TRT_INTENT, DATE_CHESTRT_END, DOSE_CHESTRT, DATE_INIT_ANTI_PDL1, AGE, WHOPFS, KARNOFSKI, COPD, COPD_CLASS, DIABETES, HYPERTENSION, CARDIOVASCULAR, CARDIOVASCULAR_SPEC, OTHER_COMORB, BMI, ANTI_PDL1_MED, ANTI_PDL1_DOSE, ANTI_PDL1_SCHEDULE, DYSPNEA_DATE, DYSPNEA_GRADE, SYST_TRT_PNEUMONITIS, DOSE_SYST_TRT_CORT, DURATION_SYST_TRT_CORT, DOSE_SYST_TRT_AB, DURATION_SYST_TRT_AB, OTHER_SYST_TRT_PNEUMONITIS, CLIN_CAUSE_PNEUMONITIS, CLIN_OTHER_CAUSE_PNEUMONITIS, RAD_CAUSE_PNEUMONITIS, RAD_OTHER_CAUSE_PNEUMONITIS, COURSE_PNEUMONITIS, ULT_CAUSE_PNEUMONITIS, ULT_OTHER_CAUSE_PNEUMONITIS) VALUES ('77', 'NCT03305380 - NCT03305380_MUMC', '01/02/1977', 'initial data entry', '1.0', '0', '2', ' ', '0', '2', ' ', ' ', '1', '1', '01/01/2000', '50', '01/01/2000', '40', '4', '10', '0', ' ', '0', '1', '0', ' ', '0', '25', '2', '235', '0', '01/01/2000', '1', '0,1', '60', ' ', '4500', '7', ' ', '3', 'pneumonitis bij crizotinib/ bacteriele pneumonitis', '3', 'pneumonitis bij crizotinib/ bacteriele pneumonitis', '4', '3', 'pneumonitis bij crizotinib/ bacteriele pneumonitis');

INSERT INTO dummy_subset (MY_ID, STUDYSUBJECTID, TMPVAR) VALUES ('1', '88', 'myTest');
INSERT INTO dummy_subset (MY_ID, STUDYSUBJECTID, TMPVAR) VALUES ('2', '88', 'myTestTwo');
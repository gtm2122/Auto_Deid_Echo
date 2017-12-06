function mask_dicom(main_fold,dest_dir)
    info_tags = {}
    sub_fold = dir(main_fold);
    
    try
        mkdir(dest_dir);
    catch
        aaaa=0;
    end
    
    save_dir = dest_dir;
    
    save_dir = strcat(save_dir,'/');
    
    num_sub_fold = length(sub_fold)
    unique_file_names = {}
    dicom_tags_phi = {'AcquisitionContextSeq','ActualHumanPerformersSequence','AdmissionID','Arbitrary','AuthorObserverSequence','BranchOfService','ConfidentialityPatientData','ContentCreatorsIdCodeSeq','ContentSeq','CountryOfResidence','CurrentPatientLocation','curves','CustodialOrganizationSeq','DataSetTrailingPadding','DigitalSignaturesSeq','DigitalSignatureUID','DistributionAddress','DistributionName','GraphicAnnotationSequence','HumanPerformersName','HumanPerformersOrganization','IconImageSequence','ImagePresentationComments','InstitutionAddress','InstitutionalDepartmentName','InstitutionCodeSequence','InstitutionName','InsurancePlanIdentification','IntendedRecipientsOfResultsIDSequence','InterpretationApproverSequence','InterpretationAuthor','InterpretationIdIssuer','InterpretationRecorder','InterpretationTranscriber','IssuerOfAdmissionID','IssuerOfPatientID','IssuerOfServiceEpisodeId','MAC','MedicalRecordLocator','MilitaryRank','ModifiedAttributesSequence','ModifiedImageDescription','ModifyingDeviceID','ModifyingDeviceManufacturer','NameOfPhysicianReadingStudy','NamesOfIntendedRecipientsOfResults','OperatorName','OperatorsIdentificationSeq','OrderCallbackPhoneNumber','OrderEnteredBy','OrderEntererLocation','OriginalAttributesSequence','OtherPatientIDs','OtherPatientIDsSeq','OtherPatientNames','overlays','ParticipantSequence','PatientAddress','PatientBirthName','PatientBirthTime','PatientInstitutionResidence','PatientInsurancePlanCodeSeq','PatientMotherBirthName','PatientPhoneNumbers','PatientPrimaryLanguageCodeSeq','PatientPrimaryLanguageModifierCodeSeq','PatientReligiousPreference','PatientTransportArrangements','PerformedLocation','PerformingPhysicianIdSeq','PerformingPhysicianName','PersonAddress','PersonIdCodeSequence','PersonTelephoneNumbers','PhysicianApprovingInterpretation','PhysicianOfRecord','PhysicianOfRecordIdSeq','PhysicianReadingStudyIdSeq','PPSID','RefDigitalSignatureSeq','ReferencedPatientAliasSeq','ReferringPhysicianAddress','ReferringPhysicianPhoneNumbers','ReferringPhysiciansIDSeq','RefImageSeq','RefPatientSeq','RefPPSSeq','RefSOPInstanceMACSeq','RefStudySeq','RegionOfResidence','RequestAttributesSeq','RequestedProcedureID','RequestedProcedureLocation','RequestingPhysician','RequestingService','ResponsibleOrganization','ResponsiblePerson','ResultsDistributionListSeq','ResultsIDIssuer','ReviewerName','ScheduledHumanPerformersSeq','ScheduledPatientInstitutionResidence','ScheduledPerformingPhysicianIDSeq','ScheduledPerformingPhysicianName','ServiceEpisodeID','SourceImageSeq','StationName','StudyIDIssuer','TextComments','TextString','TimezoneOffsetFromUTC','TopicAuthor','TopicKeyWords','TopicSubject','TopicTitle','VerifyingObserverIdentificationCodeSeq','VerifyingObserverSequence','VerifyingOrganization','AcquisitionComments','AcquisitionDeviceProcessingDescription','AcquisitionProtocolDescription','AcquisitionTime','AdditionalPatientHistory','AdmittingDiagnosesCodeSeq','AdmittingDiagnosesDescription','AdmittingTime','Allergies','BurnedInAnnotation','ContentTime','EthnicGroup','IdentifyingComments','ImageComments','InterpretationDiagnosisDescription','InterpretationText','Occupation','PatientAge','PatientComments','PatientSex','PatientSexNeutered','PatientSize','PatientState','PatientWeight','PerformedStationAET','PerformedStationGeoLocCodeSeq','PerformedStationNameCodeSeq','PlateID','privategroups','ReasonForImagingServiceRequest','ReasonforStudy','RefSOPClassUID','RequestedProcedureComments','RequestedProcedureDescription','ResultComments','ScheduledStationGeographicLocCodeSeq','ScheduledStationName','ScheduledStationNameCodeSeq','ScheduledStudyLocation','ScheduledStudyLocationAET','SmokingStatus','SpecialNeeds','SPSDescription','SPSEndTime','SPSLocation','SPSStartTime','StudyComments','StudyDescription','StudyTime','unspecifiedelements','VisitComments'};

    for i = 3:num_sub_fold
        sub_fold(i).name;
        
        name_of_subdir = strcat(main_fold,'/');
        name_of_subdir = strcat(name_of_subdir,sub_fold(i).name);
        name_of_subdir = strcat(name_of_subdir,'/');
        dicom_files = dir(name_of_subdir);
        
        num_dicom_files = length(dicom_files);
        
        new_folder_save = strcat(save_dir,sub_fold(i).name);
        new_folder_save = strcat(new_folder_save,'/');
        
        mkdir(new_folder_save)
        
        for j = 3:num_dicom_files
            if ismember(sub_fold(i).name,dicom_files(j).name);
                dir_of_dicom = strcat(name_of_subdir,dicom_files(j).name);
                dicom_metatags = dicominfo(dir_of_dicom);
                file_info_tags = dicom_metatags.ManufacturerModelName;
                file_info_tags = strcat(file_info_tags,dicom_metatags.Manufacturer);
                file_info_tags = strcat(file_info_tags,num2str(dicom_metatags.Height));
                file_info_tags = strcat(file_info_tags,num2str(dicom_metatags.Width));
                img = dicomread(dir_of_dicom);
                sz = size(img);
                field = fieldnames(dicom_metatags);
                for k = 1:length(dicom_tags_phi)
                    
                    if(ismember(field,dicom_tags_phi{k}))
                        dicom_metatags = rmfield(dicom_metatags,dicom_tags_phi{k});
                    end
                end
                
                %%%% INSERT THE MANUFACTURER INFO BASED MASKING RULES HERE
                
                if(strcmp(file_info_tags,'Vivid7GE Vingmed Ultrasound480640'))
                    if(length(sz)==4)
                        implay(img);
                        img(1:23,1:172,:,:) = 0;
                        implay(img);
                    end
                    
                    if(length(sz)==3)
                        img(1:45,:,:)=0;
                    end
                end
                
                if(strcmp(file_info_tags,'Vivid7GE Vingmed Ultrasound434636'))
                    if(length(sz)==4)
                        implay(img);
                        img(1:24,1:174,:,:) = 0;
                        implay(img);
                    end
                    
                    if(length(sz)==3)
                        img(1:45,:,:)=0;
                    end
                end

                if(strcmp(file_info_tags,'Vivid7GE Vingmed Ultrasound'))
                    if(length(sz)==4)
                        implay(img);
                        img(1:23,1:172,:,:) = 0;
                        implay(img);
                    end
                    
                    if(length(sz)==3)
                        img(1:45,:,:)=0;
                    end
                end

                if(strcmp(file_info_tags,'Vivid iGEMS Ultrasound600800'))
                    if(length(sz)==4)
                        implay(img);
                        img(1:23,1:174,:,:) = 0;
                        implay(img);
                    end
                    
                    if(length(sz)==3)
                        img(1:33,:,:)=0;
                    end
                end

                if(strcmp(file_info_tags,'Vivid iGEMS Ultrasound422636'))
                    if(length(sz)==4)
                        implay(img);
                        img(1:23,1:172,:,:) = 0;
                        implay(img);
                    end
                    
                    if(length(sz)==3)
                        img(1:33,:,:)=0;
                    end
                end

                if(strcmp(file_info_tags,'Vivid iGEMS Ultrasound458640'))
                    if(length(sz)==4)
                        implay(img);
                        img(1:24,1:172,:,:) = 0;
                        implay(img);
                    end
                    
                    if(length(sz)==3)
                        img(1:33,:,:)=0;
                    end
                end

                if(strcmp(file_info_tags,'Vivid iGEMS Ultrasound'))
                    if(length(sz)==4)
                        implay(img);
                        img(1:24,1:172,:,:) = 0;
                        implay(img);
                    end
                    
                    if(length(sz)==3)
                        img(1:33,:,:)=0;
                    end
                end

                if(strcmp(file_info_tags,'SEQUOIAACUSON480640'))
                    if(length(sz)==4)
                        implay(img);
                        img(1:35,:,:,:) = 0;
                        implay(img);
                    end
                    
                    if(length(sz)==3)
                        img(1:65,:,:)=0;
                    end
                end


                if(strcmp(file_info_tags,'SequoiaSiemens Medical Solutions'))
                    if(length(sz)==4)
                        implay(img);
                        img(1:35,:,:,:) = 0;
                        implay(img);
                    end
                    
                    if(length(sz)==3)
                        img(1:65,:,:)=0;
                    end
                end


            end
            
            dicomwrite(img,strcat(new_folder_save,dicom_files(j).name),dicom_metatags,'CreateMode','copy');
            
        end
        
        
        
        
    end
    
    
end
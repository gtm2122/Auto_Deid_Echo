function [x] = rem_tags(main_dir,dest)
%%% USED TO REMOVE ALL DICOM PHI METATAGS
main_dir

dicom_tags = {'AcquisitionContextSeq','ActualHumanPerformersSequence','AdmissionID','Arbitrary','AuthorObserverSequence','BranchOfService','ConfidentialityPatientData','ContentCreatorsIdCodeSeq','ContentSeq','CountryOfResidence','CurrentPatientLocation','curves','CustodialOrganizationSeq','DataSetTrailingPadding','DigitalSignaturesSeq','DigitalSignatureUID','DistributionAddress','DistributionName','GraphicAnnotationSequence','HumanPerformersName','HumanPerformersOrganization','IconImageSequence','ImagePresentationComments','InstitutionAddress','InstitutionalDepartmentName','InstitutionCodeSequence','InstitutionName','InsurancePlanIdentification','IntendedRecipientsOfResultsIDSequence','InterpretationApproverSequence','InterpretationAuthor','InterpretationIdIssuer','InterpretationRecorder','InterpretationTranscriber','IssuerOfAdmissionID','IssuerOfPatientID','IssuerOfServiceEpisodeId','MAC','MedicalRecordLocator','MilitaryRank','ModifiedAttributesSequence','ModifiedImageDescription','ModifyingDeviceID','ModifyingDeviceManufacturer','NameOfPhysicianReadingStudy','NamesOfIntendedRecipientsOfResults','OperatorName','OperatorsIdentificationSeq','OrderCallbackPhoneNumber','OrderEnteredBy','OrderEntererLocation','OriginalAttributesSequence','OtherPatientIDs','OtherPatientIDsSeq','OtherPatientNames','overlays','ParticipantSequence','PatientAddress','PatientBirthName','PatientBirthTime','PatientInstitutionResidence','PatientInsurancePlanCodeSeq','PatientMotherBirthName','PatientPhoneNumbers','PatientPrimaryLanguageCodeSeq','PatientPrimaryLanguageModifierCodeSeq','PatientReligiousPreference','PatientTransportArrangements','PerformedLocation','PerformingPhysicianIdSeq','PerformingPhysicianName','PersonAddress','PersonIdCodeSequence','PersonTelephoneNumbers','PhysicianApprovingInterpretation','PhysicianOfRecord','PhysicianOfRecordIdSeq','PhysicianReadingStudyIdSeq','PPSID','RefDigitalSignatureSeq','ReferencedPatientAliasSeq','ReferringPhysicianAddress','ReferringPhysicianPhoneNumbers','ReferringPhysiciansIDSeq','RefImageSeq','RefPatientSeq','RefPPSSeq','RefSOPInstanceMACSeq','RefStudySeq','RegionOfResidence','RequestAttributesSeq','RequestedProcedureID','RequestedProcedureLocation','RequestingPhysician','RequestingService','ResponsibleOrganization','ResponsiblePerson','ResultsDistributionListSeq','ResultsIDIssuer','ReviewerName','ScheduledHumanPerformersSeq','ScheduledPatientInstitutionResidence','ScheduledPerformingPhysicianIDSeq','ScheduledPerformingPhysicianName','ServiceEpisodeID','SourceImageSeq','StationName','StudyIDIssuer','TextComments','TextString','TimezoneOffsetFromUTC','TopicAuthor','TopicKeyWords','TopicSubject','TopicTitle','VerifyingObserverIdentificationCodeSeq','VerifyingObserverSequence','VerifyingOrganization','AcquisitionComments','AcquisitionDeviceProcessingDescription','AcquisitionProtocolDescription','AcquisitionTime','AdditionalPatientHistory','AdmittingDiagnosesCodeSeq','AdmittingDiagnosesDescription','AdmittingTime','Allergies','BurnedInAnnotation','ContentTime','EthnicGroup','IdentifyingComments','ImageComments','InterpretationDiagnosisDescription','InterpretationText','Occupation','PatientAge','PatientComments','PatientSex','PatientSexNeutered','PatientSize','PatientState','PatientWeight','PerformedStationAET','PerformedStationGeoLocCodeSeq','PerformedStationNameCodeSeq','PlateID','privategroups','ReasonForImagingServiceRequest','ReasonforStudy','RefSOPClassUID','RequestedProcedureComments','RequestedProcedureDescription','ResultComments','ScheduledStationGeographicLocCodeSeq','ScheduledStationName','ScheduledStationNameCodeSeq','ScheduledStudyLocation','ScheduledStudyLocationAET','SmokingStatus','SpecialNeeds','SPSDescription','SPSEndTime','SPSLocation','SPSStartTime','StudyComments','StudyDescription','StudyTime','unspecifiedelements','VisitComments'};
list_dir_main = dir(main_dir)
count = 0;
man_list = [];
%used = {'0M7ZR6M9', '0KXV1NTZ', '0M7ZDDAC', '0KXSTQWG', '0M7CV8VT', '0M7ESBJ3', '0KXEINK4', '0KXKJQRJ', '0M7Y2_6H', '0KXFB98O', '0KXM1017', '0KXHS2C_', '0KXSXOZV', '0KXQEWTU', '0KXHG82S', '0KXO01R7', '0KXUC_7U', '0M7DA18F', '0M71FS0F', '0KXKTL_1', '0M7HE1SJ', '0M70F952', '0KXJJ7W6', '0KXJ3FIK', '0KXCJLV4', '0M7ACGPS', '0KXOXMJ5', '0M7I2QDO', '0KXDI4OS', '0KXSPST1', '0M797_R0', '0KXNP7G_', '0KXS9_FF', '0KXSZO0K', '0KXHQ3BA', '0M7DD_BU', '0M70X0KE', '0KXCZE7R', '0M7ZFCC1', '0KXDZX33', '0M7B71G0', '0M7EY8O7', '0KXONRAN', '0KXWC0XU', '0KXQUP6G', '0KXWF_08', '0M7903K7', '0KXDO1TW', '0M7HRW3G', '0KXSJVNY', '0KXUEZ9J', '0M7E8L22', '0M7HVU6V', '0M7YSNSM', '0KXTU8RT', '0M707CZ9', '0M717VUM', '0M7H84NF', '0M7GVBBI', '0M79VPAG', '0KXRR8ZE', '0KXEYFXR', '0M79HVZJ', '0M7I_A5M', '0KXP2JO9', '0KXUYPQK', '0KXRDFNH', '0KXUGYB8', '0M7DFZDJ', '0KXISL8C', '0KXKFSO4', '0KXJ__AI', '0M7XY21D', '0KXMKRI8', '0KXN3HZ9', '0KXT8J92', '0M7CZ6Z7', '0M7_20WH', '0M7B33CM', '0M70BB1O', '0M7GDJX6', '0M7YKRLT', '0KXFH6DS', '0M7BYP2V', '0KXLCCG2', '0KXCVG4C', '0M7Y6Y9W', '0M799ZSQ', '0KXION4Y', '0KXJR41_', '0KXN1IXK', '0KXV7KZ2', '0M7X_132', '0M7A6JKO', '0KXC1UFT', '0KXE2V6I', '0KXGHP94', '0KXK5XFM', '0M7_5ZZW', '0M7E4MZO', '0KXU914F', '0M7GBKVH', '0M7GRD83', '0M7FF02J', '0KXHO49L', '0M7D251M', '0M7HC2QU', '0KXLW2X3', '0KXW44R0', '0KXMMQJY', '0M70N5BW', '0M7Z7G58', '0M7HNY01', '0KXQ31JM', '0KXO9XZQ', '0KXCHMTF', '0M7H27IB', '0KXPIC0W', '0KXU722Q', '0M7EAK3S', '0KXW63SQ', '0KXTAIAS', '0KXU_OS9', '0M7DJXGY', '0KXUWQOV', '0KXJP50A', '0KXDE6LD', '0M7YEUGP', '0M7G3OOO', '0KXIATU0', '0M7G7MS2', '0M7GHH_L', '0KXN7G1O', '0KXRFEP6', '0KXFN3IW', '0KXNJABW', '0M7FKY7N', '0M7GXAD7', '0KXKDTMF', '0M7HH_VY', '0M79NT3N', '0M7EMED_', '0KXVV9II', '0M7Y4Z86', '0KXSFXKJ', '0KXN5G_Z', '0M7F35TB', '0M7G9LTS', '0KXH2ERV', '0KXVDI36', '0KXI8USB', '0KXNZ2PI', '0KXDXY1E', '0M7941NM', '0KXPW5CT', '0KXS238M', '0KXQ_MBK', '0KXODW24', '0M7AW75T', '0KXKPNWN', '0M70T2G_', '0KXGVIL1', '0KXPU6B3', '0KXLY1YT', '0M7FMX9C', '0KXOBX0F', '0KXFD8AD', '0M713XR7', '0M7H46K0', '0KXUB064', '0M7F16RM', '0KXIWJBR', '0M7AS92E', '0KXLI9L6', '0KXL_0_I', '0M719UWB', '0KXTEGE6', '0M7D05_X', '0KXDG5N2', '0M7FWSHV', '0M7ZN8IV', '0M7GNF4P', '0KXO20SX', '0KXGLNCJ', '0KXSNTRC', '0M7FIZ5Y', '0KXM6Y6B', '0M7DPUM1', '0KXOFV3U', '0M7BEYMU', '0KXJV25E', '0KXIKP1J', '0M7GPE6E', '0KXUIXCY', '0KXQAYQF', '0KXNN8FA', '0KXE8SBM', '0KXL2H7K', '0KXG3VY7', '0M7AQA0P', '0KXLU3VE', '0M7YQOQX', '0M7AMBYA', '0KXKNOUY', '0KXKRMYC', '0KXMSNP1', '0KXUURN5', '0KXF3D1V', '0M7YWLW0', '0KXD2CB5', '0KXUOUI1', '0KXGJOAU', '0M79RR71', '0KXR1LD9', '0KXH6CV9', '0KXQCXS4', '0KXSLUPN', '0M7IUD0I', '0KXCBPOB', '0M79ZNDV', '0M709B_Z', '0M7ZZ2T2', '0KXGTJJC', '0M7BSRYR', '0KXJT33P', '0KXL4G99', '0KXPKB2L', '0KXO3_UM', '0M7D6350', '0KXM4Z4M', '0M7IQEY3', '0M7FG_48', '0KXMQONC', '0KXJ5EK9', '0KXMGTEU', '0M7IWC27', '0M70J78H', '0M7HLYZC', '0KXF7B59', '0M7922LX', '0KXUQTJR', '0KXNX3NT', '0M7A2LH9', '0M7E0OW9', '0KXP0KMK', '0KXIGQZ4', '0KXP6HRO', '0KXLK8MW', '0KXDR_XA', '0KXIMO38', '0M79LU1Y', '0M7BWQ15', '0KXTIEHL', '0M7EKFCA', '0KXH4DTK', '0KXIYIDG', '0KXOLS8Y', '0KXI0YLI', '0KXHX_I3', '0KXESISN', '0KXJZ08T', '0KXNT5KE', '0KXT6K7D', '0M78R8BP', '0KXTY6V7', '0KXK3YDX', '0KXCTH2N', '0M7FOWB1', '0KXOZLKV', '0M7IYB3X', '0KXN9F3D', '0M7YCVE_', '0KXGRKHN', '0M7HTV55', '0KXE0W4T', '0KXMEUD4', '0M70R3FA', '0KXFF7C2', '0M7ZP7KK', '0M7ISDZT', '0KXFWZRE', '0M7CNCO_', '0M7IMGUP', '0KXMWLSG', '0M7C3M7Z', '0KXGZGOG', '0M7BUQ_G', '0KXHAAYO', '0KXKVL0R', '0KXWHZ1Y', '0KXNBE52', '0KXE6T9X', '0M7_7Z0L', '0M7A4KIZ', '0KXWJY3N', '0M7XW2_O', '0KXTGFFW', '0KXEOKP8', '0M7EUAKT', '0KXQ12HX', '0KXF5C3K', '0M7Z1J04', '0KXNL9DL', '0KXHE912', '0KXUKWEN', '0M7DVRR5', '0M7HZSA9', '0M7I6OH2', '0M79JV08', '0KXEUHUC', '0KXEQJQY', '0KXOPQCC', '0M7E6M0D', '0M71BTY0', '0KXM8X80', '0KXJH8UH', '0KXPQ87P', '0M7YUMUB', '0M7IOFWE', '0M7DC0A4', '0KXV3MVO', '0M7B_O4K', '0KXDTZY_', '0KXQQR31', '0M79PS5C', '0KXKZJ45', '0KXI4WOX', '0KXK1ZC7', '0KXR5JGO', '0KXSDYIU', '0KXCDOQ0', '0M70P4DL', '0KXSHWM8', '0KXVTAGT', '0M7EW9MI', '0M78V6F3', '0KXD89G9', '0M78X5GT', '0KXS046X', '0KXRT803', '0KXMAW9Q', '0M7AEFRH', '0KXV5LXD', '0KXLGAJH', '0KXDC7JO', '0M7EGH8W', '0KXTOBMP', '0KXL0I5V', '0M7BOTVC', '0KXC7RKX', '0KXTCHCH', '0M7AAHO2', '0KXNV4M3', '0M7CDHGH', '0M7YMQNI', '0M70H86S', '0M7HJZXN', '0KXJ1GGV', '0M7Y104S', '0KXU14YM', '0KXSBZH4', '0M7F92YF', '0KXRHDQW', '0M7F_QL9', '0KXI6VQM', '0M7DZPUK', '0KXHC9_D', '0KXHW0GE', '0KXSVPY5', '0KXPCEWS', '0KXTMCK_', '0M7FYRJK', '0M7H08GM', '0KXSRRUR', '0KXJDAR2', '0KXKXK2G', '0KXDQ0VL', '0KXLO6QA', '0KXKHRPU', '0M7BKVRY', '0KXQ6_N0', '0KXQGVVJ', '0M7BQSX1', '0M7ZV4PO', '0M7I0RBZ', '0M7EEI76', '0M7BA_JF', '0M7YAWDA', '0M7AKCWL', '0M7_9Y2A', '0M7I8NIS', '0KXTQAOE', '0M7F73WQ', '0M7C1N69', '0KXECQF0', '0KXGPLFY', '0KXGFQ7F', '0KXK7WHB', '0M7HG0U8', '0M7ECJ5H', '0KXVHG6L', '0KXEARDB', '0M7E_7PX', '0KXRX63I', '0KXNDD6S', '0KXS42AB', '0M78T7DE', '0M7YYKXQ', '0KXD6AEK', '0M7HXT8K', '0KXG7U0M', '0M70L6A6', '0M70_ZNT', '0KXVX8K7', '0KXRLBUA', '0KXR9HK2', '0KXIERXF', '0KXPEDYH', '0M7_BX3_', '0KXLM7OL', '0M7CRASE', '0KXORPE1', '0M7Z9F6Y', '0KXOTOFR', '0KXVZ7LX', '0KXDM2S6', '0KXIIP_U', '0KXR7IID', '0KXICSVQ', '0M703EVV', '0KXKLPT8', '0KXNR6IP', '0KXJL6XW', '0M7FD10U', '0KXLADED', '0KXQOS1C', '0M7YISK3', '0M7Y8XBL', '0KXD4BCV', '0M7FB1_4', '0M7DLWIN', '0M7A0MFK', '0KXTW7TI', '0KXF9A6Z', '0KXT_5WX', '0M7ZJAFG', '0KXC5SJ7', '0M7D826Q', '0KXC9QMM', '0KXP8GTD', '0KXCPI_8', '0M7B52EB', '0KXCLKWU', '0KXCRI0Y', '0M7DRTNR', '0KXQKTYY', '0KXDVY_P', '0KXRZ557', '0KXT2M3Z', '0KXG1WWI', '0M70V1IP', '0KXJF9SS', '0KXJ9CNO', '0KXEEPGQ', '0KXCXF61', '0M7A8IMD', '0M711YPI', '0KXDA8HZ', '0KXLS4TP', '0M7YOPP7', '0KXGNME8', '0KXLEBHS', '0M7EIGAL', '0KXGBS40', '0M7CJELL', '0M79DXW4', '0M7_3_Y6', '0KXLQ5R_', '0KXS61C0', '0M7FUTG5', '0M7CFGI6', '0KXRJCSL', '0KXFU_PP', '0M7B90HQ', '0KXRV71T', '0KXI2XN7', '0KXT0N29', '0KXEWGW1', '0M7D443B', '0KXG9T2B', '0M70DA3D', '0KXCFNRQ', '0M7IIIRA', '0M7BGXOJ', '0KXL6FAZ', '0KXP4IPZ', '0KXW82UF', '0M78Z4II', '0M79BYUF', '0KXHI74H', '0KXVRBF3', '0M7HA3P4', '0M7CLDNA', '0KXW25PB', '0M7YGTIE', '0M7DHYF8', '0M7H65LQ', '0KXQWO85', '0KXVLE9_', '0M7EQCHE', '0KXPS79E', '0KXJBBPD', '0M7ZL9H5', '0M7GFIYW', '0KXVJF8A', '0M7BIWQ8', '0KXT4L5O', '0KXHZZJT', '0M7CT9U3', '0M7B14AX', '0KXFL4H6', '0KXQ8ZOQ', '0KXJ7DLZ', '0M7G5NQD', '0M7GJH1A', '0KXCNJYJ', '0KXQ50LB', '0KXL8ECO', '0M7ZBE8N', '0KXWA1W4', '0KXKBUKQ', '0KXHM57W', '0KXVPCDE', '0KXFR1MA', '0KXF1E05', '0KXS80DQ', '0M7DXQSV', '0KXUMVGC', '0M7A_597', '0KXJN5ZL', '0M7Z5H3J', '0KXD0D9G', '0KXPO95_', '0M70Y_M3', '0M7G1PMZ', '0KXPGC_6', '0KXG5UZX', '0M7C5L9O', '0M7CHFJW', '0M7AIDUW', '0M7FQVCR', '0KXQIUX8', '0M7AY67I', '0KXM2_2X', '0KXF_XUT', '0KXC3THI', '0M7_01US', '0KXQYN9V', '0KXWD_ZJ', '0M7ZX3RD', '0M7IGJPL', '0M7ZHBDR', '0KXGDR5Q', '0KXVFH4W', '0KXNFC8H', '0M7I4PFD', '0KXWLX5C', '0M7E2NXZ', '0KXMUMQR', '0M7CX7XI', '0KXTKDJA', '0KXH0FQ5', '0KXEGOIF', '0M79XOC5', '0KXRBGLS', '0M705DXK', '0KXO7YY0', '0KXNHBA6', '0M7GZ9EX', '0KXFYYT3', '0KXPY4EI', '0M7AGET6', '0KXOVNHG', '0M7DTSPG', '0KXU5310', '0M7GTC9T', '0KXPMA4A', '0M7Y_JZF', '0M7CBIES', '0KXJX173', '0M7DNVKC', '0KXFT0N_', '0M7C7KBD', '0M7CPBQP', '0M715WSX', '0KXK9VJ0', '0KXM_JVV', '0KXIQM6N', '0KXV9J_S', '0M7IAMKH', '0KXR3KEZ', '0M7ICLM6', '0M79TQ8R', '0M7AU843', '0M7FSUEG', '0KXOHU5J', '0M7C9JD2', '0KXW06NM', '0M7BCZL4', '0KXVBJ1H', '0M7ZT5NZ', '0KXTS9Q3', '0KXEKMLU', '0KXFJ5FH', '0M79FWXU', '0M7GLG2_', '0KXI_HF5', '0M71DSZQ', '0KXU33_B', '0KXP_3G7', '0M7IKHS_', '0KXGXHMR', '0M7EODFP', '0KXMISGJ', '0KXRP9XP', '0M7Z3I1U', '0KXQSQ4R', '0M7960PB', '0KXUSSLG', '0KXE_EZG', '0KXO5ZWB', '0KXEMLNJ', '0M7F54V0', '0KXIUKA1', '0M7AOAZ_', '0KXVNDBP', '0KXHU1EP', '0M7HPX1R', '0M7IEKNW', '0KXMYKU5', '0KXMCVBF', '0M6_WIP1', '0KXRNAV_', '0KXFP2KL', '0KXH8BWZ', '0KXHK666', '0KXOJT78', '0KXDK3QH', '0KXE4U87', '0KXQMS_N', '0KXPAFV2', '0KXMOPLN', '0M7BMUTN'}
used= {}
% try
%     mkdir(dest)
% catch
%     aaaaa=1
% end
dest = strcat(dest,'/')
for i = 1:length(list_dir_main);
    list_dir_main(i).name
    %not(sum(ismember(used,list_dir_main(i).name))) and 
    if(not (sum(ismember(list_dir_main(i).name,'.'))) && not(sum(ismember(used,list_dir_main(i).name))) )
        list_dir_main(i).name;
        count=count+1;
        
        cat1 = strcat(main_dir,'/'); 
        cat2 = strcat(cat1,list_dir_main(i).name);
        cat2 = strcat(cat2,'/DICOM/');
        list_dir_2 = dir(cat2);
        
        cat4 = strcat(dest,list_dir_main(i).name);
        cat5 = strcat(cat4,'/');
        try
            mkdir(cat5);
        catch
           aaaaa=0
        end
        try
            
            for j = 1:length(list_dir_2);
                %cat3 = strcat(cat2,'/DICOM/')
                cat3 = strcat(cat2,list_dir_2(j).name);

                if(not(strcmp(list_dir_2(j).name,'.')) && not(strcmp(list_dir_2(j).name,'..')) )
                    list_dir_2(j).name;
                    cat3;
                    im = dicomread(cat3);
                    im_info = dicominfo(cat3);


                    field = fieldnames(im_info);
                    for K  = 1:length(field);


                        if sum(ismember(dicom_tags,field{K}));
                            im_info = rmfield(im_info,field{K});
                        endfunction thefunc()

dirs = '/data/Gabriel_De_id_11_27_2017/0M7FG_48/';
save_dir = '/data/gabriel/AUTODEID/dms/'
file_n = dir(dirs);

sz = length(file_n);

for i = 1:sz
    if(length(file_n(i).name)>3);
        name_of_d = strcat(dirs,file_n(i).name);
        name_of_d;
        save_d = strcat(save_dir,file_n(i).name);
        img = dicomread(name_of_d);
        sz = size(img)
        if length(sz)==4;
            for j = 1:sz(4);
                numm = num2str(j);
                save_dir3 = strcat(save_dir,numm);
                save_dir2 = strcat(save_dir3,'.bmp')
                save_dir2
                imwrite(img(:,:,:,j),save_dir2)
            end
        else
            %save_dir = strcat(save_d,numm);
            save_dir2 = strcat(save_d,'.bmp')
            imwrite(img,save_dir2)
        end
    end
end

end

                    end

                    cat6 = strcat(cat5,list_dir_2(j).name);
                    cat6;
                    dicomwrite(im,cat6,im_info,'CreateMode','copy');


                end

            end
        catch
            aaaa=0
        end
    end
end
%im_info
%count
%man_list
end
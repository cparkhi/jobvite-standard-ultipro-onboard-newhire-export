%dw 1.0
%output application/java 
%var candidate = flowVars.currentCandidate
%var application = candidate.application
%var job = candidate.application.job
%var manager = job.primaryHiringManager

---

{
//CANDIDATE Standard Fields
"Candidate_Id":candidate.eId,
"Candidate_Title":candidate.title,
"Candidate_FirstName": candidate.firstName,
"Candidate_LastName":  candidate.lastName,
"Candidate_Email":     candidate.email,
"Candidate_HomePhone": candidate.homePhone,
"Candidate_WorkPhone": candidate.workPhone,
"Candidate_CellPhone": candidate.mobile,
"Candidate_Address":    candidate.address,
"Candidate_Address2":  candidate.address2,
"Candidate_City":      candidate.city,
"Candidate_ZipCode":   candidate.postalCode,
"Candidate_State":     candidate.stateCode,
"Candidate_Country":   candidate.countryCode,
"Candidate_Race":	   candidate.race,

//APPLICATION  Standard Fields
"Application_Id" : application.eId,
"Application_HireDate":((application.hireDate as :number /1000) as :datetime as :string {format: "yyyy/MM/dd"}) default "",
"Application_StartDate":((application.startDate as :number /1000) as :datetime as :string {format: "yyyy/MM/dd"}) default "",
"Application_VeteranStatus":application.veteranStatus,
"Application_Gender":application.gender,

// REQUISITION Standard Fields
"Job_Company":         job.company,
"Job_RequisitionId":   job.requisitionId,
"Job_Title": 		   job.title,
"Job_JobType":         job.jobType,
"Job_Department":      job.department,
"Job_Location":        job.location,

// HIRING MANAGER Standard Fields
"PrimaryHiringManager_EmployeeID": manager.employeeId,
"PrimaryHiringManager_FirstName":  manager.firstName,
"PrimaryHiringManager_LastName":   manager.lastName,
"PrimaryHiringManager_Email":      manager.userName 

}

++

flowVars.appCustomFields map (c) -> {
	("CustomField"):(application.customField filter $.fieldCode == c.fieldCode)[0].value default "" }

++
	
flowVars.jobCustomFields map (c) -> {
	((c.displayName) as :string):(application.job.customField filter $.fieldCode == c.fieldCode)[0].value default "" }


	

	
																  
																  													  



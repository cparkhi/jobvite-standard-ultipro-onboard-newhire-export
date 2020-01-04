%dw 1.0
%output application/java
---
{
    "type": "https://www.ultimatesoftware.com/error.onboarding.validation-error",
    "title": "One or more validation errors have occurred",
    "errors": {
        "modelState": {
            "pastStartDateReason": [
                {
                    "type": "error.onboarding.new-hires.past-start-date-reason.required",
                    "message": "Past start date reason is required when start date is 4 or more business days in the past."
                }
            ],
            "job.componentCompany": [
                {
                    "type": "error.onboarding.new-hires.job.component-company.invalid",
                    "message": "Component company is invalid."
                }
            ]
        },
        "general": null
    }
}
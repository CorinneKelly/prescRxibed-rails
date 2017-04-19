# README

Taking control of Prescriptions
    - scheduling
    - tracking symptoms

    Other
    - drug interaction
    - Doctors View

Login

Adding Drugs:
    - Drug Name
    - Start Date
    - Expiration Date (optional)
    - End Date
    - Quantity (for refill reminder)
    - Instructions
    - Dosage
    - Refills Allowed
    - Scheduling Component
    - Symptoms to Track (optional)
    - Doctor

Scheduling:
    - Setting schedule
        - ongoing use - daily, morning/afternoon/evening, weekly
        - as needed - reminder on when it is ok to take next
    - Connect to Calendar
    - Refill reminder


Tracking Symptoms:
    - Enter Symptoms:
        - 1-5 scale
        - text 140
        - pictures
    - Render symptom view
        - scale is graph
        - text is log
        - pictures


Data:
Accounts
Name | Password (OAUTH)

Drugs
Name | API INFO

Prescriptions (join table)
AccountID | DrugID  | ScheduleID | Dosage | Instructions | Expiration Date (optional) | Quantity | uom | RefillsAllowed | Doctor

pills:
Quantity: 60
Dosage: 2

syrup
Quantity: 200
Dosage: 20




Schedule
Type (onGoing or AsNeeded) | Start Date (default to today) | AsNeeded Time Restriction (optional) | onGoing Frequency (daily, weekly, monthly) | Hours | Days | Weeks

or CronJobs

Symptoms
PrescriptionID | Name

Symptom Log
SymptomsID | Rating | Description | Picture | timeStamp





Logic:

if start date is in the past:
    quantity is total
    prompt for how many have taken
    save quantity as leftover
    don’t set past reminders


if daily
    Hours Component
    Save hours as array
if weekly
    Days Component
    save days in array
    Hours Component
    save hours of day
if monthly
    Weekly Component
    save weeks in array

Add link to calendar for Symptom
